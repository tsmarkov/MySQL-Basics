CREATE DATABASE IF NOT EXISTS online_store;
USE online_store;

CREATE TABLE items(
	item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    item_type_id INT
);

CREATE TABLE item_types(
	item_type_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL
);

CREATE TABLE order_items(
	order_id INT NOT NULL,
    item_id INT NOT NULL
);

CREATE TABLE customers(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birthday DATE,
    city_id INT
);

CREATE TABLE cities(
	city_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

ALTER TABLE items
ADD CONSTRAINT fk_items_item_types
FOREIGN KEY (item_type_id)
REFERENCES item_types(item_type_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE order_items
ADD CONSTRAINT PRIMARY KEY(order_id, item_id),
ADD CONSTRAINT fk_order_id
	FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
ADD CONSTRAINT fk_items_id
	FOREIGN KEY (item_id)
    REFERENCES items(item_id);
    
ALTER TABLE customers
ADD CONSTRAINT fk_customers_cities
FOREIGN KEY (city_id)
REFERENCES cities(city_id);