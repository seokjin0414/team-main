CREATE TABLE team1_user(
	user_id VARCHAR(30) PRIMARY KEY,
    user_pw VARCHAR(30) NOT NULL,
    user_first_name VARCHAR(30) NOT NULL,
    user_last_name VARCHAR(30) NOT NULL,
    user_phone VARCHAR(20) NOT NULL,
    user_address VARCHAR(50) NOT NULL
);

CREATE TABLE team1_user_auth(
    user_id VARCHAR(30) NOT NULL,
    user_auth VARCHAR(30) DEFAULT "ROLE_USER" NOT NULL,
PRIMARY KEY (user_id, user_auth),    
CONSTRAINT user_auth_user_id
FOREIGN KEY (user_id) REFERENCES team1_user(user_id) ON DELETE CASCADE
);

delimiter \
CREATE TRIGGER trigger_user_auth_set
AFTER INSERT ON team1_user
FOR EACH ROW
BEGIN 
INSERT INTO team1_user_auth
SET user_id = NEW.user_id; 
END;
\
delimiter;


CREATE TABLE team1_user_account(
	user_account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(30) NOT NULL,
    user_account_name VARCHAR(15),
    user_account_susd DECIMAL(65,4) DEFAULT 0 NOT NULL,
    user_account_bitcoin DECIMAL(65,4) DEFAULT 0 NOT NULL,
    user_account_from_date TIMESTAMP DEFAULT NOW() NOT NULL,
    user_account_to_date TIMESTAMP DEFAULT '2038-01-18 23:59:59'  NOT NULL,
CONSTRAINT check_user_account CHECK(user_account_susd >= 0 AND user_account_bitcoin >= 0),
CONSTRAINT user_account_user_id 
FOREIGN KEY (user_id) REFERENCES team1_user(user_id) ON DELETE CASCADE     
);

-- 임시 team1_user_account_bitcoin
-- CREATE TABLE team1_user_account_bitcoin(
-- 	user_account_bitcoin_id INT PRIMARY KEY AUTO_INCREMENT,
--     user_account_id INT NOT NULL,
--     user_id VARCHAR(30) NOT NULL,
--     account_bitcoin DECIMAL(65,4) DEFAULT 0 NOT NULL,
-- CONSTRAINT user_account_bitcoin_user_account_id 
-- FOREIGN KEY (user_account_id) REFERENCES team1_user_account(user_account_id) ON DELETE CASCADE,
-- CONSTRAINT user_account_bitcoin_user_id 
-- FOREIGN KEY (user_id) REFERENCES team1_user(user_id) ON DELETE CASCADE
-- );

CREATE TABLE team1_trade_buy(
	trade_buy_id INT PRIMARY KEY AUTO_INCREMENT,
    user_account_id INT NOT NULL,
    trade_buy_class VARCHAR(20) NOT NULL,
    trade_buy_price DECIMAL(65,4) NOT NULL,
    trade_buy_quota DECIMAL(16,4) NOT NULL,
    trade_buy_completed DECIMAL(16,4)  DEFAULT 0 NOT NULL,
    trade_buy_remaining DECIMAL(16,4) NOT NULL,
    trade_buy_from_date TIMESTAMP DEFAULT NOW() NOT NULL,
    trade_buy_state ENUM('처리중', '완료', '주문취소') DEFAULT '처리중' NOT NULL,
CONSTRAINT check_trade_buy CHECK (0 <=trade_buy_remaining <= trade_buy_quota AND 0 <= trade_buy_completed <= trade_buy_quota),    
CONSTRAINT trade_buy_user_account_id 
FOREIGN KEY (user_account_id) REFERENCES team1_user_account(user_account_id) ON DELETE CASCADE  
);

delimiter \
CREATE TRIGGER trigger_trade_buy_user_account_susd
BEFORE INSERT ON team1_trade_buy
FOR EACH ROW 
BEGIN
UPDATE team1_user_account 
SET user_account_susd = user_account_susd - (NEW.trade_buy_price * NEW.trade_buy_quota) 
WHERE user_account_id = NEW.user_account_id;
END;
\
delimiter ;

CREATE TRIGGER trigger_trade_buy_remaining
BEFORE UPDATE ON team1_trade_buy
FOR EACH ROW SET NEW.trade_buy_remaining = NEW.trade_buy_quota - NEW.trade_buy_completed;

delimiter \
CREATE TRIGGER trigger_trade_buy_state
BEFORE UPDATE ON team1_trade_buy
FOR EACH ROW 
BEGIN
IF (NEW.trade_buy_state != '주문취소' AND NEW.trade_buy_remaining = 0) 
	THEN SET NEW.trade_buy_state = '완료';
ELSEIF (NEW.trade_buy_state = '주문취소')
	THEN UPDATE team1_user_account
    SET user_account_susd = user_account_susd + (NEW.trade_buy_price * NEW.trade_buy_remaining)
    WHERE user_account_id = NEW.user_account_id;
END IF;
END;
\
delimiter ;

