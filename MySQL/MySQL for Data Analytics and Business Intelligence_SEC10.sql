Select * from employees;
INSERT INTO employees
(emp_no,birth_date,first_name,last_name,gender,hire_date)
Values(999903,'1958-01-02','Josh','Makana','M','1997-10-01');
/*Select ten records from the “titles” table to get a better idea about its content.*/
SELECT 
    *
FROM
    titles;
INSERT INTO titles
(emp_no,
title,
from_date,
to_date)
VALUES(999903,'Senior Engineer','1997-10-01','9999-01-01');
SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;

/*Insert information about the individual with employee number 999903 into the “dept_emp” table.
 He/She is working for department number 5, and has started work on  October 1st, 1997; 
 her/his contract is for an indefinite period of time.*/
 SELECT* FROM Dept_emp;
 
 INSERT INTO dept_emp
 (
 emp_no,
 dept_no,
 from_date,
 to_date
 )
VALUES(
999903,
'd005',
'1997-10-01',
'9999-01-01'
);

SELECT * FROM departments;
INSERT INTO departments
(
dept_no,
dept_name
)
VALUES
('d010',
'Business Analysis'
);