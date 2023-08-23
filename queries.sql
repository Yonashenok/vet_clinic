/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%'
SELECT name FROM animals WHERE data_of_birth > '2016-01-01' AND data_of_birth < '2019-01-01'
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3
SELECT data_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu'
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5
SELECT * FROM animals WHERE neutered = TRUE
SELECT * FROM animals WHERE name != 'Gabumon'
SELECT name FROM animals WHERE weight_kg >= 10.4  AND weight_kg <= 17.3 

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals
    SET species = 'digimon'
    WHERE name LIKE '%mon%';
UPDATE animals
    SET species = 'pokemon'
   WHERE  species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE data_of_birth > '2022-01-01';
SAVEPOINT data_birth;
UPDATE animals SET weight_kg = weight_kg * -1; 
ROLLBACK To SAVEPOINT data_birth;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 
COMMIT;
SELECT * FROM animals;

SELECT count(*) FROM animals

SELECT count(*) FROM animals WHERE escape_attempts = 0

SELECT avg(weight_kg) FROM animals 

SELECT neutered, avg(escape_attempts) FROM animals 
    GROUP BY neutered 
    ORDER BY avg DESC LIMIT 1;

SELECT min(weight_kg), max(weight_kg) FROM animals 

SELECT species, avg(escape_attempts) FROM animals 
    WHERE data_of_birth >= '1990-01-01' AND data_of_birth <= '2000-12-31' 
    GROUP by species


SELECT name FROM animals JOIN owners ON owners.id = animals.owner_id 
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals JOIN species ON species.id = animals.species_id 
WHERE species.name = 'Pokemon';

SELECT full_name , name  FROM animals RIGHT JOIN owners ON owners.id = animals.owner_id;

SELECT species.name, count(species_id)  FROM animals 
JOIN species ON species.id = animals.species_id 
GROUP BY species.name;

SELECT animals.name FROM animals 
JOIN species ON species.id = animals.species_id 
JOIN owners ON owners.id = animals.owner_id 
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name FROM animals  
JOIN owners ON owners.id = animals.owner_id 
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;

SELECT owners.full_name,count(owner_id) FROM animals  
JOIN owners ON owners.id = animals.owner_id 
GROUP BY owners.full_name ORDER BY count DESC LIMIT 1; 


--------------------------------DAY 4
SELECT animals.name, max(date_of_visit) FROM animals 
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name = 'William Tatcher'
GROUP BY animals.name 
ORDER BY max DESC LIMIT 1;

SELECT animals.name, vets.name, date_of_visit FROM animals 
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM  species 
JOIN specializations ON specializations.species_id = species.id
RIGHT JOIN vets ON vets.id = specializations.vet_id;


SELECT animals.name , vets.name, date_of_visit FROM animals 
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name = 'Stephanie Mendez' 
AND date_of_visit >='2020-04-01' 
AND date_of_visit <= '2020-08-30';

SELECT animals.name , count(animal_id) FROM animals 
JOIN visits ON visits.animal_id = animals.id
GROUP BY animals.name 
ORDER BY count DESC LIMIT 1;

SELECT animals.name , min(date_of_visit) FROM animals 
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name = 'Maisy Smith'
GROUP BY animals.name 
ORDER BY min ASC LIMIT 1;

SELECT animals.*,species.name AS species_name ,vets.*, visits.* FROM animals 
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
JOIN species ON species.id = animals.species_id
ORDER BY date_of_visit DESC LIMIT 1;

SELECT vets.name, count(date_of_visit) FROM  species 
JOIN specializations ON specializations.species_id = species.id
RIGHT JOIN vets ON vets.id = specializations.vet_id
JOIN visits ON visits.vet_id = vets.id
WHERE species.name ISNULL
GROUP BY vets.name;

SELECT species.name, count(species.name) AS Number_of_visit FROM animals 
JOIN species ON species.id = animals.species_id
JOIN visits ON visits.animal_id = animals.id
RIGHT JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith' 
GROUP BY species.name
ORDER BY  Number_of_visit DESC LIMIT 1;
