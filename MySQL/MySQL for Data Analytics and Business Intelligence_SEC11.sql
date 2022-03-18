-- Change the “Business Analysis” department name to “Data Analysis”.
USE employees;

SELECT * FROM departments;
UPDATE departments
SET
dept_name='Data Analysis'
WHERE dept_name='Business Analysis';

-- Remove the department number 10 record from the “departments” table.
DELETE FROM departments
WHERE dept_no='do10';

-- How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
SELECT * FROM dept_emp;
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;

-- What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
-- 1. Which is the lowest employee number in the database?
SELECT 
    MIN(emp_no)
FROM
    employees;
    
-- 2. Which is the highest employee number in the database?
SELECT 
    MAX(emp_no)
FROM
    employees;
-- What is the average annual salary paid to employees who started after the 1st of January 1997?
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
-- Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
select * from departments;
create table departments_dup
(dept_no char(5),
dept_name VARCHAR(255)
);
DROP TABLE departments_dup;
INSERT Into departments_dup
Select * from departments;
SELECT * from departments_dup;
INSERT INto departments_dup(dept_no) values('d010'),('d011');
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no DESC;
ALTER table departments_dup
ADD column dept_manager VARCHAR(255) after dept_name;
SELECT * from departments_dup Order by dept_no ASC;
COMMIT;

ALTER Table departments_dup
ADD column dept_info char(10) AFTER dept_name;
SELECT dept_no,
	   dept_name,
       coalesce(dept_no,dept_name)AS dept_info
       from departments_dup;
SELECT dept_no,
	   dept_name,
       ifnull(dept_name,'Department name no provided')AS  dept_Name
       from departments_dup;
       
SELECT

    IFNULL(dept_no, 'N/A') as dept_no,

    IFNULL(dept_name,

            'Department name not provided') AS dept_name,

    COALESCE(dept_no, dept_name) AS dept_info

FROM

    departments_dup

ORDER BY dept_no ASC;
select * from departments_dup;
COMMIT;
Delete from departments_dup
WHERE dept_no='doo2';
commit;
ALTER table departments_dup
DROP column dept_info;
INsert into departments_dup
values( "",'Public Relation');
COMMIT;
DROP TABLE if EXists dept_manager_dup;
CREATE table dept_manager_dup
(emp_no int not null,
dept_no char(4) null,
from_date date not null,
to_date date null
);
INsert into dept_manager_dup
select * from dept_manager;

insert into dept_manager_dup(emp_no,from_date)
values(999904,'2017-01-01'),
(999905,'2017-01-01'),
(999906,'2017-01-01'),
(999907,'2017-01-01');

delete from dept_manager_dup
where dept_no='doo1';
INsert into departments_dup(dept_name)
value('Public Relation');

delete from departments_dup
where dept_no='doo2';

