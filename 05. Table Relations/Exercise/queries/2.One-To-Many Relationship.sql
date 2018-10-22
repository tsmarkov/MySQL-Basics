CREATE DATABASE IF NOT EXISTS table_relations_exercise;
USE table_relations_exercise;

CREATE TABLE manufacturers(
	manufacturer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    established_on DATE
);

CREATE TABLE models(
	model_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    manufacturer_id INT NOT NULL
);

ALTER TABLE models
ADD CONSTRAINT fk_models_manufacturers_manufacturer_id
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturers(manufacturer_id);

INSERT INTO manufacturers
VALUES (1, 'BMW', '1916-03-01'),
	(2,	'Tesla', '2003-01-01'),
	(3,	'Lada', '1966-05-01');

INSERT INTO models
VALUES (101, 'X1', 1),
	(102, 'i6',	1),
	(103, 'Model S', 2),
	(104, 'Model X', 2),
	(105, 'Model 3', 2),
	(106, 'Nova', 3);