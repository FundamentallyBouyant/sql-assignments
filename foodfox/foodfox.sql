
CREATE SCHEMA IF NOT EXISTS foodfox ;


USE foodfox ;

CREATE TABLE IF NOT EXISTS foodfox.restaurant (
  rest_id INT UNSIGNED NOT NULL,
  rest_name VARCHAR(45) NOT NULL,
  address VARCHAR(45) NOT NULL,
  PRIMARY KEY (rest_id),
  UNIQUE INDEX rest_id_UNIQUE (rest_id ASC));

CREATE TABLE IF NOT EXISTS foodfox.deliveryBoy (
  ID INT NOT NULL,
  phone INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (ID));



CREATE TABLE IF NOT EXISTS foodfox.orders (
  order_id INT UNSIGNED NOT NULL,
  rest_id INT UNSIGNED NOT NULL,
  order_items TEXT NOT NULL,
  bill_amount INT UNSIGNED NOT NULL,
  deliveryBoy_id INT NOT NULL,
  delivery_address VARCHAR(45) NOT NULL,
  PRIMARY KEY (order_id),
  UNIQUE INDEX order_id_UNIQUE (order_id ASC),
  CONSTRAINT fk_order_1
    FOREIGN KEY (rest_id)
    REFERENCES foodfox.restaurant (rest_id),
  CONSTRAINT fk_order_2
    FOREIGN KEY (deliveryBoy_id)
    REFERENCES foodfox.deliveryBoy(ID));


CREATE TABLE IF NOT EXISTS foodfox.customer (
  customer_id INT UNSIGNED NOT NULL,
  name VARCHAR(45) NULL,
  phone INT NOT NULL,
  address VARCHAR(45) NOT NULL,
  order_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (customer_id),
  UNIQUE INDEX customer_id_UNIQUE (customer_id ASC),
  UNIQUE INDEX order_id_UNIQUE (order_id ASC),
  UNIQUE INDEX address_UNIQUE (address ASC),
  CONSTRAINT fk_customer_1
    FOREIGN KEY (order_id)
    REFERENCES foodfox.orders (order_id));

