SHOW DATABASES;
USE employees;
SHOW tables;
-- Which table(s) do you think contain a numeric type column? 
-- 	A: They all could contain a numeric column as an id.
-- Which table(s) do you think contain a string type column? 
-- 	A: I would assume all of them.
-- Which table(s) do you think contain a date type column? 
-- 	A: I would assume all of them. 
-- What is the relationship between the employees and the departments tables? 
-- 	A: They are described with names and numbers and linked on the 'dept_emp' tables
DESCRIBE employees;
DESCRIBE departments;
DESCRIBE dept_emp;

-- Show the SQL that created the dept_manager table. 
-- Write the SQL it takes to show this as your exercise solution.

SHOW CREATE TABLE dept_manager;