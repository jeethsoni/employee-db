/*
name - Jeet Soni
Description - employee database with their information 
Database - mySQL v8.0.33
*/

CREATE TABLE IF NOT EXISTS job(
    job_id INT NOT NULL,
    name varchar(50) NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    primary Key(job_id)
);

CREATE TABLE IF NOT EXISTS ethnicity(
    ethnicity_id INT NOT NULL,
    name varchar(50) NOT NULL,
    primary Key(ethnicity_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL

);

CREATE TABLE IF NOT EXISTS place(
    place_id INT NOT NULL AUTO_INCREMENT,
    city varchar(50) NOT NULL,
    country varchar(50) NOT NULL
    primary Key(place_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL

);

CREATE TABLE IF NOT EXISTS department(
    dep_id INT NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    primary Key(dep_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL

);

CREATE TABLE IF NOT EXISTS business_unit(
    business_id INT NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    primary Key(business_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL

);

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












CREATE TABLE IF NOT EXISTS employee(
    EEID INT NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    job_id

);