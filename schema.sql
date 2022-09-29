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

-- modify animals table
ALTER TABLE animals
DROP COLUMN species; -- remove species column

ALTER TABLE animals
ADD species_id INT
REFERENCES species(id); -- add species_id as f_key

ALTER TABLE animals
ADD owner_id INT
REFERENCES owners(id);  -- add owner_id as f_key

-- day 4
CREATE TABLE vets(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(50),
age INT,
date_of_graduation DATE,
PRIMARY KEY (id)); -- create table 'vets'

CREATE TABLE specializations(
species_id INT,
vets_id INT,
PRIMARY KEY(species_id,vets_id),
FOREIGN KEY (species_id) REFERENCES species (id),
FOREIGN KEY (vetss_id) REFERENCES vets (id)
); -- create 'join table' specializations between species & vets

CREATE TABLE visits(
animal_id INT,
vets_id INT,
date_of_visit DATE,
PRIMARY KEY(animal_id,vets_id,date_of_visit),
FOREIGN KEY (animal_id) REFERENCES animals(id),
FOREIGN KEY (vets_id) REFERENCES vets(id)
); -- create 'join table' visits between animals & vets
