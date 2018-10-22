CREATE DATABASE IF NOT EXISTS university;
USE university;

CREATE TABLE students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_number VARCHAR(12) NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    major_id INT
);

CREATE TABLE majors(
	major_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE payments(
	payment_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_date DATE,
    payment_amount DECIMAL(8, 2) NOT NULL,
    student_id INT
);

CREATE TABLE subjects(
	subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL
);

CREATE TABLE agenda(
	student_id INT NOT NULL,
    subject_id INT NOT NULL
);

ALTER TABLE students
ADD CONSTRAINT fk_students_majors
FOREIGN KEY (major_id)
REFERENCES majors(major_id);

ALTER TABLE payments
ADD CONSTRAINT fk_payments_students
FOREIGN KEY (student_id)
REFERENCES students(student_id);

ALTER TABLE agenda
ADD CONSTRAINT PRIMARY KEY (student_id, subject_id),
ADD CONSTRAINT fk_agenda_students
	FOREIGN KEY (student_id)
    REFERENCES students(student_id),
ADD CONSTRAINT fk_agenda_subject
	FOREIGN KEY (subject_id)
    REFERENCES subjects(subject_id);
    



