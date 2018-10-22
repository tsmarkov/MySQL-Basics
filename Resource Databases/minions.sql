CREATE DATABASE IF NOT EXISTS minions;
USE minions;

CREATE TABLE minions
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	age INT,
	CONSTRAINT pk_minions PRIMARY KEY (id)
);

CREATE TABLE towns
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name TEXT
);

INSERT INTO minions(name,age) VALUES ('Kevin',15);
INSERT INTO minions(name,age) VALUES ('Bob',22);
INSERT INTO minions(name) VALUES ('Steward');

INSERT INTO minions.towns(name) VALUES('Sofia');
INSERT INTO minions.towns(name) VALUES('Plovdiv');

ALTER TABLE minions ADD town_id INT;


ALTER TABLE minions ADD CONSTRAINT fk_minions_towns FOREIGN KEY(town_id) REFERENCES towns (id);

SELECT name FROM minions ORDER BY minions.name ASC;

UPDATE minions SET minions.age=10 WHERE minions.name='Steward';

SELECT * FROM minions;