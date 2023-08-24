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

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age int,
    date_of_graduation date
);

CREATE TABLE specializations (
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
)

CREATE TABLE  visits (
    id SERIAL PRIMARY KEY,
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    date_of_visit date
)
