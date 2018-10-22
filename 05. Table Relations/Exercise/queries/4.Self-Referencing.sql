CREATE DATABASE IF NOT EXISTS table_relations_exercise;
USE table_relations_exercise;

CREATE TABLE teachers(
	teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    manager_id INT,
    CONSTRAINT fk_manager_teacher
		FOREIGN KEY (manager_id)
        REFERENCES teachers(teacher_id)
);

INSERT INTO teachers
VALUES (101, 'John', NULL),
	(105, 'Mark', 101),
    (104, 'Ted', 105),
    (106, 'Greta', 101),
    (102, 'Maya', 106),
	(103, 'Silvia', 106);
	