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
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM Member;


