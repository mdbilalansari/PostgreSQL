-------------------------------- JOIN -------------------------------

--	Challenge 1:
--	●	California sales tax laws have changed and we need to alert our
--		customers to this through email.
--	●	What are the emails of the customers who live in California?

SELECT * FROM customer;
SELECT * FROM address;
SELECT first_name, email, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district='California';


--	Challenge 2:
--	●	A customer walks in and is a huge fan of the actor 
--		“Nick Wahlberg” and wants to know which movies he is in.
--	●	Get a list of all the movies “Nick Wahlberg” has been in.

SELECT * FROM actor;
SELECT * FROM film_actor;
SELECT fulltext FROM film;

SELECT actor.actor_id, first_name, last_name, film_actor.film_id FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';

SELECT actor.actor_id, first_name, last_name, film_actor.film_id, title
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';