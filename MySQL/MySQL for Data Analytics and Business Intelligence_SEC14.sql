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
 
 /*Use a CROSS JOIN to return a list with all possible combinations between managers 
 from the dept_manager table and department number 9.*/
 
 SELECT * from dept_manager;
 
 Select dm.*,d.*
 from dept_manager dm
 CROSS JOIN
 departments d
 WHERE d.dept_no='d009'
 ORDER by d.dept_no;
 
 /*Return a list with the first 10 employees with all the departments they can be assigned to.*/
 select * from dept_emp;
 SELECT e.*, d.*
 from employees e
 CROSS JOIN
 dept_emp d
 where e.emp_no=d.emp_no
 ORDER BY e.emp_no
 LIMIT 10;
 
 -- Select all managers’ first and last name, hire date, job title, start date, and department name.
 Select 
 e.first_name,
 e.last_name,
 e.hire_date,
 t.title,
 t.from_date,
 d.dept_name
 from employees e
 inner JOIn
 titles t
 ON e.emp_no= t.emp_no
 inner Join
 dept_manager dm
 ON dm.emp_no=t.emp_no
 Inner JOIN
 departments d 
 on dm.dept_no=d.dept_no
 WHERE t.title='Manager'
 ORDER BY e.emp_no;
 
 SELEct d.dept_name,
 ROUND(AVG(s.salary),2) As 'AVG Salary'
 FROM departments d
 Inner JOIN
 dept_manager dm
 ON d.dept_no=dm.dept_no
 JOIN
 salaries s
 ON dm.emp_no=s.emp_no
 group by d.dept_name;
 
 -- How many male and how many female managers do we have in the ‘employees’ database?
 Select e.gender,
 COUNT(t.title) as 'Count of Managers'
 from employees e
 inner join
 titles t
 ON e.emp_no=t.emp_no
 where title='Manager'
 Group BY e.gender;
 
 SELECT

    *

FROM

    (SELECT

        e.emp_no,

            e.first_name,

            e.last_name,

            NULL AS dept_no,

            NULL AS from_date

    FROM

        employees e

    WHERE

        last_name = 'Denis' UNION SELECT

        NULL AS emp_no,

            NULL AS first_name,

            NULL AS last_name,

            dm.dept_no,

            dm.from_date

    FROM

        dept_manager dm) as a

ORDER BY -a.emp_no DeSC;
 