DROP DATABASE IF EXISTS soft_uni;
CREATE DATABASE soft_uni;
USE soft_uni;

# --- 14 ---

CREATE TABLE towns (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE addresses (
	id INT AUTO_INCREMENT PRIMARY KEY,
    address_text VARCHAR(256) NOT NULL, 
    town_id INT
);

ALTER TABLE addresses ADD CONSTRAINT fk_town_id FOREIGN KEY (town_id) REFERENCES towns(id);

CREATE TABLE departments (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    middle_name VARCHAR(30), 
    last_name VARCHAR(30), 
    job_title VARCHAR(50), 
    department_id INT, 
    hire_date DATE, 
    salary FLOAT, 
    address_id INT
);

ALTER TABLE employees ADD CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES departments(id);
ALTER TABLE employees ADD CONSTRAINT fk_address_id FOREIGN KEY (address_id) REFERENCES addresses(id);

# --- 15 ---

INSERT INTO `towns`(id, name) 
VALUES (1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna'),
(4, 'Burgas');

INSERT INTO `departments`(id, name)
VALUES (1, 'Engineering'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Software Development'),
(5, 'Quality Assurance');

INSERT INTO `employees`(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES ('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, str_to_date('01/02/2013', '%d/%m/%Y'), 3500.00),
('Petar', 'Petrov', 'Petrov',	'Senior Engineer', 1, str_to_date('02/03/2004', '%d/%m/%Y'), 4000.00),
('Maria', 'Petrova', 'Ivanova',	'Intern',	5,	str_to_date('28/08/2016', '%d/%m/%Y'),	525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO',	2, str_to_date('09/12/2007', '%d/%m/%Y'), 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3, str_to_date('28/08/2016', '%d/%m/%Y'), 599.88);

# --- 16 ---

SELECT * 
FROM `towns`;

SELECT * 
FROM `departments`;

SELECT * 
FROM `employees`;

# --- 17 ---

SELECT * 
FROM `towns` 
ORDER BY `name` ASC;

SELECT * 
FROM `departments` 
ORDER BY `name` ASC;

SELECT * 
FROM `employees` 
ORDER BY `salary` DESC;

# --- 18 ---

SELECT `name` 
FROM `towns` 
ORDER BY `name` ASC;

SELECT `name` 
FROM `departments` 
ORDER BY `name` ASC;

SELECT `first_name`, `last_name`, `job_title`, `salary` 
FROM `employees` 
ORDER BY `salary` DESC;

# --- 19 ---

SET SQL_SAFE_UPDATES = 0;

UPDATE `employees`
SET `salary` = `salary` * 1.1;

SELECT `salary` FROM `employees`;