CREATE TABLE team1_trade_sell(
	trade_sell_id INT PRIMARY KEY AUTO_INCREMENT,
    user_account_id INT NOT NULL,
    trade_sell_class VARCHAR(20) NOT NULL,
    trade_sell_price DECIMAL(65,4) NOT NULL,
    trade_sell_quota DECIMAL(16,4) NOT NULL,
    trade_sell_completed DECIMAL(16,4) DEFAULT 0 NOT NULL,
    trade_sell_remaining DECIMAL(16,4) NOT NULL,
    trade_sell_from_date TIMESTAMP DEFAULT NOW() NOT NULL,
    trade_sell_state ENUM('처리중', '완료', '주문취소') DEFAULT '처리중' NOT NULL,
CONSTRAINT check_trade_sell CHECK (0 <=trade_sell_remaining <= trade_sell_quota AND 0 <= trade_sell_completed <= trade_sell_quota),
CONSTRAINT trade_sell_user_account_id 
FOREIGN KEY (user_account_id) REFERENCES team1_user_account(user_account_id) ON DELETE CASCADE  
);

delimiter \
CREATE TRIGGER trigger_trade_sell_user_account_bitcoin
BEFORE INSERT ON team1_trade_sell
FOR EACH ROW 
BEGIN
UPDATE team1_user_account 
SET user_account_bitcoin = user_account_bitcoin - (NEW. trade_sell_quota) 
WHERE user_account_id = NEW.user_account_id;
END;
\
delimiter ;

CREATE TRIGGER trigger_trade_sell_remaining
BEFORE UPDATE ON team1_trade_sell
FOR EACH ROW SET NEW.trade_sell_remaining = NEW.trade_sell_quota - NEW.trade_sell_completed;

delimiter \
CREATE TRIGGER trigger_trade_sell_state
BEFORE UPDATE ON team1_trade_sell
FOR EACH ROW 
BEGIN
IF (NEW.trade_sell_state != '주문취소' AND NEW.trade_sell_remaining = 0) 
THEN SET NEW.trade_sell_state = '완료';
ELSEIF (NEW.trade_sell_state = '주문취소')
	THEN UPDATE team1_user_account
    SET user_account_bitcoin = user_account_bitcoin + NEW.trade_sell_remaining
    WHERE user_account_id = NEW.user_account_id;
END IF;
END;
\
delimiter ;


CREATE TABLE team1_trade_buy_conclusion(
	trade_buy_conclusion_id INT PRIMARY KEY AUTO_INCREMENT,
    user_account_id INT NOT NULL,
    trade_buy_id INT NOT NULL,
    trade_buy_conclusion_class VARCHAR(20) NOT NULL,
    trade_buy_conclusion_price DECIMAL(65,4) NOT NULL,
    trade_buy_conclusion_completed DECIMAL(16,4) NOT NULL,
    trade_buy_conclusion_from_date TIMESTAMP DEFAULT NOW() NOT NULL,
CONSTRAINT trade_buy_conclusion_user_account_id 
FOREIGN KEY (user_account_id) REFERENCES team1_user_account(user_account_id) ON DELETE CASCADE,
CONSTRAINT trade_buy_conclusion_trade_buy_id 
FOREIGN KEY (trade_buy_id) REFERENCES team1_trade_buy(trade_buy_id) ON DELETE CASCADE
);

CREATE TABLE team1_trade_sell_conclusion(
	trade_sell_conclusion_id INT PRIMARY KEY AUTO_INCREMENT,
    user_account_id INT NOT NULL,
    trade_sell_id INT NOT NULL,
    trade_sell_conclusion_class VARCHAR(20) NOT NULL,
    trade_sell_conclusion_price DECIMAL(65,4) NOT NULL,
    trade_sell_conclusion_count DECIMAL(65,4) NOT NULL,
    trade_sell_conclusion_from_date TIMESTAMP DEFAULT NOW() NOT NULL,
CONSTRAINT trade_sell_conclusion_user_account_id 
FOREIGN KEY (user_account_id) REFERENCES team1_user_account(user_account_id) ON DELETE CASCADE,
CONSTRAINT trade_sell_conclusion_trade_sell_id 
FOREIGN KEY (trade_sell_id) REFERENCES team1_trade_sell(trade_sell_id) ON DELETE CASCADE 
);

CREATE TABLE team1_notice(
	notice_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(30) NOT NULL,
    notice_title VARCHAR(30) NOT NULL,
    notice_text VARCHAR(500) NOT NULL,
    notice_from_date TIMESTAMP DEFAULT NOW() NOT NUll,
    notice_update_date TIMESTAMP DEFAULT NOW() NOT NUll,
CONSTRAINT notice_user_id 
FOREIGN KEY (user_id) REFERENCES team1_user(user_id) ON DELETE CASCADE
);

CREATE TABLE team1_free(
	free_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(30) NOT NULL,
	free_title VARCHAR(30) NOT NULL,
    free_text VARCHAR(500) NOT NUll,
    free_from_Date TIMESTAMP DEFAULT NOW() NOT NUll,
    free_update_date TIMESTAMP DEFAULT NOW() NOT NUll,
CONSTRAINT free_user_id 
FOREIGN KEY (user_id) REFERENCES team1_user(user_id) ON DELETE CASCADE    
);

CREATE TABLE team1_free_file(
	free_file_id INT PRIMARY KEY AUTO_INCREMENT,
	free_id INT NOT NULL,
    free_file_name VARCHAR(50) NOT NULL,
CONSTRAINT free_file_free_id 
FOREIGN KEY (free_id) REFERENCES team1_free(free_id) ON DELETE CASCADE	
);