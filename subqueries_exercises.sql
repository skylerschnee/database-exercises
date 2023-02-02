-- Find all the current employees with the same hire date as employee 101010 using a subquery.

USE employees;
SHOW TABLES;
DESCRIBE dept_emp;

SELECT first_name, last_name, hire_date
FROM employees
JOIN dept_emp AS de
USING (emp_no)
WHERE de.to_date > NOW()
AND hire_date = 
	(
	SELECT hire_date
	FROM employees
	WHERE emp_no = '101010'
	);



-- Find all the titles ever held by all current employees with the first name Aamod.

DESCRIBE titles;
DESCRIBE employees;

-- using joins:

SELECT t.title
FROM titles AS t
JOIN employees AS e
USING (emp_no)
JOIN dept_emp AS de
USING (emp_no)
WHERE e.first_name = 'Aamod'
AND de.to_date > NOW()
GROUP BY t.title;

-- using subqueries:

-- inner : find current employees named aamod

SELECT * 
FROM employees as e 
JOIN dept_emp as de
USING (emp_no)
WHERE e.first_name = 'Aamod'
AND de.to_date > NOW();

-- outter : find titles ever held by employees 

SELECT title
FROM titles
GROUP BY title;

-- combine:

SELECT title
FROM titles
WHERE emp_no IN
	(
	SELECT emp_no 
	FROM employees as e 
	JOIN dept_emp as de
	USING (emp_no)
	WHERE e.first_name = 'Aamod'
	AND de.to_date > NOW()
	)
GROUP BY title;



-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

DESCRIBE dept_emp;
DESCRIBE employees;

-- inner: find how many people there are in the employees table

SELECT COUNT(*)
FROM employees;

-- outter: find people that no longer work for the company

SELECT emp_no
FROM dept_emp
WHERE to_date < NOW()
GROUP BY emp_no;

-- combine:


SELECT COUNT(*)
FROM employees
WHERE emp_no IN
	(
	SELECT emp_no
	FROM dept_emp
	WHERE to_date < NOW()
	GROUP BY emp_no
	);


-- Find all the current department managers that are female. List their names in a comment in your code.

SELECT first_name, last_name
FROM employees
WHERE emp_no IN 
	(
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > NOW()
    )
AND gender = 'F';

-- 		A: Isamu, Karsten, Leon, Hilary 


-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT emp_no, salary
FROM salaries 
WHERE salary >
	(SELECT AVG(salary) 
	FROM salaries)
AND to_date > NOW();



-- How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate 
-- the standard deviation.) What percentage of all salaries is this?

-- Hint : You will likely use multiple subqueries in a variety of ways
-- Hint : It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. 
-- You will use this number (or the query that produced it) in other, larger queries.


-- find current highest salary

SELECT emp_no, salary
FROM salaries
WHERE to_date > NOW()
ORDER BY salary DESC
LIMIT 1;


SELECT COUNT(salary)
FROM salaries 
WHERE salary > 
	(
	SELECT salary
	FROM salaries
	WHERE to_date > NOW()
	ORDER BY salary DESC
	LIMIT 1
	) -
		(
		SELECT STDDEV(salary)
		FROM salaries
		)
		AND to_date > NOW()	
;
 	











