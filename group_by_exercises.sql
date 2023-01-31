-- Create a new file named group_by_exercises.sql

-- complete

-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.

USE employees;
SHOW tables;

SELECT DISTINCT (title)
FROM titles;

-- A: 7

-- Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

SELECT last_name
FROM employees
WHERE last_name
LIKE 'E%E'
GROUP BY last_name;


-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

SELECT first_name, last_name
FROM employees
WHERE last_name
LIKE 'E%E'
GROUP BY first_name, last_name;

-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

SELECT DISTINCT last_name
FROM employees
WHERE last_name
LIKE '%Q%' 
AND last_name 
NOT LIKE '%QU%'
GROUP BY last_name;

-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name
LIKE '%Q%' 
AND last_name 
NOT LIKE '%QU%'
GROUP BY last_name;

-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT first_name, gender, COUNT(gender)
FROM employees
WHERE first_name
IN ('Irena','Vidya','Maya')
GROUP BY first_name, gender
ORDER BY first_name;

-- Using your query that generates a username for all of the employees, generate a count employees for each unique username.

SELECT lower(CONCAT(
SUBSTR(first_name, 1, 1),
SUBSTR(last_name, 1, 4),
('_'),
MONTH(birth_date),
SUBSTR(birth_date, 3, 2)))
AS username, 
COUNT(*) 
FROM employees
GROUP BY username;


-- From your previous query, are there any duplicate usernames? What is the higest number of times a username shows up? Bonus: How many duplicate usernames are there from your previous query?

SELECT lower(CONCAT(
SUBSTR(first_name, 1, 1),
SUBSTR(last_name, 1, 4),
('_'),
MONTH(birth_date),
SUBSTR(birth_date, 3, 2)))
AS username, 
COUNT(*)
FROM employees
GROUP BY username
ORDER BY COUNT(*) DESC
LIMIT 1;

-- A: Yes, 6

SELECT lower(CONCAT(
SUBSTR(first_name, 1, 1),
SUBSTR(last_name, 1, 4),
('_'),
MONTH(birth_date),
SUBSTR(birth_date, 3, 2)))
AS username, 
COUNT(*)
FROM employees
GROUP BY username
HAVING COUNT(*) > 1;

-- BONUS: 13251

-- MORE PRACTICE --


-- Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by  -- that exact column.

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no;	




