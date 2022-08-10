/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id            INT GENERATED ALWAYS AS IDENTITY,
    name          VARCHAR(100),
    date_of_birth      DATE,
    escape_attempts    INT,
    neutered      BOOLEAN,
    weight_kg     NUMERIC(5,2),
    PRIMARY KEY(id)
);


ALTER TABLE animals
  ADD species VARCHAR(500);

-- Create a table named owners
CREATE TABLE owners (
    id            INT GENERATED ALWAYS AS IDENTITY,
    full_name     VARCHAR(100),
    age           INT,
    PRIMARY KEY(id)
);

-- Create a table named species
CREATE TABLE species (
    id            INT GENERATED ALWAYS AS IDENTITY,
    name          VARCHAR(100),
    PRIMARY KEY(id)
);


-- Remove column species
ALTER TABLE animals
  DROP COLUMN species;


-- Remove column species
ALTER TABLE animals
  ADD species_id INT,
  ADD owner_id INT;

-- -- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD CONSTRAINT fk_animals_species
FOREIGN KEY (species_id)
REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD CONSTRAINT fk_animals_owners
FOREIGN KEY (owner_id)
REFERENCES owners(id);


-- Create a table named vets
CREATE TABLE vets (
    id            INT GENERATED ALWAYS AS IDENTITY,
    name          VARCHAR(100),
    age           INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

-- Create a join table named specializations
CREATE TABLE specializations (
    vets_id        INT,
    species_id     INT, 
    PRIMARY KEY(vets_id, species_id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id)
);


-- Create a join table named visits
CREATE TABLE visits (
    animals_id    INT,
    vets_id       INT,
    date_of_visit DATE, 
    PRIMARY KEY(animals_id, vets_id, date_of_visit),
    CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);