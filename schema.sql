/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name varchar(80),
    data_of_birth   date,
    escape_attempts  int,
    neutered  bool,
    weight_kg  decimal,
);

ALTER TABLE animals
ADD species varchar(255);

ALTER TABLE animals
DROP COLUMN species; 

ALTER TABLE animals 
ADD species_id INTEGER REFERENCES species(id);

ALTER TABLE animals 
ADD owner_id INTEGER REFERENCES owners(id);

CREATE TABLE owners (
    id  SERIAL PRIMARY KEY,
    full_name varchar(100),
    age int,
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(100)   
);

