/*
name - Jeet Soni
Description - employee database with their information 
Database - mySQL v8.0.33
*/


-- job table
CREATE TABLE IF NOT EXISTS job(
    job_id INT NOT NULL,
    name varchar(50) NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    primary Key(job_id)
);

-- eithnicity table 
CREATE TABLE IF NOT EXISTS ethnicity(
    ethnicity_id INT NOT NULL,
    name varchar(50) NOT NULL,
    primary Key(ethnicity_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL

);

-- place table to store country and city
CREATE TABLE IF NOT EXISTS place(
    place_id INT NOT NULL AUTO_INCREMENT,
    city varchar(50) NOT NULL,
    country varchar(50) NOT NULL
    primary Key(place_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL

);

-- department table 
CREATE TABLE IF NOT EXISTS department(
    dep_id INT NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    primary Key(dep_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL

);

-- business unit table
CREATE TABLE IF NOT EXISTS business_unit(
    business_id INT NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    primary Key(business_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL

);

-- employee table keep track of their information
-- 1 job_id(job table) to N job_id(employee table)
-- 1 ethnicity_id(ethnicity table) to N ethnicity_id(employee table)
-- 1 place_id(place table) to N place_id(employee table)

CREATE TABLE IF NOT EXISTS employee(
    EEID INT NOT NULL AUTO_INCREMENT,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    job_id INT NOT NULL,
    gender varchar(25) NOT NULL,
    ethnicity_id INT NOT NULL,
    age INT NOT NULL,
    hire_date DATE NOT NULL,
    salary INT NOT NULL,
    bonus decimal NOT NULL,
    place_id INT NOT NULL,
    exit_date date,
    primary key(EEID),
    foreign key (job_id) REFERENCES job(job_id),
    foreign key (ethnicity_id) REFERENCES ethnicity(ethnicity_id),
    foreign key (place_id) REFERENCES place(place_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL

);

-- 1 EEID(employee) to 1 EEID(business_department)
-- 1 dep_id(department) to N dep_id(business_department)
-- 1 business_id(employee) to N business_id(business_department)

CREATE TABLE IF NOT EXISTS business_department(
    EEID INT NOT NULL,
    dep_id INT NOT NULL,
    business_id INT NULL,
    primary Key(EEID, dep_id, business_id),
    foreign key (EEID) REFERENCES employee(EEID),
    foreign key (dep_id) REFERENCES department(dep_id),
    foreign key (business_id) REFERENCES business_unit(business_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL

);