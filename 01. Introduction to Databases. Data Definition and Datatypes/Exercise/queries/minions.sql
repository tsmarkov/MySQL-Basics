#CREATE DATABASE IF NOT EXISTS minions;

DROP DATABASE IF EXISTS  minions;
CREATE DATABASE minions;

USE minions;

# --- 1 ---

CREATE TABLE minions(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    age INT
);

# --- 2 ---

CREATE TABLE towns(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20)
);

# --- 3 ---

ALTER TABLE minions ADD COLUMN town_id INT;
ALTER TABLE minions ADD CONSTRAINT town_id FOREIGN KEY (town_id) REFERENCES towns(id);

INSERT INTO towns (id, name) VALUES (1, 'Sofia');
INSERT INTO towns (id, name) VALUES (2, 'Plovdiv');
INSERT INTO towns (id, name) VALUES (3, 'Varna');

INSERT INTO minions (id, name, age, town_id) VALUES (1, 'Kevin', 22, 1);
INSERT INTO minions (id, name, age, town_id) VALUES (2, 'Bob', 15, 3);
INSERT INTO minions (id, name, age, town_id) VALUES (3, 'Steward', NULL, 2);

# --- 4 ---

TRUNCATE TABLE minions;

# --- 5 ---

DROP TABLES minions, towns;

# --- 6 ---

CREATE TABLE people(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    picture TINYBLOB,
    height FLOAT(5, 2),
    weight FLOAT(5, 2),
    gender ENUM('m', 'f') NOT NULL,
    birthdate Date NOT NULL,
    biography TEXT
);

INSERT INTO people(id, name, picture, height, weight, gender, birthdate, biography) 
VALUES (1, 'Pesho', null, 1.30, 123.43, 'm', '2012-12-12', 'Pesho 1'),
(2, 'Gosho', null, 1.23, 43.21, 'm', '1924-12-12', 'Gosho 1'),
(3, 'Maria', null, 1.53, 63.98, 'f', '1994-12-12', 'Maria 1'),
(4, 'Ivan', null, 1.12, 83.45, 'm', '1932-12-12', 'Ivan 1'),
(5, 'Elizabeth', null, 1.65, 87.12, 'f', '1999-12-12', 'Eliz 1');

# --- 7 ---

CREATE TABLE users(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(26) NOT NULL,
    profile_picture BLOB(900),
	last_login_time DATETIME,
    is_deleted BIT DEFAULT 0
);

INSERT INTO users(id, username, password, profile_picture, last_login_time, is_deleted) 
VALUES (1, 'Pesho1', '123456', NULL, date(now()), 1),
(2, 'Pesho2', '123456', NULL, date(now()), 0),
(3, 'Pesho3', '123456', NULL, date(now()), 1),
(4, 'Pesho4', '123456', NULL, date(now()), 1),
(5, 'Pesho5', '123456', NULL, date(now()), 0);

# --- 8 ---

ALTER TABLE users MODIFY id	INT NOT NULL;
ALTER TABLE users DROP PRIMARY KEY;

ALTER TABLE users ADD CONSTRAINT pk_users PRIMARY KEY (id, username);

# --- 9 ---

ALTER TABLE users MODIFY last_login_time DATETIME DEFAULT CURRENT_TIMESTAMP;

# --- 10 ---

ALTER TABLE users MODIFY id INT NOT NULL;
ALTER TABLE users MODIFY username VARCHAR(30) NOT NULL;

ALTER TABLE users DROP PRIMARY KEY, ADD PRIMARY KEY(id);