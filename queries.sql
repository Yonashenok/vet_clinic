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