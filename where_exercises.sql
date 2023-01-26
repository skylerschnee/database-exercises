USE employees;
SHOW TABLES;
DESCRIBE employees;

SELECT * FROM employees 
WHERE first_name IN ('Irena','Vidya','Maya');
-- 709 rows returned

SELECT * FROM employees 
WHERE first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya';
-- 709 rows returned

SELECT * FROM employees 
WHERE (first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya') 
AND gender = 'M';
-- 441 rows returned

SELECT * FROM employees 
WHERE last_name LIKE 'E%';
-- 7330 rows returned

SELECT * FROM employees 
WHERE last_name LIKE'E%' 
OR last_name LIKE '%E';
-- 30723 rows returned 



--
SELECT * FROM employees 
WHERE last_name NOT LIKE'E%' 
AND last_name LIKE '%E';

-- How many employees have a last name that ends with E, but does not start with E?
-- 	A: 23393 

--***
SELECT * FROM employees 
WHERE last_name LIKE 'E%' 
AND last_name LIKE '%E';
-- 899 rows returned, 
-- OR WE CAN SIMPLIFY IT!! LIKE THIS:
SELECT * FROM employees 
WHERE last_name LIKE 'E%E';
--***



--***
SELECT * FROM employees
WHERE hire_date 
BETWEEN '1990-01-01'
AND '1999-12-31';
-- 135214 rows returned
-- OR WE CAN SIMPLIFY. LIKE THIS!!:
SELECT * FROM employees 
WHERE hire_date LIKE '199%';
--***


SELECT * FROM employees
WHERE birth_date 
LIKE '%12-25';
-- 842 rows returned

SELECT * FROM employees 
WHERE birth_date 
LIKE '%12-25' 
AND hire_date LIKE '199%';
-- 362 rows returned

SELECT * FROM employees
WHERE last_name 
LIKE '%q%';
-- 1873 rows returned

SELECT * FROM employees
WHERE last_name
LIKE '%q%'
AND last_name NOT
LIKE '%qu%';
-- 547 rows returned






































