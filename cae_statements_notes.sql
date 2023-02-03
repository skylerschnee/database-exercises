-- Use Chiptle database

USE chipotle;

SELECT * FROM orders LIMIT 10;

SELECT item_name
FROM orders
LIMIT 5;

SELECT item_name 
FROM orders 
WHERE item_name 
LIKE '%chicken%';

SELECT item_name,
IF ( item_name LIKE '%chicken%', 1, 0) AS chicken_type
FROM orders;
 
-- If (<truth condition>, <value if true>, <value if false>)

-- here we put two case statements together: 

SELECT IF(
item_name LIKE '%steak%',
IF ( item_name LIKE '%bowl%', 
	'steak bowl', 
	'other steak item'),
'not_steak') AS steak_col
FROM orders;
 
SELECT IF(
item_name LIKE '%chicken%',
IF ( item_name LIKE '%bowl%',
	'chicken bowl',
	'other chicken item'),
'not_chicken') AS chicken_col
FROM orders;

-- structure of a CASE statement:

SELECT item_name, quantity,
CASE item_name
	WHEN 'chicken bowl'
		THEN 'bowl'
	WHEN 'chicken burrito'
		THEN 'burrito'
	ELSE 'not chicken that I care about'
END AS chicken_bowls
FROM orders;

-- LIMITATIONS: 
-- It can only check for direct equivalence!

SELECT item_name,
CASE item_name
WHEN LIKE '%chicken%' 
	THEN 'chickeny'
		ELSE 'NOT chicken'
END AS chicken_type_beat
FROM orders;

-- ^^^ this will not run, lets fix it

SELECT item_name,
CASE 
WHEN item_name LIKE '%chicken%' 
	THEN 'chicken type'
WHEN item_name LIKE '%steak%'
	THEN 'steak type'
ELSE 'other thing'
END AS 'meat check'
FROM orders;


USE join_example_db;

SELECT * FROM users;

SELECT role_id,
CASE 
	WHEN role_id > 2 
		THEN 'high roller'
	WHEN role_id = 1 
		THEN 'some role'
	WHEN role_id IS NULL 
		THEN 'idk'
	ELSE 'will you see this?'
END AS 'case results'
FROM users;

SELECT IF(role_id = 3, 1, 0)
	AS role_3 
FROM users;

SELECT COUNT(IF(role_id = 3, 1, 0))
	AS role_3 
FROM users;




-- Here, I'm building up my columns and values before I group by departments and use an aggregate function to get a count of values in each column.

USE employees;


SELECT
    dept_name,
    CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END AS 'Senior Engineer',
    CASE WHEN title = 'Staff' THEN title ELSE NULL END AS 'Staff',
    CASE WHEN title = 'Engineer' THEN title ELSE NULL END AS 'Engineer',
    CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END AS 'Senior Staff',
    CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END AS 'Assistant Engineer',
    CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END AS 'Technique Leader',
    CASE WHEN title = 'Manager' THEN title ELSE NULL END AS 'Manager'
FROM departments
JOIN dept_emp USING(dept_no)
JOIN titles USING(emp_no);

-- Next, I add my GROUP BY clause and COUNT function to get a count of all employees who have historically ever held a title by department. (I'm not filtering for current employees or current titles.)

SELECT
    dept_name,
    COUNT(CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END) AS 'Senior Engineer',
    COUNT(CASE WHEN title = 'Staff' THEN title ELSE NULL END) AS 'Staff',
    COUNT(CASE WHEN title = 'Engineer' THEN title ELSE NULL END) AS 'Engineer',
    COUNT(CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END) AS 'Senior Staff',
    COUNT(CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END) AS 'Assistant Engineer',
    COUNT(CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END) AS 'Technique Leader',
    COUNT(CASE WHEN title = 'Manager' THEN title ELSE NULL END) AS 'Manager'
FROM departments
JOIN dept_emp USING(dept_no)
JOIN titles USING(emp_no)
GROUP BY dept_name
ORDER BY dept_name;


-- In this query, I filter in my JOINs for current employees who currently hold each title.
SELECT
    dept_name,
    COUNT(CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END) AS 'Senior Engineer',
    COUNT(CASE WHEN title = 'Staff' THEN title ELSE NULL END) AS 'Staff',
    COUNT(CASE WHEN title = 'Engineer' THEN title ELSE NULL END) AS 'Engineer',
    COUNT(CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END) AS 'Senior Staff',
    COUNT(CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END) AS 'Assistant Engineer',
    COUNT(CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END) AS 'Technique Leader',
    COUNT(CASE WHEN title = 'Manager' THEN title ELSE NULL END) AS 'Manager'
FROM departments
JOIN dept_emp
    ON departments.dept_no = dept_emp.dept_no AND dept_emp.to_date > CURDATE()
JOIN titles
    ON dept_emp.emp_no = titles.emp_no AND titles.to_date > CURDATE()
GROUP BY dept_name
ORDER BY dept_name;










 
 
