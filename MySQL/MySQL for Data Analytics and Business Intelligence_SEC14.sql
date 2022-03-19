-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
Select * from employees;
Select * from dept_manager;
SElect d.emp_no,e.first_name,e.last_name,d.dept_no,e.hire_date
from employees e
inner join
dept_manager d
ON e.emp_no=d.emp_no;

/*Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch.
 See if the output contains a manager with that name. */
 SELECT e.emp_no,e.first_name,e.last_name,m.dept_no,m.from_date
 from employees e
 left join
 dept_manager m
 ON e.emp_no=m.emp_no
 WHERE e.last_name='Markovitch'
 ORDER BY dept_no;
 
 /*Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date.
 Use the old type of join syntax to obtain the result.*/
 
 select e.emp_no,e.first_name,e.last_name, d.dept_no,e.hire_date
 from employees e,
 dept_manager d
 WHERE e.emp_no=d.emp_no;
 
 set @@global.sql_mode:=replace(@@global.sql_mode,'ONLY_FULL_GROUP_BY','');
 
-- the hire date, and the job title of all employees whose first name is “Margareta” and  have the last name “Markovitch"
 
 Select * from titles;
 
 Select e.first_name,e.last_name,e.hire_date,t.title
 from employees e
 Left JOIN
 titles t
 ON e.emp_no=t.emp_no
 WHERE first_name='Margareta' and Last_name='Markovitch';
 