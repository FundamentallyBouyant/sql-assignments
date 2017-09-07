
CREATE SCHEMA IF NOT EXISTS ecom ;

USE ecom;

CREATE TABLE IF NOT EXISTS ecom.supplier (
  supplier_id INT NOT NULL,
  supplier_name VARCHAR(45) NOT NULL,
  supplier_address VARCHAR(45) NOT NULL,
  contact VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  PRIMARY KEY (supplier_id),
  UNIQUE INDEX supplier_id_UNIQUE (supplier_id ASC));

CREATE TABLE IF NOT EXISTS ecom.items (
  item_id INT NOT NULL,
  supplier_id INT NOT NULL,
  item_name VARCHAR(45) NOT NULL,
  price VARCHAR(45) NOT NULL,
  manufacture_date DATE NULL,
  PRIMARY KEY (item_id),
  INDEX fk_items_1_idx (supplier_id ASC),
  CONSTRAINT fk_items_1
    FOREIGN KEY (supplier_id)
    REFERENCES ecom.supplier (supplier_id));

CREATE TABLE IF NOT EXISTS ecom.customer (
  customer_id INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  address VARCHAR(45) NOT NULL,
  phone INT NOT NULL,
  order_id INT NOT NULL,
  PRIMARY KEY (customer_id),
  UNIQUE INDEX order_id_UNIQUE (order_id ASC),
  UNIQUE INDEX customer_id_UNIQUE (customer_id ASC));

CREATE TABLE IF NOT EXISTS ecom.orders (
  order_id INT NOT NULL,
  item_id INT NOT NULL,
  supplier_id INT NOT NULL,
  delivery_address VARCHAR(45) NULL,
  PRIMARY KEY (order_id),
  UNIQUE INDEX order_id_UNIQUE (order_id ASC),
  CONSTRAINT fk_orders_1
    FOREIGN KEY (order_id)
    REFERENCES ecom.customer (order_id),
  CONSTRAINT fk_orders_2
    FOREIGN KEY (item_id)
    REFERENCES ecom.items (item_id),
  CONSTRAINT fk_orders_3
    FOREIGN KEY (supplier_id)
    REFERENCES ecom.supplier (supplier_id));


