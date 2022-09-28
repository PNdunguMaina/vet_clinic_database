-- day 1
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', DATE '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', DATE '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', DATE '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', DATE '2017-05-12', 5, true, 11);

-- day 2
INSERT INTO animals(name, date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Charmander',DATE '2020-02-08',0,false,11);
INSERT INTO animals(name, date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Plantmon',DATE '2021-11-15',2,true,5.7);
INSERT INTO animals(name, date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Squirtle',DATE '1993-04-02',3,false,12.13);
INSERT INTO animals(name, date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Angemon',DATE '2005-06-12',1,true,45);
INSERT INTO animals(name, date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Boarmon',DATE '2005-07-07',7,true,20.4);
INSERT INTO animals(name, date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Blossom',DATE '1998-10-13',3,true,17);
INSERT INTO animals(name, date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Ditto',DATE '2022-05-14',4,true,22);

-- day 3

-- insert data to owners table
INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES('Bob', 45);
INSERT INTO owners (full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES('Jodie Whittaker', 38);

-- insert data to species table
INSERT INTO species (name) VALUES('Pokemon'), ('Digimon');

-- modify animals table to include species_id
ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY(species_id)
REFERENCES species(id);
-- match right species id to correct name
UPDATE animals SET species_id=2 WHERE name LIKE '%mon%';
UPDATE animals SET species_id=1 WHERE species_id IS NULL;

 -- modify animals table to include owner_id
ALTER TABLE animals
ADD CONSTRAINT fk_owner
FOREIGN KEY(owner_id)
REFERENCES owners(id);
-- match right owner id to correct animal
UPDATE animals SET owner_id=1 WHERE name = 'Agumon';
UPDATE animals SET owner_id=2 WHERE name = 'Gabumon';
UPDATE animals SET owner_id=2 WHERE name = 'Pikachu';
UPDATE animals SET owner_id=3 WHERE name = 'Devimon';
UPDATE animals SET owner_id=3 WHERE name = 'Plantmon';
UPDATE animals SET owner_id=4 WHERE name = 'Charmander';
UPDATE animals SET owner_id=4 WHERE name = 'Squirtle';
UPDATE animals SET owner_id=4 WHERE name = 'Blossom';
UPDATE animals SET owner_id=5 WHERE name = 'Angemon';
UPDATE animals SET owner_id=5 WHERE name = 'Boarmon';
