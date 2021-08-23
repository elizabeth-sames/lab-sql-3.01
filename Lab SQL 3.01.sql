-- Lab 3.01
-- Activity 1
USE sakila;

select * from staff;
-- 1 Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

select * from staff;
-- 2 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. 
-- Update the database accordingly. 
select * from staff; -- see what columns are needed
select * from customer where first_name = 'tammy' and last_name = 'sanders'; -- get Tammy's info
INSERT INTO staff (staff_id, first_name, last_name, address_id, store_id, username) -- add her to staff table
VALUE
(3, 'Tammy', 'Sanders', 79, 2, 'Tammy');

/** 3 Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at 
Store 1. You can use current date for the rental_date column in the rental table. 
Hint: Check the columns in the table rental and see what information you would need to add 
there. You can query those pieces of information. For eg., you would notice that you need 
customer_id information as well. To get that you can use the following query: **/
SELECT * FROM rental; -- get info about what columns need to be filled
SELECT film_id FROM film WHERE title = 'Academy Dinosaur'; -- film_id = 1
select inventory_id from inventory where film_id = 1; -- inventory id 1-8
select customer_id from customer where first_name = 'Charlotte' and last_name = 'Hunter';
select staff_id from staff where first_name = 'Mike';

INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
value
(20210823 , 1, 130, 1);

select * from rental where customer_id = 130; 
-- rental_id is 16050
