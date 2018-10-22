USE camp;

CREATE TABLE mountains(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE peaks(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    mountain_id INT,
    CONSTRAINT fk_mountain_id
    FOREIGN KEY (mountain_id)
    REFERENCES mountains(id)
    ON DELETE CASCADE
);