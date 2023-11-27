----------------------- TIMESTAMP and EXTRACT -----------------------

--	Challenge 1:
--	●	During which months did payments occur?
--	●	Format your answer to return back the full month name.

SELECT * FROM payment;
SELECT TO_CHAR(payment_date, 'Month') FROM payment;
SELECT DISTINCT(TO_CHAR(payment_date, 'Month')) FROM payment;


--	Challenge 2:
--	●	How many payments occurred on a Monday?
--	●	NOTE: We didn’t show you exactly how to do this, but use the 
--		documentation or Google to figure this out!

SELECT * FROM payment;
SELECT TO_CHAR(payment_date, 'Day') FROM payment;
SELECT COUNT(*) FROM payment
WHERE TO_CHAR(payment_date, 'Day') ILIKE 'Monday%';
SELECT COUNT(*) FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 1;