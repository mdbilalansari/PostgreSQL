------------------------------------- CASE -------------------------------------

--	Challenge 1:
--	●	We want to know and compare the various amounts of films we have per
-- 		movie rating.
--	●	Use CASE and the dvdrental database to re-create this table:
--			-------------------------
--			| R		| PG	| PG13	|
--			-------------------------
--			| 195	| 194	| 223	|
--			-------------------------

SELECT * FROM film;

SELECT rating,
CASE rating
	WHEN 'R' THEN  1
	ELSE  0
END AS R
FROM film;

SELECT
sum(CASE rating
	WHEN 'R' THEN  1
	ELSE  0
END)  AS R,
sum(CASE rating
	WHEN 'PG' THEN  1
	ELSE  0
END)  AS PG,
sum(CASE rating
	WHEN 'PG-13' THEN  1
	ELSE  0
END)  AS PG13
FROM film;

--	Other Method
SELECT 
(SELECT count(*) FROM film WHERE rating = 'R') AS R,
(SELECT count(*) FROM film WHERE rating  = 'PG') AS PG,
(SELECT count(*) FROM film WHERE rating = 'PG-13') AS PG13
;


