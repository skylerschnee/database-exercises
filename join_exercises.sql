-- Use the employees database.

USE employees;
SHOW TABLES;
SELECT * FROM employees
LIMIT 10;
DESCRIBE departments;
DESCRIBE dept_manager;

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS m
ON e.emp_no = m.emp_no
JOIN departments AS d
ON m.dept_no = d.dept_no
WHERE to_date LIKE '9999-01-01';


-- Find the name of all departments currently managed by women.

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS m
ON e.emp_no = m.emp_no
JOIN departments AS d
ON m.dept_no = d.dept_no
WHERE to_date LIKE '9999-01-01'
AND gender LIKE 'F';

-- Find the current titles of employees currently working in the Customer Service department.

SELECT t.title, (COUNT(d.emp_no))
FROM dept_emp AS d
JOIN titles AS t
ON t.emp_no = d.emp_no
WHERE t.to_date = '9999-01-01'
AND dept_no = 'd009'
GROUP BY t.title;

-- Find the current salary of all current managers.

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary
FROM employees AS e
JOIN dept_manager AS m
ON e.emp_no = m.emp_no
JOIN departments AS d
ON m.dept_no = d.dept_no
JOIN salaries AS s
ON s.emp_no = e.emp_no
WHERE m.to_date = '9999-01-01'
AND s.to_date = '9999-01-01';

-- Find the number of current employees in each department.

SELECT de.dept_no, d.dept_name, (COUNT(de.emp_no)) AS num_employees
FROM dept_emp AS de
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY dept_no;

-- Which department has the highest average salary? Hint: Use current not historic information.

SELECT d.dept_name, (AVG(s.salary))
FROM dept_emp AS de
JOIN departments AS d
ON de.dept_no = d.dept_no
JOIN salaries AS s
ON s.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
GROUP BY dept_name;

-- Who is the highest paid employee in the Marketing department?

SELECT first_name, last_name, salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
WHERE dept_no = 'd001'
ORDER BY s.salary DESC
LIMIT 1;

-- Which current department manager has the highest salary?

SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees AS e
JOIN dept_manager AS m
ON e.emp_no = m.emp_no
JOIN departments AS d
ON m.dept_no = d.dept_no
JOIN salaries AS s
ON s.emp_no = e.emp_no
WHERE m.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
ORDER BY salary DESC
LIMIT 1;


-- Determine the average salary for each department. Use all salary information and round your results.

SELECT d.dept_name, (ROUND((AVG(s.salary))))
FROM dept_emp AS de
JOIN departments AS d
ON de.dept_no = d.dept_no
JOIN salaries AS s
ON s.emp_no = de.emp_no
GROUP BY dept_name;















