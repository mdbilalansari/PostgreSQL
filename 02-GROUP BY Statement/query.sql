------------------------- AGGREGATE FUNCTION ------------------------

--  MIN() and MAX()
SELECT * FROM film;
SELECT MIN(replacement_cost) FROM film;
SELECT MAX(replacement_cost) FROM film;
SELECT MIN(replacement_cost), MAX(replacement_cost) FROM film;

--  COUNT()
SELECT COUNT(*) FROM film;

--  AVG() and ROUND()
SELECT AVG(replacement_cost) FROM film;
SELECT ROUND(AVG(replacement_cost), 2) FROM film;
SELECT ROUND(AVG(replacement_cost), 3) FROM film;

--  SUM()
SELECT SUM(replacement_cost) FROM film;


------------------------------ GROUP BY -----------------------------
SELECT * FROM payment;
SELECT customer_id FROM payment GROUP BY customer_id;
SELECT DISTINCT customer_id FROM payment;
SELECT customer_id FROM payment GROUP BY customer_id ORDER BY customer_id;
SELECT DISTINCT customer_id FROM payment ORDER BY customer_id;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id;
SELECT customer_id, SUM(amount) FROM payment 
GROUP BY customer_id 
ORDER BY SUM(amount);
SELECT customer_id, SUM(amount) FROM payment 
GROUP BY customer_id 
ORDER BY SUM(amount) DESC;
SELECT customer_id, COUNT(amount) FROM payment 
GROUP BY customer_id 
ORDER BY COUNT(amount) DESC;

SELECT staff_id, customer_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id;
SELECT staff_id, customer_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY staff_id;
SELECT customer_id,staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id, staff_id;

--  GROUP BY with Dates:
SELECT DATE(payment_date) FROM payment;
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY DATE(payment_date);


------------------------------- HAVING ------------------------------
SELECT * FROM payment;
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id;
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) >= 100;

SELECT * FROM customer;
SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id;
SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

