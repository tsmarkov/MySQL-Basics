DROP DATABASE IF EXISTS hotel;
CREATE DATABASE hotel;
USE hotel;

# --- 13 ---

CREATE TABLE employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL, 
    notes TEXT
);

INSERT INTO employees(id, first_name, last_name, title, notes)
VALUES (1, 'FirstName1', 'LastName1', 'Administrator', 'Note 1'),
(2, 'FirstName2', 'LastName2', 'Maid', 'Note 2'),
(3, 'FirstName3', 'LastName3', 'Technician', 'Note 3');


CREATE TABLE customers(
	account_number INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL, 
    phone_number VARCHAR(50),
    emergency_name VARCHAR(50), 
    emergency_number VARCHAR(50),
    notes TEXT
);

INSERT INTO customers(account_number, first_name, last_name, phone_number, emergency_name, emergency_number, notes)
VALUES (1, 'FirstName1', 'LastName1', '+359888888884', 'EmergencyName1', '+359888888885', 'Note 1'),
(2, 'FirstName2', 'LastName3', '+359888888886', 'EmergencyName2', '+359888888887', 'Note 2'),
(3, 'FirstName2', 'LastName3', '+359888888888', 'EmergencyName3', '+359888888889', 'Note 3');

CREATE TABLE room_status (
    room_status VARCHAR(30) PRIMARY KEY,
    notes TEXT
);

INSERT INTO room_status (room_status, notes)
VALUES ('For cleaning', 'Note 1'),
('Available', 'Note 2'),
('Unavailable', 'Note 3');

CREATE TABLE room_types (
    room_type VARCHAR(50) PRIMARY KEY, 
    notes TEXT
);

INSERT INTO room_types (room_type, notes)
VALUES ('Double', 'Note 1'),
('Studio', 'Note 2'),
('Apartament', 'Note 3');

CREATE TABLE bed_types (
    bed_type VARCHAR(50) PRIMARY KEY,
    notes TEXT
);

INSERT INTO bed_types (bed_type, notes)
VALUES ('Single', 'Note 1'),
('Double', 'Note 2'),
('Double + Signle', 'Note 3');

CREATE TABLE rooms (
	room_number INT AUTO_INCREMENT PRIMARY KEY, 
    room_type INT, 
    bed_type INT, 
    rate INT, 
    room_status INT, 
    notes TEXT
);

INSERT INTO rooms (room_number, room_type, bed_type, rate, room_status, notes)
VALUES (1, 1, 1, 3, 1, 'Note 1'),
(2, 2, 2, 2, 1, 'Note 2'),
(3, 3, 3, 5, 2, 'Note 3');

CREATE TABLE payments (
	id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    payment_date DATE,
    account_number INT,
    first_date_occupied DATE,
    last_date_occupied DATE,
    total_days INT, 
    amount_charged FLOAT,
    tax_rate FLOAT, 
    tax_amount FLOAT, 
    payment_total FLOAT NOT NULL, 
    notes TEXT
);

INSERT INTO payments (id, employee_id, payment_date, account_number, first_date_occupied, last_date_occupied, total_days, amount_charged, tax_rate, tax_amount, payment_total, notes)
VALUES (1, 1, date(now()), 1, date(now()), date(now()), 10, 10.00, 20.00, 30.00, 2000.20, 'Note 1'),
(2, 2, date(now()), 2, date(now()), date(now()), 20, 20.00, 30.00, 40.00, 1000.20, 'Note 2'),
(3, 3, date(now()), 3, date(now()), date(now()), 30, 30.00, 40.00, 50.00, 800.20, 'Note 3');

CREATE TABLE occupancies (
	id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date_occupied DATE,
    account_number INT,
    room_number INT ,
    rate_applied INT,
    phone_charge VARCHAR(20),
    notes TEXT
);

INSERT INTO occupancies (id, employee_id, date_occupied, account_number, room_number, rate_applied, phone_charge, notes)
VALUES (1, 1, date(now()), 1, 1, 2, 1, 'Note 1'),
(2, 2, date(now()), 2, 2, 5, 1, 'Note 2'),
(3, 3, date(now()), 3, 3, 2, 1, 'Note 3');
