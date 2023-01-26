USE fruits_db;
SHOW TABLES;
-- to peek at a small sample (5), use LIMIT 
SELECT * FROM fruits LIMIT 5;
USE employees;
SELECT * FROM employees LIMIT 10;
-- Im still within employees at this time, but can use the dot fuction below to move there and SELECT directly.
SELECT * FROM fruits_db.fruits;
USE fruits_db;
SELECT * FROM fruits;
-- WHERE function - 
SELECT * FROM fruits WHERE name = 'cantelope';
-- ^^^^ Here, we selected every field in the table, then narrowed down to only what matched the literal name Cantelope

SELECT * FROM fruits WHERE name LIKE '%fruit';
SELECT * FROM fruits WHERE name LIKE 'fruit%';
SELECT * FROM fruits WHERE name IN('apple','dragonfruit');

SELECT * FROM fruits WHERE name IN('apple','dragonfruit')
OR name LIKE '%apple';

-- SELECT field(s)
-- FROM table
-- WHERE clause1, clause2, clause3;

SELECT * FROM fruits;
DESCRIBE fruits; 

SELECT * FROM fruits WHERE quantity >5;
SELECT * FROM fruits WHERE quantity <5;
SELECT * FROM fruits WHERE quantity =5;
SELECT * FROM fruits WHERE quantity >=5;
SELECT * FROM fruits WHERE quantity !=5;

SELECT * FROM fruits WHERE quantity BETWEEN 1 AND 5;
-- ^^ all fruit where the quantity is between 1 and 5 ^^

SELECT * FROM fruits WHERE name IS NOT NULL;
-- ^ returns everything without a null value for (name)
















