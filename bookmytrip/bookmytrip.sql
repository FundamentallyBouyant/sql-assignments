DROP SCHEMA IF EXISTS bookmytrip;
CREATE SCHEMA IF NOT EXISTS bookmytrip;
USE bookmytrip;

CREATE TABLE IF NOT EXISTS bookmytrip.hotels(
	id INT UNSIGNED UNIQUE NOT NULL,
    hotel_name VARCHAR(45) NOT NULL,
    address VARCHAR(200) NOT NULL,
    rating INT UNSIGNED,
    amenities VARCHAR(200),
    PRIMARY KEY(id)
    );

CREATE TABLE IF NOT EXISTS bookmytrip.customers(
	customer_id INT UNSIGNED UNIQUE NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    booked_hotel_id INT UNSIGNED NOT NULL,
    is_loyal BOOLEAN,
    check_in DATETIME,
    check_out DATETIME,
    PRIMARY KEY(customer_id),
    CONSTRAINT fk_customers_hotel_id
    FOREIGN KEY(booked_hotel_id) REFERENCES hotels(id)
    );