-- Query 1, extracting unique last names
SELECT COUNT(DISTINCT last_name)
FROM actor;

-- Query 2, counting the unique languages
SELECT COUNT(DISTINCT language_id)
FROM film;

-- Query 3, counting PG-13 movies
SELECT COUNT(*) AS ratings_count
	FROM film;
    WHERE rating = 'PG-13';

-- Query 4, longest movies of 2006
SELECT title, length
	FROM film
		WHERE release_year = 2006
			ORDER BY length DESC
		LIMIT 10;
        
-- Query 5, how many days has the company been around
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) + 1 AS days_in_business
FROM rental;

-- Query 6, rental info with new columns
SELECT rental_id, rental_date, customer_id,
       DATE_FORMAT(rental_date, '%M') AS month,
       DAYNAME(rental_date) AS weekday
		FROM rental
	LIMIT 20;

-- Query 7, weekend vs weekday
SELECT rental_id, rental_date, customer_id,
		DATE_FORMAT(rental_date, '%M') AS month,
		DAYNAME(rental_date) AS weekday,
			CASE WHEN DAYNAME(rental_date) IN ('Saturday', 'Sunday') THEN 'weekend'
            ELSE 'workday' END AS day_type
		FROM rental
	LIMIT 20;

-- Query 8, amount of rentals in last month
SELECT COUNT(*)
	FROM rental
		WHERE rental_date BETWEEN DATE_SUB(LAST_DAY(NOW()), INTERVAL 1 MONTH) AND LAST_DAY(NOW());

-- Query 9, film ratings
SELECT DISTINCT rating
	FROM film;
    
-- Query 10, release years
SELECT DISTINCT release_year
	FROM film;
    
-- Query 11, films with Armaggedon in the title
SELECT *
	FROM film
		WHERE title REGEXP '.*ARMAGEDDON.*';

-- Query 12, films with Apollo
SELECT *
	FROM film
		WHERE title REGEXP '.*APOLLO.*';
        
-- Query 13, films who's title ends in Apollo
SELECT *
	FROM film
		WHERE title REGEXP 'APOLLO$';
        
-- Query 14, films with DATE in the title
SELECT *
	FROM film
		WHERE title REGEXP '.*DATE.*';
        
-- Query 15, films with 10 longest titles
SELECT title, LENGTH(title) AS title_length
	FROM film
		ORDER BY title_length DESC
	LIMIT 10;

-- Query 16, 10 longest films
SELECT title, length AS longest_film
	FROM film
		ORDER BY longest_film DESC
	LIMIT 10;
    
-- Query 17, behind the scenes films
SELECT COUNT(*) AS Extended_Cuts 
	FROM film 
		WHERE special_features REGEXP '.*Behind the Scenes*';
        
-- Query 18, order films by title (a-z) and release year
SELECT *
	FROM film
		ORDER BY release_year, title;

-- Query 19, drop picture from staff column
ALTER TABLE staff
	DROP COLUMN picture;
    
-- Query 20, update Tammy Stevens from customer to employee
INSERT INTO staff (staff_id, first_name, last_name, email, address_id) 
	SELECT 3 as staff_id, first_name, last_name, email, 5 as address_id FROM customer	
		WHERE customer_id = 75;

        
