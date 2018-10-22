DROP DATABASE IF EXISTS car_rental;
CREATE DATABASE car_rental;
USE car_rental;

# --- 12 ---

CREATE TABLE categories(
	id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50),
    daily_rate FLOAT, 
    weekly_rate FLOAT, 
    monthly_rate FLOAT, 
    weekend_rate FLOAT
);

INSERT INTO categories(id, category, daily_rate, weekly_rate, weekend_rate)
VALUES (1, 'bus', 1.2, 5.5, 2.6),
(2, 'car', 2.2, 8.5, 4.6),
(3, 'suv', 3.2, 8.5, 5.6);

CREATE TABLE cars(
	id INT AUTO_INCREMENT PRIMARY KEY,
    plate_number VARCHAR(20),
    make VARCHAR(50),
    model VARCHAR(50),
    car_year INT UNSIGNED,
    category_id INT,
    doors INT,
    picture VARCHAR(256),
    car_condition VARCHAR(256),
    available BIT
);

INSERT INTO cars(id, plate_number, make, model, car_year, category_id, doors, picture, car_condition, available)
VALUES (1, 'PB 0021 AX', 'Lamborgini', 'Urus', 2018, 3, 5, 'http://lambo-mambo.com/lambo-urus.jpg', 'Like new', 1),
(2, 'B 0154 A', 'Tesla', 'Model S', 2017, 2, 5, 'http://tesla.com/model-s.jpg', 'Like new', 1),
(3, 'CB 4542 BP', 'BMW', 'M4', 2018, 3, 2, 'http://bmw.com/bmw-m4.jpg', 'Like new M4', 0);

CREATE TABLE employees(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    title VARCHAR(50) NOT NULL,
    notes TEXT
);

INSERT INTO employees(id, first_name, last_name, title, notes)
VALUES (1, 'FirstName 1', 'LastName 1', 'Mechanic', 'Notes 1'),
(2, 'FirstName 2', 'LastName 2', 'Saler', 'Notes 2'),
(3, 'FirstName 3', 'LastName 3', 'Cleaner', 'Notes 3');

CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    driver_licence_number VARCHAR(20), 
    full_name VARCHAR(50),
    address VARCHAR(256),
    city VARCHAR(50),
    zip_code VARCHAR(10), 
    notes TEXT
);

INSERT INTO customers(id, driver_licence_number, full_name, address, city, zip_code, notes)
VALUES (1, '63041296312', 'Full Name 1', 'Str 1', 'City 1', '0000', 'Notes 1'),
(2, '93159832156', 'Full Name 2', 'Str 2', 'City 2', '0001', 'Notes 2'),
(3, '28702437296', 'Full Name 3', 'Str 3', 'City 3', '0002', 'Notes 3');

CREATE TABLE rental_orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT, 
    customer_id INT,
    car_id INT,
    car_condition VARCHAR(256),
    tank_level INT,
    kilometrage_start INT,
    kilometrage_end INT,
    total_kilometrage INT,
    start_date DATE,
    end_date DATE,
    total_days INT,
    rate_applied INT,
    tax_rate INT,
    order_status VARCHAR(50),
    notes TEXT
);

INSERT INTO rental_orders(
	id,
    employee_id, 
    customer_id,
    car_id,
    car_condition,
    tank_level,
    kilometrage_start,
    kilometrage_end,
    total_kilometrage,
    start_date,
    end_date,
    total_days,
    rate_applied,
    tax_rate,
    order_status,
    notes
) 
VALUES (1, 1, 2, 1, 'New', 10, 100000, 500000, 100111, date(now()), date(now()), 20000, 30, 30, 'waiting', 'Notes 1'),
(2, 2, 1, 2, 'Broken', 10, 200000, 600000, 200111, date(now()), date(now()), 30000, 20, 20, 'done', 'Notes 2'),
(3, 3, 3, 3, 'New', 10, 300000, 700000, 300111, date(now()), date(now()), 40000, 10, 10, 'unavailable', 'Notes 3');