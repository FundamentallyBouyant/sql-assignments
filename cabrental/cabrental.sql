DROP SCHEMA IF EXISTS cabrental;
CREATE SCHEMA IF NOT EXISTS cabrental;
USE cabrental;

CREATE TABLE IF NOT EXISTS cabrental.cabs(
	cab_id INT UNSIGNED UNIQUE NOT NULL,
    vehicle_no VARCHAR(45) NOT NULL,
    car_model VARCHAR(45) NOT NULL,
    PRIMARY KEY(cab_id)
    );
    
    
CREATE TABLE IF NOT EXISTS cabrental.drivers(
	driver_id INT UNSIGNED UNIQUE NOT NULL,
    driver_name VARCHAR(45) NOT NULL,
    PRIMARY KEY(driver_id),
    CONSTRAINT fk_drivers_driver_id
    FOREIGN KEY(driver_id) REFERENCES cabs(cab_id)
    );

CREATE TABLE IF NOT EXISTS cabrental.customers(
	customer_id INT UNSIGNED UNIQUE NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    cab_id INT UNSIGNED,
    PRIMARY KEY(customer_id),
    CONSTRAINT fk_customer_cab_id
    FOREIGN KEY(cab_id) REFERENCES cabs(cab_id)
    );
