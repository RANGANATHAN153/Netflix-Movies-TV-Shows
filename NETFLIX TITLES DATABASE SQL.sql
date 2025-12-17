create database netflix_titles;

use netflix_titles;

CREATE TABLE netflix_titles (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(200),
    cast TEXT,
    country VARCHAR(150),
    date_added DATE,
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(20),
    listed_in VARCHAR(200),
    description TEXT
);

INSERT INTO netflix_titles VALUES
('s1','Movie','Inception','Christopher Nolan',
'Leonardo DiCaprio','United States',
'2021-01-01',2010,'PG-13','148 min',
'Sci-Fi, Thriller','Dream invasion story');

select * from netflix_titles;

SELECT title, type, release_year FROM netflix_titles;

SELECT * FROM netflix_titles
WHERE type = 'Movie';

SELECT title FROM netflix_titles
WHERE country LIKE '%India%';

SELECT title, release_year
FROM netflix_titles
WHERE release_year > 2015;

SELECT title, release_year
FROM netflix_titles
ORDER BY release_year DESC;

SELECT COUNT(*) AS total_titles FROM netflix_titles;

SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;

SELECT 
MIN(release_year) AS oldest,
MAX(release_year) AS newest
FROM netflix_titles;

SELECT release_year, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year;

SELECT release_year, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year
HAVING COUNT(*) > 100;

SELECT * FROM netflix_titles
WHERE director IS NULL;

SET SQL_SAFE_UPDATES = 0;


UPDATE netflix_titles
SET director = 'Unknown'
WHERE director IS NULL
AND show_id IS NOT NULL;


DELETE FROM netflix_titles
WHERE title IS NULL;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE netflix_titles
ADD content_age VARCHAR(20);

ALTER TABLE netflix_titles
MODIFY rating VARCHAR(15);

SELECT title, release_year,
CASE
    WHEN release_year >= 2020 THEN 'New'
    WHEN release_year >= 2010 THEN 'Mid'
    ELSE 'Old'
END AS content_category
FROM netflix_titles;

SELECT title, release_year
FROM netflix_titles
WHERE release_year >
(SELECT AVG(release_year) FROM netflix_titles);

SELECT title, LENGTH(title) AS title_length
FROM netflix_titles;

SELECT YEAR(date_added) AS year_added, COUNT(*) AS total
FROM netflix_titles
GROUP BY year_added;

START TRANSACTION;

DELETE FROM netflix_titles WHERE rating = 'NR';

ROLLBACK;
