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

CREATE TABLE team1_user_account(
	user_account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(30) NOT NULL,
    user_account_name VARCHAR(15),
    user_account_susd DECIMAL(65,4) DEFAULT 0 NOT NULL,
    user_account_bitcoin DECIMAL(65,4) DEFAULT 0 NOT NULL,
    user_account_from_date TIMESTAMP DEFAULT NOW() NOT NULL,
    user_account_to_date TIMESTAMP DEFAULT '2038-01-18 23:59:59'  NOT NULL,
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
    trade_buy_completed DECIMAL(16,4) CHECK (0 <= trade_buy_completed <=  trade_buy_quota) DEFAULT 0 NOT NULL,
    trade_buy_remaining DECIMAL(16,4) CHECK (0 <=trade_buy_remaining <= trade_buy_quota) NOT NULL,
    trade_but_from_date TIMESTAMP DEFAULT NOW() NOT NULL,
    trade_but_state ENUM('처리중', '완료', '주문취소') DEFAULT '처리중' NOT NULL,
CONSTRAINT trade_buy_user_account_id 
FOREIGN KEY (user_account_id) REFERENCES team1_user_account(user_account_id) ON DELETE CASCADE  
);

CREATE TRIGGER trade_buy_remaining_DEFAULT
BEFORE UPDATE ON team1_trade_buy
FOR EACH ROW SET NEW.trade_buy_remaining = NEW.trade_buy_quota - NEW.trade_buy_completed

delimiter //
CREATE TRIGGER trade_but_state
BEFORE UPDATE ON team1_trade_buy
FOR EACH ROW BEGIN
IF (NEW.trade_buy_state != '주문취소' AND NEW.trade_buy_remaining = 0) 
THEN SET NEW.trade_buy_state = '완료';
END IF;

END;
delimiter;

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
CONSTRAINT trade_sell_user_account_id 
FOREIGN KEY (user_account_id) REFERENCES team1_user_account(user_account_id) ON DELETE CASCADE  
);

CREATE TRIGGER trade_sell_remaining_DEFAULT
BEFORE INSERT ON team1_trade_sell
FOR EACH ROW SET NEW.trade_sell_remaining = NEW.trade_sell_quota;

CREATE TABLE team1_trade_buy_conclusion(
	trade_buy_conclusion_id INT PRIMARY KEY AUTO_INCREMENT,
    user_account_id INT NOT NULL,
    trade_conclusion_kind ENUM('buy','sell') NOT NULL,
    trade_conclusion_class VARCHAR(20) NOT NULL,
    trade_conclusion_price DECIMAL(65,4) NOT NULL,
    trade_conclusion_completed DECIMAL(16,4) NOT NULL,
    trade_conclusion_from_date TIMESTAMP DEFAULT NOW() NOT NULL,
CONSTRAINT trade_conclusion_user_account_id 
FOREIGN KEY (user_account_id) REFERENCES team1_user_account(user_account_id) ON DELETE CASCADE  
);

CREATE TABLE team1_trade_sell_conclusion(
	trade_conclusion_id INT PRIMARY KEY AUTO_INCREMENT,
    user_account_id INT NOT NULL,
    trade_conclusion_kind ENUM('buy','sell') NOT NULL,
    trade_conclusion_class VARCHAR(20) NOT NULL,
    trade_conclusion_price DECIMAL(65,4) NOT NULL,
    trade_conclusion_count DECIMAL(65,4) NOT NULL,
    trade_conclusion_from_date TIMESTAMP DEFAULT NOW() NOT NULL,
CONSTRAINT trade_conclusion_user_account_id 
FOREIGN KEY (user_account_id) REFERENCES team1_user_account(user_account_id) ON DELETE CASCADE  
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