-- Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.
create or replace view v_avg_sal_manager As
select round(avg(salary),2)
from salaries s 
join
dept_manager d
on s.emp_no=d.emp_no;

USE employees;
DROP procedure IF EXISTS select_employee;
DELIMITER $$
CREATE PROCEDURE select_employee()
BEGIN
	Select * from
    employees
    LIMIT 1000;
END$$
Delimiter ;

call employees.select_employee();
call select_employee();

-- Create a procedure that will provide the average salary of all employees.
Select * from Salaries;
DROP PROCEDURE if exists avg_salary_emp;
delimiter $$
CREATE PROCEDURE avg_salary_emp()
BEGIN
		Select emp_no,AVG(salary) as avg_salery
        from salaries
        ORDER BY emp_no;
END $$
Delimiter ;
call Avg_salary_emp();