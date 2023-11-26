------------------------------ SELECT -------------------------------
SELECT * FROM actor;
SELECT first_name FROM actor;
SELECT first_name FROM actor;
SELECT first_name, last_name FROM actor;
SELECT last_name, first_name FROM actor;


----------------------------- DISTINCT ------------------------------
SELECT DISTINCT rental_rate FROM film;
SELECT DISTINCT rental_rate, rental_duration FROM film;
SELECT DISTINCT(rental_rate, rental_duration) FROM film;


------------------------------ COUNT --------------------------------
SELECT * FROM payment;
SELECT COUNT(*) FROM payment;
SELECT COUNT(amount) FROM payment;
SELECT COUNT(DISTINCT amount) from payment;
SELECT COUNT(DISTINCT (amount, staff_id)) from payment;


------------------------------ WHERE --------------------------------
SELECT * FROM customer;
SELECT * FROM customer WHERE first_name = 'Jared';
SELECT * FROM film;
SELECT * FROM film WHERE rental_rate > 4;
SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99;
SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
SELECT title FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
SELECT count(title) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
SELECT count(*) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
SELECT count(*) FROM film WHERE rating  = 'PG-13' OR rating = 'R';
SELECT title, rating FROM film WHERE rating != 'R';


----------------------------- ORDER BY ------------------------------
SELECT * FROM customer;
SELECT * FROM customer ORDER BY first_name; -- default: ASC
SELECT * FROM customer ORDER BY first_name ASC;
SELECT store_id, first_name, last_name FROM customer ORDER BY store_id;
SELECT store_id, first_name, last_name FROM customer ORDER BY store_id DESC, first_name ASC;


------------------------------ LIMIT --------------------------------
SELECT * FROM payment;
SELECT * FROM payment ORDER BY payment_date;
SELECT * FROM payment
WHERE amount > 2.99
ORDER BY payment_date 
LIMIT 5;


----------------------------- BETWEEN -------------------------------
SELECT * FROM payment LIMIT 1;

SELECT amount FROM payment WHERE amount  BETWEEN 8 AND 9;
SELECT amount FROM payment WHERE amount  NOT BETWEEN 8 and 9;

SELECT COUNT(*) FROM payment WHERE amount  BETWEEN 8 and 9;
SELECT COUNT(*) FROM payment WHERE amount  NOT BETWEEN 8 and 9;
SELECT * FROM payment 
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';
SELECT * FROM payment 
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-14';
SELECT * FROM payment 
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-14 24:00:00';


-------------------------------- IN ---------------------------------
SELECT * FROM payment LIMIT 2;
SELECT DISTINCT(amount) FROM payment ORDER BY amount;
SELECT * FROM payment WHERE amount IN(0.99, 1.98, 1.99) ORDER BY amount;
SELECT COUNT(*) FROM payment 
WHERE amount IN(0.99, 1.98, 1.99);
SELECT COUNT(*) FROM payment 
WHERE amount NOT IN(0.99, 1.98, 1.99);
SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie');


------------------------- LIKE and ILIKE ----------------------------
SELECT * FROM customer WHERE first_name LIKE 'J%';
SELECT * FROM customer WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';
SELECT * FROM customer WHERE first_name LIKE 'j%' AND last_name LIKE 'S%';
SELECT * FROM customer WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%';
SELECT * FROM customer WHERE first_name ILIKE '%her%';
SELECT * FROM customer WHERE first_name ILIKE '_her%';
SELECT * FROM customer WHERE first_name NOT ILIKE '_her%';








