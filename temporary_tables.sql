-- Create a file named temporary_tables.sql to do your work for this exercise.

-- Complete

-- Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. use oneil_2097;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT e.first_name, e.last_name, d.dept_name
FROM employees.employees AS e
	JOIN employees.dept_emp AS de
		USING (emp_no)
	JOIN employees.departments AS d
		USING (dept_no)
WHERE de.to_date > NOW();

SELECT * FROM employees_with_departments;


-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

-- Update the table so that the full_name column contains the correct data.

UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);


-- Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments
DROP COLUMN first_name;
ALTER TABLE employees_with_departments
DROP COLUMN last_name;

-- What is another way you could have ended up with this same table?

ALTER TABLE employees_with_departments
DROP COLUMN first_name,
DROP COLUMN last_name;

-- Create a temporary table based on the payment table from the sakila database.

USE sakila;

SHOW TABLES;

SELECT * FROM payment;

CREATE TEMPORARY TABLE oneil_2097.payment
select *
    from sakila.payment;



-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

update payments
set amount =  amount * 100; -- tried updating but it errors

describe payments; -- look at the datatype, notice that it only accepts an decimal that is five chars long

alter table payments
modify amount decimal(10,2) -- use modify command to all the decimal datatype to hold up to 10 chars
; 

describe payments; -- verify modified datatype

update payments
set amount =  amount * 100; -- now update amount value

select * from payments; -- verify

alter table payments
modify amount int; -- now change it to an int to retain the 99

select * from payments; -- verify

-- Find out how the current average pay in each department compares to the overall current pay for everyone at the company. For this comparison, you will calculate the z-score for each salary. In terms of salary, what is the best department right now to work for? The worst?

use employees; -- switch back to employees to build my query

-- first i will determine the average salary for each department
select dept_name, round(avg(salary),2) as avg_salary 
	from departments
		join dept_emp
			using (dept_no)
		join salaries
			using (emp_no)
	where salaries.to_date > now()
		and dept_emp.to_date > now()
	group by dept_name;
    
drop table if exists oneil_2097.avg_dept_salaries; -- drop if the table exists

-- create table in my db
create temporary table oneil_2097.avg_dept_salaries as
	( 
	select dept_name, round(avg(salary),2) as avg_salary
	from departments
		join dept_emp
			using (dept_no)
		join salaries
			using (emp_no)
	where salaries.to_date > now()
		and dept_emp.to_date > now()
	group by dept_name
    )
;

-- verify table in my db
select * 
from oneil_2097.avg_dept_salaries; 


-- reminder: 
-- z-score = (each department average salary - overall average salary) / overall standard deviation 

-- i need the overall average salary
select avg(salary) from employees.salaries
where to_date > now()
;
-- i need the overall average standard deviation
select stddev(salary) from employees.salaries
where to_date > now()
;

-- i will save these values into my temp table

-- switching over to my db to expand on my temp table
use oneil_2097;

-- add new column for the overall average salary 
-- add new column for overall average standard deviation 
alter table avg_dept_salaries
add overall_avg_salary float;

alter table avg_dept_salaries
add overall_std_salary float;

-- verify & see that all columns are created and empty rn 
select *
from avg_dept_salaries; 


-- add in data to my newly created columns
-- using my select statements from earlier
update avg_dept_salaries
set overall_avg_salary = (select round(avg(salary),2) from employees.salaries where to_date > now())
;

update avg_dept_salaries
set overall_std_salary = (select round(std(salary),2) from employees.salaries where to_date > now())
;

-- verify 
select *
from avg_dept_salaries
;


-- reminder to calculate: 
-- z-score = (each department average salary - overall average salary) / overall standard deviation 

-- add new z-score columns
alter table avg_dept_salaries
add zscore float;

update avg_dept_salaries
set zscore = (avg_salary - overall_avg_salary) / overall_std_salary
;

-- verify 
select *
from avg_dept_salaries
;

-- order by to get best and worst departments 
select *
from avg_dept_salaries
order by zscore desc
;



