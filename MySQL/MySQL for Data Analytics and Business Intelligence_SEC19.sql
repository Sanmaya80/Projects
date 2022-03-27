USE employees_mod;
Select YEAR(d.from_date) As Calendar_Year,
Count(distinct e.emp_no) As Count_of_emp,
e.gender
from t_employees e
join
t_dept_emp d
ON e.emp_no=d.emp_no
GROUP BY Year(d.from_date), e.gender 
HAVING calendar_year>=1990
;


select
d.dept_name,
ee.gender,
dm.emp_no,
dm.from_date,
dm.to_date,
e.calendar_year,
CASE
when year(dm.to_date)>=e.calendar_year and Year(dm.from_date)<=e.calendar_year then 1
else 0
end as ACTIVE
from
(select
year(hire_date) as calendar_year
from 
t_employees
GROUP BY calendar_year) e
CROSS JOIN
t_dept_manager dm
join
t_departments d on d.dept_no=dm.dept_no
join
t_employees ee on ee.emp_no=dm.emp_no
Order by dm.emp_no,calendar_year;


SElect e.gender,
d.dept_name,
ROUND(AVG(s.salary),2) as Salary,
YEAR(dm.from_date) as calendar_year
from t_employees e
JOIN
t_salaries s on e.emp_no=s.emp_no
JOIN
t_dept_emp dm
ON s.emp_no=dm.emp_no
JOIN t_departments d
on dm.dept_no=d.dept_no
Group by d.dept_no, e.gender,calendar_year
HAVING calendar_year<=2002
Order by d.dept_no;

DROP procedure if EXISTS filter_salary;
DELIMITER $$
CREATE procedure filter_salary(IN p_min_salary float,IN p_max_salary float)
BEGIN
Select
e.gender,d.dept_name,round(AVG(Salary),2) as avg_salary
from
t_salaries s
JOIN
t_employees e ON e.emp_no=s.emp_no
JOIN
t_dept_emp de ON de.emp_no=e.emp_no
JOIn
t_departments d ON d.dept_no=de.dept_no
WHERE s.salary between p_min_salary and p_max_salary
GROUP BY d.dept_no, e.gender;
end $$
DELIMITER ;
call filter_salary(50000,90000);