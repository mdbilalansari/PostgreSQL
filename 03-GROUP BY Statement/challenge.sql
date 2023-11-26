------------------------------ GROUP BY -----------------------------

--	Challenge 1:
--  ●	We have two staff members, with Staff IDs 1 and 2. We want to
-- 		give a bonus to the staff member that handled the most 
-- 		payments. (Most in terms of number of payments processed, not
-- 		total dollar amount).
--	● 	How many payments did each staff member handle and who gets 
-- 		the bonus?

SELECT * FROM payment;
SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id;

--	Challenge 2:
--	●	Corporate HQ is conducting a study on the relationship between
-- 		replacement cost and a movie MPAA rating (e.g. G, PG, R, etc…).
--	●	What is the average replacement cost per MPAA rating? 
--		○	Note: You may need to expand the AVG column to view correct
-- 			results

SELECT * FROM film;
SELECT rating, AVG(replacement_cost)
FROM film
GROUP BY rating;
SELECT rating, ROUND(AVG(replacement_cost))
FROM film
GROUP BY rating;

--	Challenge 3:
--	●	We are running a promotion to reward our top 5 customers with
-- 		coupons.
--	●	What are the customer ids of the top 5 customers by total 
-- 		spend?

SELECT * FROM payment;
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id;
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;


------------------------------- HAVING ------------------------------

--	Challenge 1:
--	●	We are launching a platinum service for our most loyal customers.
-- 		We will assign platinum status to customers that have had 40 or
-- 		more transaction payments.
--	●	What customer_ids are eligible for platinum status?

SELECT * FROM payment;
SELECT customer_id, count(payment_id) FROM payment
GROUP BY customer_id;
SELECT customer_id, count(payment_id) FROM payment
GROUP BY customer_id
HAVING count(payment_id) >= 40;

--	Challenge 2:
--	●	What are the customer ids of customers who have spent more than
-- 		$100 in payment transactions with our staff_id member 2?

SELECT * FROM payment;
SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;
