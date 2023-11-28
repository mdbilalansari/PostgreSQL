-------------------------------- CREATE TABLE ---------------------------------

CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);


CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
);


CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
);


------------------------------------ INSERT -----------------------------------

SELECT * FROM account;
INSERT INTO account(username, password, email, created_on)
VALUES
('Jose', 'password', 'jose@gmail.com', CURRENT_TIMESTAMP);

SELECT * FROM job;
INSERT INTO job(job_name)
VALUES
('Astronaut');

INSERT INTO job(job_name)
VALUES
('President');

SELECT * FROM account_job;
INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(1, 1, current_timestamp);

-- if the user_id & job_id is not found in referenced table, insertion will fail
INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(10, 3, current_timestamp);



------------------------------------ UPDATE -----------------------------------

SELECT * FROM account;
UPDATE account
SET last_login = CURRENT_TIMESTAMP;

UPDATE account
SET last_login = created_on;


SELECT * FROM account_job;
UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;


SELECT * FROM account;
UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING user_id, username, email, created_on, last_login;



------------------------------------ DELETE -----------------------------------

SELECT * FROM job;
INSERT INTO job(job_name)
VALUES
('Cowboy'),
('Driver'),
('Pilot');

DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id, job_name;



------------------------------------ ALTER ------------------------------------

CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
);

SELECT * FROM information;

-- RENAME TABLE
ALTER TABLE information
RENAME TO new_info;
ALTER TABLE new_info
RENAME TO information;

-- RENAME COLUMN
ALTER TABLE information
RENAME COLUMN person TO people;

-- REMOVE CONSTRAINT
ALTER TABLE information
ALTER COLUMN people DROP NOT NULL;

-- ADD CONSTRAINT
ALTER TABLE information
ALTER COLUMN people SET NOT NULL;


--------------------------------- DROP COLUMN ---------------------------------

SELECT * FROM information;
ALTER TABLE information
DROP COLUMN people;
ALTER TABLE information
DROP COLUMN IF EXISTS people;



------------------------------- CHECK Constraint ------------------------------

CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK(birthdate > '1900-01-01'),
	hire_date DATE CHECK(hire_date > birthdate),
	salary INTEGER CHECK(salary > 0)
);

INSERT INTO employees (first_name, last_name, birthdate, hire_date, salary)
VALUES
	('Jose', 'Portilla', '1999-11-03', '2023-07-03', 54630);

SELECT * FROM employees;

-- Insertion voilating constraints 
INSERT INTO employees (first_name, last_name, birthdate, hire_date, salary)
VALUES
	('Jose', 'Portilla', '1800-11-03', '2023-07-03', 54630);

INSERT INTO employees (first_name, last_name, birthdate, hire_date, salary)
VALUES
	('Jose', 'Portilla', '1985-11-03', '1984-07-03', 54630);

INSERT INTO employees (first_name, last_name, birthdate, hire_date, salary)
VALUES
	('Jose', 'Portilla', '1999-11-03', '2023-07-03', 0);