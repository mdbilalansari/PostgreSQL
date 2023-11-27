----------------------- TIMESTAMP and EXTRACT -----------------------

SHOW ALL;
SHOW TIMEZONE;
SELECT now();
SELECT timeofday();
SELECT current_time;
SELECT current_date;

--	EXTRACT()
SELECT * FROM payment;
SELECT EXTRACT(YEAR FROM payment_date) FROM payment;
SELECT EXTRACT(YEAR FROM payment_date) AS pay_year FROM payment;
SELECT EXTRACT(MONTH FROM payment_date) AS pay_month FROM payment;
SELECT EXTRACT(DAY FROM payment_date) AS pay_date FROM payment;

--	AGE()
SELECT AGE(payment_date) FROM payment;

--	TO_CHAR()
SELECT TO_CHAR(payment_date, 'Month-yyyy') FROM payment;
SELECT TO_CHAR(payment_date, 'mm-yyyy') FROM payment;
SELECT TO_CHAR(payment_date, 'dd/mm/yyyy') FROM payment;
SELECT TO_CHAR(payment_date, 'Day dd Month, yyyy') FROM payment;


--------------- Mathematical Functions and Operators ----------------

SELECT * FROM film;
SELECT round(100 * (rental_rate / replacement_cost)) AS percent_cost FROM film;


------------------ String Functions and Operators -------------------

SELECT first_name, length(first_name) FROM customer;
SELECT first_name || ' ' || last_name  AS full_name FROM customer;
SELECT upper(first_name || ' ' || last_name)  AS full_name FROM customer;

SELECT lower(left(first_name, 1) || last_name) || '@gmail.com' AS custom_email
FROM customer; 


----------------------------- Sub-Query ------------------------------
SELECT avg(rental_rate) FROM film;
SELECT title, rental_rate FROM film
WHERE rental_rate > (SELECT avg(rental_rate) FROM film);
SELECT title, rental_rate, (SELECT avg(rental_rate) FROM film) FROM film
WHERE rental_rate > (SELECT avg(rental_rate) FROM film);

SELECT * FROM rental WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30';
SELECT film_id
FROM rental 
INNER JOIN inventory 
ON rental.inventory_id = inventory.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30';

SELECT film_id, title FROM film
where film_id IN
(SELECT film_id
FROM rental 
INNER JOIN inventory 
ON rental.inventory_id = inventory.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY film_id;

-- EXISTS()
SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS(
	SELECT * FROM payment AS p
	WHERE p.customer_id = c.customer_id AND amount > 11
);


SELECT first_name, last_name
FROM customer AS c
WHERE NOT EXISTS(
	SELECT * FROM payment AS p
	WHERE p.customer_id = c.customer_id AND amount > 11
)

----------------------------- Self-Join -----------------------------

SELECT f1.title, f2.title, f1.length
FROM film as f1
INNER JOIN film as f2
ON f1.length = f2.length;

SELECT f1.title, f2.title, f1.length
FROM film as f1
INNER JOIN film as f2
ON f1.length = f2.length AND f1.title != f2.title;

