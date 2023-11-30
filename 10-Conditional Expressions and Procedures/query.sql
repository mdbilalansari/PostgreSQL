-- Active: 1700925063264@@127.0.0.1@5432@learning
------------------------------------- CASE -------------------------------------
SELECT * FROM customer;

--	CASE Statement
SELECT customer_id,
CASE 
	WHEN (customer_id <= 100) THEN  'Premium'
	WHEN  (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE	'Normal'
END
FROM customer;
SELECT customer_id,
CASE 
	WHEN (customer_id <= 100) THEN  'Premium'
	WHEN  (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE	'Normal'
END AS customer_class
FROM customer;

--	CASE Expression
SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second Place'
	ELSE 'Normal'
END AS raffle_result
FROM customer;


SELECT rental_rate FROM film;

SELECT rental_rate,
CASE rental_rate
	WHEN 0.99 THEN  1
	ELSE  0
END
FROM film;

SELECT
SUM(CASE rental_rate
	WHEN 0.99 THEN  1
	ELSE  0
END) AS number_of_bargains
FROM film;

SELECT
SUM(CASE rental_rate
	WHEN 0.99 THEN  1
	ELSE  0
END) AS bargian,
SUM(CASE rental_rate
	WHEN 2.99 THEN  1
	ELSE  0
END) AS regular,
SUM(CASE rental_rate
	WHEN 4.99 THEN  1
	ELSE  0
END) AS premium
FROM film;

--	Other Method
SELECT 
(SELECT count(*) FROM film WHERE rental_rate = 0.99) AS bargian,
(SELECT count(*) FROM film WHERE rental_rate = 2.99) AS regular,
(SELECT count(*) FROM film WHERE rental_rate = 4.99) AS premium
;

------------------------------------- CAST -------------------------------------

SELECT CAST('5' AS INTEGER) AS num;
SELECT '5'::INTEGER AS num;


SELECT * FROM rental;
SELECT CAST(inventory_id AS VARCHAR) FROM rental;
SELECT char_length(CAST(inventory_id AS VARCHAR)) FROM rental;



------------------------------------ NULLIF ------------------------------------

--	Before running query connect to Learning Detabase
CREATE TABLE test.depts(
	first_name VARCHAR(50),
	department VARCHAR(50)
);

INSERT INTO test.depts(first_name, department)
VALUES
('Vinton', 'A'),
('Lauren', 'A');

INSERT INTO test.depts(first_name, department)
VALUES
('Claire', 'B');

DELETE FROM test.depts WHERE department = 'B';


SELECT * FROM test.depts;

SELECT (
	sum(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
	NULLIF(sum(CASE WHEN department = 'B' THEN 1 ELSE 0 END), 0)
) AS department_ratio
FROM test.depts;



------------------------------------- VIEW -------------------------------------

CREATE VIEW customer_info AS
SELECT first_name, last_name, address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;
SELECT * FROM c_info;

DROP VIEW IF EXISTS customer_info;

ALTER VIEW customer_info RENAME TO c_info;
ALTER VIEW  c_info RENAME TO customer_info;



------------------------------------- VIEW -------------------------------------

--	Before running query connect to Learning Detabase
CREATE TABLE test.simple_table(
	name VARCHAR(50),
	mobile_num VARCHAR(20),
	email VARCHAR(100)
);

SELECT * FROM test.simple_table;



