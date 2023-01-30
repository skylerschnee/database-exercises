-- CREATE a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

-- Complete

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

USE employees;

SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name;

-- A: Irena Reutenauer
-- A: Vidya Simmen


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name, last_name;

-- A: Irena Acton
-- A: Vidya Zweizig


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY last_name, first_name;

-- A: Irena Acton
-- A: Maya Zyda

-- Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

SELECT * FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY emp_no;

-- A: 899
-- A: 10021, Ramzi Erde
-- A: 499648, Tadahiro Erde

-- Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.

SELECT * FROM employees
WHERE last_name LIKE '%E'
ORDER BY hire_date DESC;

-- A: 24292
-- A: Hideyuki Delgrande
-- A: Peternela Onuegbe

-- Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first. */

SELECT * FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25'
ORDER BY hire_date;

-- A: 362
-- A: Alselm Cappello
-- A: Khun Bernini







-- Copy the order by exercise and save it as functions_exercises.sql.

-- Complete

-- Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

USE employees;

SELECT CONCAT(first_name,' ', last_name) 
AS full_name
FROM employees
WHERE last_name LIKE 'E%E';


-- Convert the names produced in your last query to all uppercase.

SELECT UPPER(CONCAT(first_name,' ', last_name))
FROM employees
WHERE last_name LIKE 'E%E';


-- Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),

SELECT *, DATEDIFF(CURDATE(), hire_date)
AS days_employed 
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25';

-- Find the smallest and largest current salary from the salaries table.

SHOW tables;
DESCRIBE salaries;

SELECT min(salary), max(salary)
FROM salaries;

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:


USE employees;

SELECT lower(CONCAT(
SUBSTR(first_name, 1, 1),
SUBSTR(last_name, 1, 4),
('_'),
MONTH(birth_date),
SUBSTR(birth_date, 3, 2)))
AS username,
first_name, last_name, birth_date
FROM employees;















