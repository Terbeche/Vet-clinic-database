/* Populate database with sample data. */

-- Insert the following data into the animals table:
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon','2020-02-03' , 10.23 ,true ,0 );
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon','2018-11-15' , 8 ,true ,2 );
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu','2021-01-07' , 15.04 ,false ,1 );
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon','2017-05-12' , 11 ,true ,5 );

-- Insert the following data into the animals table:
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander','2020-02-08' , -11 ,false ,0 );
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon','2021-11-15' , -5.7 ,true ,2 );
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle','1993-04-02' , -12.13 ,false ,3 );
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon','2005-06-12' , -45 ,true ,1 );
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon','2005-06-07' , 20.4 ,true ,7 );
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom','1998-10-13' , 17 ,true ,3 );
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Ditto','2022-05-14' , 22 ,true ,4 );


-- Update the animals table by setting the species column to unspecified then Rollback.
BEGIN;

UPDATE animals
SET species = 'unspecified';

ROLLBACK;

-- Start transaction
BEGIN;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals
SET species = 'digimon'
WHERE name like '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals
SET species = 'pokemon'
WHERE species is null;

-- Commit the transaction.
COMMIT;

-- Delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;

-- Start transaction
BEGIN;

-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction.
SAVEPOINT sp1;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = -weight_kg;

-- Rollback to the savepoint
ROLLBACK TO SAVEPOINT sp1;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = -weight_kg
WHERE weight_kg < 0;

-- Commit transaction
COMMIT;


-- Insert the following data into the owners table:
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34 );
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19 );
INSERT INTO owners (full_name, age) VALUES ('Bob', 45 );
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77 );
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14 );
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38 );

-- -- Insert the following data into the species table:
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');


-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon
UPDATE animals
SET species_id = 2
WHERE name like '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id is null;



-- Modify your inserted animals to include owner information (owner_id):
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');