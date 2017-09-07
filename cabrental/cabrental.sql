
CREATE SCHEMA IF NOT EXISTS cabrental;
USE cabrental;

CREATE TABLE IF NOT EXISTS cabrental.Driver(
  Driver_id INT(3) NOT NULL,
  first_name VARCHAR(45) NULL,
  last_name VARCHAR(45) NULL,
  PRIMARY KEY (Driver_id));


CREATE TABLE IF NOT EXISTS cabrental.Cabs (
  Cab_id INT(3) NOT NULL,
  Driven_by_DID INT(3) NOT NULL,
  Registration_num INT(4) NULL,
  Company VARCHAR(45) NULL,
  Model VARCHAR(45) NULL,
  PRIMARY KEY (Cab_id),
  INDEX fk_Cabs_1_idx (Driven_by_DID ASC),
  UNIQUE INDEX Registration_num_UNIQUE (Registration_num ASC),
  CONSTRAINT fk_Cabs_1
    FOREIGN KEY (Driven_by_DID)
    REFERENCES cabrental.Driver (Driver_id));


CREATE TABLE IF NOT EXISTS cabrental.Customer (
  Customer_id INT(6) ZEROFILL NOT NULL,
  Riding_in_CID INT(3) NULL,
  first_name VARCHAR(45) NULL,
  last_name VARCHAR(45) NULL,
  PRIMARY KEY (Customer_id));


CREATE TABLE IF NOT EXISTS cabrental.Ride (
  Ride_id INT(8) NOT NULL AUTO_INCREMENT,
  Cab_id INT(3) NULL,
  Customer_id INT(6) NULL,
  Timestamp DATETIME NULL,
  PRIMARY KEY (Ride_id));
