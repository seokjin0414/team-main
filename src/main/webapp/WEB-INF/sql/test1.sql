SELECT*FROM tbl_board_file ORDER BY bno DESC;
SELECT*FROM tbl_member_auth;

SELECT 
a.국가별,
a.`밀 (M/T)`,
a.`밀 경작면적당 생산량 (kg/ha)`,
a.`옥수수 (M/T)`,
a.`옥수수 경작면적당 생산량 (kg/ha)`,
b.`밀 (M/T)`,
b.`밀 경작면적당 생산량 (kg/ha)`,
b.`옥수수 (M/T)`,
b.`옥수수 경작면적당 생산량 (kg/ha)`
 
FROM `2017` a
JOIN `2018` b
ON a.국가별 = b.국가별
;
SELECT * FROM salaries;
SELECT 
d.emp_no,
dm.dept_name,
d.from_date,
d.to_date
FROM dept_emp d
LEFT JOIN departments dm
ON d.dept_no = dm.dept_no;
SELECT * FROM
(SELECT 
    s.emp_no,
    s.salary,
    s.from_date,
    s.to_date,
    t.title
FROM
    salaries s
LEFT JOIN
    titles t ON s.emp_no = t.emp_no
WHERE
    ((s.from_date >= t.from_date OR (s.from_date < t.from_date AND s.to_date > t.from_date)) AND s.to_date <= t.to_date)
) a
LEFT JOIN
(SELECT 
d.emp_no,
dm.dept_name,
d.from_date,
d.to_date
FROM dept_emp d
LEFT JOIN departments dm
ON d.dept_no = dm.dept_no
) b
ON a.emp_no = b.emp_no
;

INSERT INTO team1_user
(user_id, user_pw, user_first_name, user_last_name, user_phone, user_address)
VALUES
('shin', 123, 'shin', 'seokjin', '010-1111-1111', '서울시 동작구 대방동')
;
INSERT INTO team1_user_account
(user_id, user_account_name, user_account_susd)
VALUES
('shin', '대방동 투기꾼',10000000);

INSERT INTO team1_trade_buy
(user_account_id, trade_buy_class, trade_buy_price, trade_buy_quota, trade_buy_remaining)
VALUES
(1, 'bitcoin', 2000, 20, 20);

UPDATE team1_trade_buy
SET trade_buy_state = '주문취소'
WHERE trade_buy_id = 1;


SELECT*FROM team1_user;
SELECT*FROM team1_user_auth;
SELECT*FROM team1_user_account;
SELECT*FROM team1_trade_buy;


