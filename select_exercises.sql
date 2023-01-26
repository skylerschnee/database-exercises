USE albums_db;
SHOW TABLES;
DESCRIBE albums;
SHOW CREATE TABLE albums;
SELECT artist FROM albums;	
SELECT release_date FROM albums;
SELECT * FROM albums;	
SELECT DISTINCT artist FROM albums;	

-- a. How many rows are in the albums table?
-- 	A: 31

-- b. How many unique artist names are in the albums table?
-- 	A: 23

-- c. What is the primary key for the albums table?
-- 	A: id

-- d. What is the oldest release date for any album in the albums table? What is the most recent release date?
-- 	A: 1967, 2011


-- Work is done ABOVE answer*************




SELECT * FROM albums
WHERE artist = 'Pink Floyd';

-- a. The name of all albums by Pink Floyd
-- 	A: The Ark Side of the Moon, The Wall



SELECT release_date FROM albums 
WHERE name LIKE '%Sgt. Pepper%';

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
-- 	A: 1967



SELECT genre FROM albums
WHERE name = 'Nevermind';

-- c. The genre for the album Nevermind
-- 	A: Grunge, Alt Rock



SELECT * FROM albums
WHERE release_date 
BETWEEN 1990 AND 1999;

-- d. Which albums were released in the 1990s
-- 	A: 11 ablums



SELECT name FROM albums
WHERE sales < 20;

-- e. Which albums had less than 20 million certified sales
-- 	A: 13



SELECT * FROM albums 
WHERE genre = 'Rock';
-- The above give us JUST Rock, if we want Rock and anything that includes Rock, use below.
SELECT * FROM albums
WHERE genre LIKE '%Rock%';

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
-- 	A: 5




