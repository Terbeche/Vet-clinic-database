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


-- Insert data for vets:
INSERT INTO vets (name, age, date_of_graduation ) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation ) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation ) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation ) VALUES ('Jack Harkness', 38, '2008-06-08');


-- Insert data for specialties:
INSERT INTO specializations (vets_id, species_id ) VALUES ( 1, 1);
INSERT INTO specializations (vets_id, species_id ) VALUES ( 3, 1);
INSERT INTO specializations (vets_id, species_id ) VALUES ( 3, 2);
INSERT INTO specializations (vets_id, species_id ) VALUES ( 4, 2);


-- Insert data for visits:
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 1, 1, '2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 1, 3, '2020-07-22');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 2, 4, '2021-02-02');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 3, 2, '2020-01-05');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 3, 2, '2020-03-08');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 3, 2, '2020-05-14');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 4, 3, '2021-05-04');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 5, 4, '2021-02-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 6, 2, '2019-12-21');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 6, 1, '2020-08-10');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 6, 2, '2021-04-07');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 7, 3, '2019-09-29');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 8, 4, '2020-10-03');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 8, 4, '2020-11-04');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 9, 2, '2019-01-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 9, 2, '2019-05-15');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 9, 2, '2020-02-27');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 9, 2, '2020-08-03');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 10, 3, '2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES ( 10, 1, '2021-01-11');

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';