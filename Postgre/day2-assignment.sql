---------------------------------------Section 3 - Pagila------------------------------------------

1. Select all fields, and all records from actor table
	SELECT * FROM actor;

2. Select all fields and records from film table
		SELECT * FROM film;

3. Select all fields and records from the staff table
		SELECT * FROM staff;

4. Select address and district columns from address table
		SELECT DISTINCT address 
		FROM address;

5. Select title and description from film table
		SELECT title, description 
		FROM film;

6. Select city and country_id from city table
		SELECT city, country_id 
		FROM city;

7. Select all the distinct last names from customer table
		SELECT DISTINCT last_name 
		FROM customer;

8. Select all the distinct first names from the actor table
		SELECT DISTINCT first_name 
		FROM actor;

9. Select all the distinct inventory_id values from rental table
		SELECT DISTINCT inventory_id 
		FROM rental;

10. Find the number of films ( COUNT ).
		SELECT COUNT(film_id) 
		FROM film;

11. Find the number of categories.
		SELECT COUNT(category_id) 
		FROM category;

12. Find the number of distinct first names in actor table
		SELECT COUNT(DISTINCT first_name) 
		FROM actor;

13. Select rental_id and the difference between return_date and rental_date in rental table
		SELECT rental_id, return_date - rental_date 
		FROM rental;




---------------------------------------Section 4 - Usda------------------------------------------

1. Select all records from data_src which came from the journal named 'Food Chemistry'.
		SELECT * 
		FROM data_src 
		WHERE journal='Food Chemistry';

2. Select record from nutr_def where nutrdesc is Retinol.
		SELECT * 
		FROM nutr_def 
		WHERE nutrdesc='Retinol';

3. Find all the food descriptions (food_des) records for manufacturer Kellogg, Co. (must include punctuation for exact match).
		SELECT * 
		FROM food_des
		WHERE manufacname='Kellogg';
	
4. Find the number of records in data sources (data_src) that were published after year 2000 (it is numeric field).
		SELECT * 
		FROM data_src
		WHERE year> 2000;

5. Find the number of records in food description that have a fat_factor < 4.
		SELECT COUNT(*)
		FROM food_des
		WHERE fat_factor< 4;

6. Select all records from weight table that have gm_weight of 190.
		SELECT *
		FROM weight
		WHERE gm_wgt=190;

7. Find the number of records in food description table that have pro_factor greater than 1.5 and fat_factor less than 5.
		SELECT COUNT (*)
		FROM food_des
		WHERE pro_factor>1.5 AND fat_factor<5;

8. Find the record in data source table that is from year 1990 and the journal Cereal Foods World.
		SELECT *
		FROM data_src
		WHERE year>=1990 AND journal='Cereal Foods World';

9. Select count of weights where gm_wgt is greater than 150 and less than 200.
		SELECT COUNT (*)
		FROM weight
		WHERE gm_wgt BETWEEN 150 AND 200;

10. Select the records in nutr_def table (nutrition definitions) that have units of kj or kcal.
		SELECT *
		FROM nutr_def
		WHERE units='kj' OR units='kcal';
	
11. Select all records from data source table (data_src) that where from the year 2000 or the journal Food Chemistry.
		SELECT *
		FROM data_src
		WHERE journal='Food Chemistry' OR year>=2000 ;

12. How many records in food_des are not about food group Breakfast Cereals.  The field fdgrp_cd is an id field and you will have to find it in fd_group for fddrp_desc = ' Breakfast Cereals'.
		SELECT COUNT(*)
		FROM fd_group
		WHERE NOT fddrp_desc='Breakfast Cereals';

13. Find all the records in data sources that where between 1990 and 2000 and either 'J. Food Protection' or 'Food Chemistry'.Use BETWEEN syntax to find number of weight records that weight between 50 and 75 grams (gm_wgt).
		SELECT COUNT(*)
		FROM weight
		WHERE gm_wgt BETWEEN 50 AND 75;

14. Select all records from the data source table that were published in years 1960,1970,1980,1990, and 2000.  Use the IN syntax.
		SELECT * 
		FROM data_src 
		WHERE year IN (1960, 1970, 1980, 1990, 2000);