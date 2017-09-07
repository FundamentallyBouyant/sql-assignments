DROP SCHEMA IF EXISTS ecom;
CREATE SCHEMA IF NOT EXISTS ecom;
USE ecom;

CREATE TABLE IF NOT EXISTS ecom.suppliers(
	id INT UNSIGNED UNIQUE NOT NULL,
    supplier_name VARCHAR(45) NOT NULL,
    address VARCHAR(200) NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
    );

CREATE TABLE IF NOT EXISTS ecom.customers(
	id INT UNSIGNED UNIQUE NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    address VARCHAR(200),
    contact INT UNSIGNED,
    PRIMARY KEY(id)
    );
    
CREATE TABLE IF NOT EXISTS ecom.items(
	id INT UNSIGNED UNIQUE NOT NULL,
    item_name VARCHAR(45) NOT NULL,
    supplier_id INT UNSIGNED,
    description VARCHAR(200),
    quantity INT UNSIGNED,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT fk_items_supplier_id
    FOREIGN KEY(supplier_id) REFERENCES suppliers(id)
    );
    
CREATE TABLE IF NOT EXISTS ecom.orders(
	id INT UNSIGNED NOT NULL,
    customer_id INT UNSIGNED,
    order_processed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount INT UNSIGNED,
    PRIMARY KEY(id),
	CONSTRAINT fk_orders_customer_id
    FOREIGN KEY(customer_id) REFERENCES customers(id)
    );
    
CREATE TABLE IF NOT EXISTS ecom.order_items(
	order_id INT UNSIGNED NOT NULL,
    item_id INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED DEFAULT 1,
    CONSTRAINT fk_order_items_order_id
    FOREIGN KEY(order_id) REFERENCES orders(id),
    CONSTRAINT fk_item_items_item_id
    FOREIGN KEY(item_id) REFERENCES items(id)
    );