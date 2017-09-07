DROP SCHEMA IF EXISTS paytm;
CREATE SCHEMA IF NOT EXISTS paytm;
USE paytm;

CREATE TABLE IF NOT EXISTS paytm.customers(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    address VARCHAR(200) NOT NULL,
    PRIMARY KEY(id)
    );

CREATE TABLE IF NOT EXISTS paytm.accounts(
	acc_id INT UNSIGNED UNIQUE NOT NULL,
    opening_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    balance INT UNSIGNED NOT NULL,
    PRIMARY KEY(acc_id)
    );
    
CREATE TABLE IF NOT EXISTS paytm.branches(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(45) NOT NULL,
    address VARCHAR(200) NOT NULL,
    PRIMARY KEY(id)
    );

CREATE TABLE IF NOT EXISTS paytm.customer_accounts(
	acc_id INT UNSIGNED NOT NULL,
    customer_id INT UNSIGNED NOT NULL,
    branch_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(acc_id,customer_id),
    CONSTRAINT uk_customer_accounts
    UNIQUE KEY(customer_id,branch_id),
    CONSTRAINT fk_customer_accounts_acc_id
    FOREIGN KEY(acc_id) REFERENCES accounts(acc_id),
    CONSTRAINT fk_customer_accounts_customer_id
    FOREIGN KEY(customer_id) REFERENCES customers(id),
    CONSTRAINT fk_customer_accounts_branche_id
    FOREIGN KEY(branch_id) REFERENCES branches(id)
    );
    