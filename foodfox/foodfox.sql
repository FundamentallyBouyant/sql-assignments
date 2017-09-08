DROP SCHEMA IF EXISTS foodfox;
CREATE SCHEMA IF NOT EXISTS foodfox;
USE foodfox;

CREATE TABLE IF NOT EXISTS foodfox.restaurants(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    restaurant_name VARCHAR(45) NOT NULL,
    address VARCHAR(200) NOT NULL,
    category VARCHAR(45),
    PRIMARY KEY(id)
    );

CREATE TABLE IF NOT EXISTS foodfox.customers(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    address VARCHAR(200) NOT NULL,
    contact VARCHAR(13),
    PRIMARY KEY(id)
    );
    
CREATE TABLE IF NOT EXISTS foodfox.deliveryboy(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    contact VARCHAR(13) NOT NULL,
    PRIMARY KEY(id)
    );
    
CREATE TABLE IF NOT EXISTS foodfox.orders(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    customer_id INT UNSIGNED NOT NULL,
    deliveryboy_id INT UNSIGNED,
    restaurant_id INT UNSIGNED NOT NULL,
    details VARCHAR(200),
    address VARCHAR(200) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_orders_customer_id
    FOREIGN KEY(customer_id) REFERENCES customers(id),
    CONSTRAINT fk_orders_deliveryboy_id
    FOREIGN KEY(deliveryboy_id) REFERENCES deliveryboy(id),
    CONSTRAINT fk_orders_restaurant_id
    FOREIGN KEY(restaurant_id) REFERENCES restaurants(id)
    );
    
    
    
    