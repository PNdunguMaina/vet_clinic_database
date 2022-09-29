-- day 1
SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered IS true AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name,escape_attempts FROM animals WHERE weight_kg >10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE name !='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;

-- day 2
-- Rename column inside a transaction
BEGIN TRANSACTION;
ALTER TABLE animals
RENAME COLUMN species
TO unspecified;
SELECT * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;

-- Write species name with a condition inside a  transaction
BEGIN WORK;
UPDATE animals SET species='Digimon' WHERE name Like'%mon%';
UPDATE animals SET species='Pokemon' WHERE species IS NULL;
COMMIT WORK;
SELECT * FROM animals;

-- delete data and revert
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- creating savepoints
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg=weight_kg*-1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg=weight_kg*-1 WHERE weight_kg<0;
COMMIT TRANSACTION;
SELECT * FROM animals;

-- complex queries that answer analytical questions
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM  animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT name,date_of_birth, AVG(escape_attempts) FROM animals GROUP BY name, date_of_birth HAVING date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';

--  day 3
SELECT name FROM  animals JOIN owners ON animals.owner_id = owners.id WHERE owners.id=4;
SELECT animals.name FROM  animals JOIN species ON animals.species_id = species.id WHERE species.id=1;
SELECT full_name,name FROM  owners LEFT JOIN animals ON owner_id = owners.id;
SELECT species.name, COUNT(*) FROM animals, species WHERE species_id = species.id GROUP BY species.name;
SELECT name, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Jennifer Orwell' and species_id = 2;
SELECT full_name, name FROM animals LEFT JOIN owners ON owner_id = owners.id WHERE owners.id=5 and escape_attempts=0;
SELECT full_name , COUNT(animals.name) AS total_animals FROM owners JOIN animals ON owner_id=owners.id GROUP BY owners.id ORDER BY total_animals DESC LIMIT 1;

-- day 4
SELECT a.id, a.name, vt.date_of_visit FROM animals a
JOIN visits vt ON vt.animal_id = a.id
JOIN vets v ON v.id = vt.vets_id WHERE v.name = 'William Tatcher'
ORDER BY vt.date_of_visit
DESC LIMIT 1; -- last animal seen by William Tatcher

SELECT COUNT(*) AS total_animals FROM animals a
JOIN visits vt ON a.id = vt.animal_id
JOIN vets v on v.id = vt.vets_id WHERE v.id = 3; -- list all different animals seen by Stephanie Mendez

SELECT v.id, v.name AS Vet_name,sp.name AS Specialty FROM vets v
LEFT JOIN specializations s ON s.vets_id = v.id
LEFT JOIN species sp ON sp.id=s.species_id
ORDER BY v.id; --list all vets with their specialties, including those without

SELECT a.name AS Animal, vt.date_of_visit FROM animals a
INNER JOIN visits vt ON vt.animal_id = a.id
INNER JOIN vets v ON v.id = vt.vets_id
WHERE v.name = 'Stephanie Mendez' AND vt.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'; --all animals that visited Stephanie Mendez in a given period

SELECT a.name as Animal, COUNT(*) AS Total_visits FROM animals a
JOIN visits vt ON a.id = vt.animal_id
GROUP BY a.id
ORDER BY total_visits DESC LIMIT 1; --display animal with most visit by vets

SELECT a.name AS First_Visit, s.name as Species, a.date_of_birth, vt.date_of_visit FROM animals a
JOIN species s ON a.species_id = s.id
JOIN visits vt ON a.id = vt.animal_id
JOIN vets v ON v.id = vt.vets_id WHERE v.name = 'Maisy Smith'
ORDER BY vt.date_of_visit ASC LIMIT 1; --display first animal visited by Maisy Smith

SELECT a.name AS Animal, a.date_of_birth, a.weight_kg, v.name AS Vet_Name, v.age AS vet_age,v.date_of_graduation, vt.date_of_visit FROM animals a
JOIN visits vt ON a.id = vt.animal_id
JOIN vets v ON vt.vets_id = v.id
ORDER BY vt.date_of_visit DESC LIMIT 1;  --display details on last visit

SELECT COUNT(unspecialized_visit.name) AS unspecialized_visit FROM vets v
JOIN visits vt ON vt.vets_id = v.id
JOIN animals ON vt.animal_id = animals.id
JOIN species sp ON sp.id = animals.species_id
JOIN specializations s ON s.vets_id = v.id
JOIN species AS unspecialized_visit ON unspecialized_visit.id = s.vets_id
WHERE sp.id != unspecialized_visit.id; --display number of unspecialized visits

SELECT sp.name AS species FROM vets v
JOIN visits vt ON v.id = vt.vets_id
JOIN animals a ON vt.animal_id = a.id
JOIN species sp ON sp.id = a.species_id
WHERE v.name = 'Maisy Smith' GROUP BY species LIMIT 1; --specialty Maisy Smith should consider getting
