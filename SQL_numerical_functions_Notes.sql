-- SQL FUNCTIONS

SHOW DATABASES;
USE albums_db;
SHOW tables;

-- COUNT

SELECT count(*) FROM albums;
-- give me a count from everything (*) in the albums table.

-- NUMERICAL FUNCTIONS

-- min, max, avg

SELECT MIN(release_date), 
 MAX(release_date),
 AVG(release_date),
 FROM albums;
 
-- STRING FUNCTIONS

-- CONCAT : combines things together
-- Format : CONCAT(expression1, expression2, expression3,...)

SELECT CONCAT('hello', 'world', '!') as helloworld;

SELECT CONCAT('My favorite artist is ', artist,'!')
FROM albums;

SELECT CONCAT(artist, ' -- ', name) as artist_album
	, release_date
	FROM albums;
	
-- SUBSTRING 
	
SELECT SUBSTR('Hello Oneil Class', 7, 5);

--  This returns just the string Oneil 

SELECT SUBSTR(release_date, 3, 2), release_date
FROM albums;
	
-- This returns a list of the release_date but only the last 2 characters since we chose to start at the 3rd charcter(3),
-- and return 2 total (2)




-- CASE CONVERSION

SELECT UPPER(artist)
FROM albums;
-- this returns the artist list in all caps

SELECT artist, 
UPPER(artist),
LOWER(artist),
release_date
FROM albums;



	
	
	
	
	
	




