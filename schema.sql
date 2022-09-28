-- day 1
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(20),
    date_of_birth date,
    escape_attempts INT,
    neutered bool,
    weight_kg DECIMAL
);

-- day 2
 ALTER TABLE animals
 ADD species CHAR(50);

--  day 3

-- create table named owners
CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(255),
age INT,
PRIMARY KEY(id));

-- create table named species
 CREATE TABLE species(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(25),
PRIMARY KEY(id));