------------------------------ SELECT ------------------------------

--	Situation:
--	○	We want to send out a promotional email to our existing customers!
--	Challenge:
--	○	Use a SELECT statement to grab the first and last names of every 
--		customer and their email address.

SELECT first_name, last_name FROM customer;


-------------------------- SELECT DISTINCT --------------------------

--	Situation:
--	○	An Australian visitor isn’t familiar with MPAA movie ratings 
--		(e.g.PG , PG-13, R,etc…).
--	○	We want to know the types of ratings we have in our database
--	Challenge:
--	○	Use what you’ve learned about SELECT DISTINCT to retrieve 
--		the distinct rating types our films could have in our database.

 SELECT DISTINCT rating FROM film;


 ------------------------------ WHERE --------------------------------

--	Challenge No. 1:
--	○	A customer forgot their wallet at our store! We need to track 
--		down their email to inform them.
--	○ 	What is the email for the customer with the name Nancy Thomas?

SELECT * FROM customer;
SELECT first_name, last_name, email FROM customer 
WHERE first_name = 'Nancy' AND last_name = 'Thomas'

--	Challenge No. 2:
--	○	A customer wants to know what the movie “Outlaw Hanky” is about.
--	○	Could you give them the description for the movie "Outlaw Hanky"?

SELECT * FROM film;
SELECT title, description FROM film WHERE title = 'Outlaw Hanky';

--	Challenge No. 3:
--	○	A customer is late on their movie return,and we’ve mailed them
-- 		a letter to their address at ‘259 Ipoh Drive’. We should also 
-- 		call them on the phone to let them know.
--	○	Can you get the phone number for the customer who lives at 
-- 		‘259 Ipoh Drive’?

SELECT * FROM address;
SELECT address, phone FROM address where address = '259 Ipoh Drive';


------------------------ ORDER BY and LIMIT -------------------------

--	Challenge Task 1:
--	○	We want to reward our first 10 paying customers.
--	○	What are the customer ids of the first 10 customers who created
-- 		a payment?

SELECT * FROM payment;
SELECT customer_id, payment_date FROM payment
ORDER BY payment_date ASC
LIMIT 10;

--	Challenge Task 2:
--	○ 	A customer wants to quickly rent a video to watch over their short
--		lunch break.
--	○	What are the titles of the 5 shortest (in length of runtime) movies?

SELECT * FROM film;
SELECT title, length FROM film
ORDER BY length ASC
LIMIT 5;

--	Quick Bonus Question
--	○	If the previous customer can watch any movie that is 50 minutes 
--		or less in run time, how many options does she have?

SELECT * FROM film;
SELECT title, length FROM film
WHERE length <= 50;
SELECT COUNT(*) FROM film
WHERE length <= 50;


------------------------ GENERAL CHALLENGE --------------------------

--	Challenge 1:
-- 	○	How many payment transactions were greater than $5.00?

SELECT * FROM payment;
SELECT COUNT(amount) FROM payment WHERE amount > 5.00;

--	Challenge 2:
-- 	○	 How many actors have a first name that starts with the letter P?

SELECT * FROM actor;
SELECT COUNT(first_name) FROM Actor WHERE first_name ILIKE 'P%'

--	Challenge 3:
-- 	○	How many unique districts are our customers from?

SELECT * FROM address;
SELECT COUNT(DISTINCT district) FROM address;

--	Challenge 4:
-- 	○	Retrieve the list of names for those distinct districts from 
--		the previous question.

SELECT DISTINCT district FROM Address;

--	Challenge 5:
-- 	○	How many films have a rating of R and a replacement cost 
--		between $5 and $15?

SELECT * FROM film LIMIT 2;
SELECT COUNT(*) FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 and 15;

--	Challenge 6:
-- 	○	How many films have the word Truman somewhere in the title?

SELECT * FROM film;
SELECT COUNT(*) FROM film
WHERE title ILIKE '%Truman%';

