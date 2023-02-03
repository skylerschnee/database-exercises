-- Use CASE statements or IF() function to explore information in the employees database
-- Create a file named case_exercises.sql and craft queries to return the results for the following criteria:

-- complete
USE employees;
SHOW TABLES;
DESCRIBE employees;
DESCRIBE dept_emp;

-- Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT e.first_name, e.last_name, de.dept_no, de.from_date, de.to_date, 
	IF (to_date = '9999-01-01', 1, 0) AS is_current_employee
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
;


-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT first_name, last_name, 
	CASE 
		WHEN SUBSTR(last_name, 1, 1) IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H')
			THEN 'A-H'
		WHEN SUBSTR(last_name, 1, 1) IN ('I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q')
			THEN 'I-Q'
		WHEN SUBSTR(last_name, 1, 1) IN ('R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z')
			THEN 'R-Z'
	END AS alpha_group
FROM employees;


-- How many employees (current or previous) were born in each decade?

SELECT 
	COUNT( IF(birth_date LIKE '195%', 1, NULL))
	 			AS '1950s',
	 COUNT( IF(birth_date LIKE '196%', 1, NULL))
				AS '1960s'
FROM employees;


-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT round(avg(s.salary), 2) AS avg_salary,
   CASE
       WHEN d.dept_name IN ('research', 'development') THEN 'R&D'
       WHEN d.dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
       WHEN d.dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
       WHEN d.dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
       ELSE d.dept_name
   END AS dept_group
FROM departments AS d
JOIN dept_emp AS de
USING (dept_no)
JOIN salaries as s
USING (emp_no)
WHERE s.to_date > NOW() AND de.to_date > NOW()
GROUP BY dept_group
;


