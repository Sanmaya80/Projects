USE employees;
SELECT 
    dept_no
FROM
    departments;
SELECT 
    *
FROM
    departments;
SELECT first_Name
FROM employees
WHERE
first_name='ELvis';
SELECT first_Name,gender
FROM employees
WHERE
first_name='Kellie' AND gender='F';

/*Retrieve a list with all employees whose first name is either Kellie or Aruna.*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR  'Aruna';
-- Retrieve a list with all female employees whose first name is either Kellie or Aruna.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie' OR 'Aruna');
        
-- Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
-- Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
/*Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; 
specify that the name can be succeeded by any sequence of characters.*/

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
-- Retrieve a list with all employees who have been hired in the year 2000.
SELECT * FROM employees
WHERE Year(hire_date) Like('2000');

-- Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');