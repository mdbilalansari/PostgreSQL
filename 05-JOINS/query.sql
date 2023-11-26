--------------------------------- AS --------------------------------

SELECT payment_id FROM payment;
SELECT payment_id AS id FROM payment;

SELECT COUNT(amount) FROM payment;
SELECT COUNT(amount) As num_transactions FROM payment;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id;
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id;

SELECT customer_id, amount AS new_name
FROM payment
WHERE amount > 5;

--  CANNOT use alias at any place other than SELECT statement
SELECT customer_id, amount AS new_name
FROM payment
WHERE new_name > 5


----------------------------- INNER JOIN ----------------------------

SELECT * FROM payment;
SELECT * FROM customer;
SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;
SELECT payment_id, payment.customer_id, first_name, last_name, email
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

--  Order of selecting table does not matter
SELECT payment_id, payment.customer_id, first_name, last_name, email
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id;


----------------------------- FULL OUTER JOIN ----------------------------

SELECT * FROM payment;
SELECT * FROM customer;

--  Order of selecting table does not matter
SELECT * FROM customer
FULL OUTER JOIN payment
On customer.customer_id = payment.customer_id;

SELECT * FROM customer
FULL OUTER JOIN payment
On customer.customer_id = payment.customer_id
WHERE customer.customer_id IS NULL
OR payment.customer_id IS NULL;

SELECT COUNT(DISTINCT customer_id) FROM customer;
SELECT COUNT(DISTINCT customer_id) FROM payment;


-------------------- LEFT OUTER JOIN | LEFT JOIN --------------------

SELECT * FROM film;
SELECT * FROM inventory;
SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id;

SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL;

------------------- RIGHT OUTER JOIN | RIGHT JOIN -------------------

--  Similar to left join
--  Just switch the order of table in the LEFT JOIN to get the RIGHT JOIN
SELECT film.film_id, title, inventory_id, store_id
FROM inventory
RIGHT JOIN film
ON film.film_id = inventory.film_id;

SELECT film.film_id, title, inventory_id, store_id
FROM inventory
RIGHT JOIN film
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL;


