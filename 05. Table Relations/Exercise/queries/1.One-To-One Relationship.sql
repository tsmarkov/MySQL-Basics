CREATE DATABASE IF NOT EXISTS table_relations_exercise;
USE table_relations_exercise;

CREATE TABLE persons(
	person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    salary DECIMAL(8, 2),
    passport_id INT UNIQUE
);

CREATE TABLE passports(
	passport_id INT UNIQUE PRIMARY KEY,
    passport_number VARCHAR(8) UNIQUE
);

ALTER TABLE persons
ADD CONSTRAINT fk_persons_passports_passport_id
FOREIGN KEY (passport_id)
REFERENCES passports(passport_id);

INSERT INTO passports
VALUES (101, 'N34FG21B'),
		 (102,	'K65LO4R7'),
		 (103,	'ZE657QP2');
		 
INSERT INTO persons (first_name, salary, passport_id)
VALUES ('Roberto', 43300.00, 102),
		 ('Tom', 56100.00, 103),
		 ('Yana', 60200.00, 101);