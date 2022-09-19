# Lab | SQL - Lab 3.01

#### ACTIVITY 2 - AS ERIN SUGGESTED, WE SHOULD NOT WASTE TOO MUCH TIME GETTING THE TOOL TO WORK AND JUST TYPE OUT WHAT WE MIGHT DO
-- I would drop film_category and merge it into film by just referencing category_id right on film in an extra column
-- Some of my teammates suggested to also drop and merge film_actor with actor, but I feel like this would create too much repeating information and room for errors
-- I would eliminate city and country tables and merge those into address. It seems silly for a two store, two country operation to feature a list of global countries and cities like Abu Dhabi to reference, the address table should suffice.
-- I would also drop payment and merge it into rental 
-- film_text can be dropped and is irrelevant, its contents are wholly represented in film 
-- In the end I would retain most of the basic primary keys for film, actor, category, language, customer, client, rental, store

#### Activity 1 below

# 1. Drop column picture from staff.
SELECT * FROM sakila.staff;

ALTER TABLE sakila.staff
	drop column picture;
    
# 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM sakila.customer
	WHERE first_name = 'TAMMY' AND last_name = 'SANDERS';
-- common info to copy over: first_name, last_name, email, address_id, last_update, 
-- info to add - new staff id, store id 2, no password

INSERT INTO sakila.staff (first_name, last_name, address_id, email, store_id, username) 
VALUES
	('Tammy','SANDERS','79','TAMMY.SANDERS@sakilacustomer.org','2','Tammy');
    
# 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
SELECT * FROM sakila.rental;

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

INSERT INTO sakila.rental(rental_date,inventory_id,customer_id,staff_id,last_update) 
VALUES (CURDATE(),'1','130','1',CURDATE());

