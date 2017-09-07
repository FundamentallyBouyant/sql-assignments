DROP SCHEMA IF EXISTS companydb;
CREATE SCHEMA IF NOT EXISTS companydb;
USE companydb;

CREATE TABLE IF NOT EXISTS companydb.employees(
	id INT UNSIGNED UNIQUE NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    address VARCHAR(200) NOT NULL,
    joining_date DATE NOT NULL,
    PRIMARY KEY(id)
    );
    
CREATE TABLE IF NOT EXISTS companydb.projects(
	proj_id INT UNSIGNED UNIQUE NOT NULL,
    proj_name VARCHAR(45) NOT NULL,
    proj_desc VARCHAR(300),
    PRIMARY KEY(proj_id)
    );
    
CREATE TABLE IF NOT EXISTS companydb.employee_project(
	employee_id INT UNSIGNED UNIQUE NOT NULL,
    proj_id INT UNSIGNED,
    designation VARCHAR(20),
    PRIMARY KEY(employee_id),
    CONSTRAINT fk_employee_project_employee_id
    FOREIGN KEY(employee_id) REFERENCES employees(id),
    CONSTRAINT fk_employee_project_proj_id
    FOREIGN KEY(proj_id) REFERENCES projects(proj_id)
    );
    
CREATE TABLE IF NOT EXISTS companydb.reports_to(
	employee_id INT UNSIGNED UNIQUE NOT NULL,
    manager_id INT UNSIGNED,
    PRIMARY KEY(employee_id),
    CONSTRAINT fk_reports_to_employee_id
    FOREIGN KEY(employee_id) REFERENCES employees(id),
    CONSTRAINT fk_reports_to_manager_id
    FOREIGN KEY(employee_id) REFERENCES employees(id)
    );
    
    
    
