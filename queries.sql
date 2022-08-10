/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name like '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name,escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- How many animals are there?
SELECT  COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT  COUNT(*) AS "Animals who never escaped" FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT  AVG(weight_kg) AS "Average weight" FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT  neutered,SUM(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT  species,MIN(weight_kg) AS minimum weight, MAX(weight_kg) AS maximum weight FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT  species,ROUND(AVG(escape_attempts)) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;




-- What animals belong to Melody Pond?
SELECT name,full_name FROM animals JOIN owners ON owners.id = owner_id and owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon)
SELECT animals.name as Pokemons FROM animals JOIN species ON species.id = species_id and species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name as Owners,animals.name as Animals FROM owners FULL OUTER JOIN animals ON owners.id = owner_id;

-- How many animals are there per species?
SELECT species.name AS species,count(species_id)
  FROM species 
  JOIN animals ON species.id = species_id
  GROUP BY species;

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name as Owners,animals.name as Animals 
  FROM owners
  INNER JOIN  species ON  owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon'
  INNER JOIN  animals ON owners.id = owner_id AND species.id = species_id;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.full_name as Owners,animals.name as Animals 
  FROM owners
  JOIN  animals ON   Owners.id = owner_id 
                AND owners.full_name = 'Dean Winchester' 
                AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name AS Owners,count(*)
  FROM owners
  JOIN  animals ON  owners.id = owner_id
  GROUP BY Owners ORDER BY count DESC LIMIT 1;
