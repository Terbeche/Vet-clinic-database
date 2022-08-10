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



-- Who was the last animal seen by William Tatcher?
SELECT animals.name 
  FROM animals
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON vets_id = vets.id WHERE vets.name = 'William Tatcher'
  ORDER BY date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animals.name)
  FROM animals
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON vets_id = vets.id WHERE vets.name = 'Stephanie Mendez';


-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name AS vet,species.name AS specialization
  FROM vets
  JOIN  specializations ON  vets.id = vets_id 
  JOIN species ON species_id = species.id;


-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name
  FROM animals
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' 
  AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';



-- What animal has the most visits to vets?
SELECT animals.name, count(*)
  FROM animals
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON vets_id = vets.id 
  GROUP BY animals.name ORDER BY count DESC LIMIT 1;


-- Who was Maisy Smith's first visit?
SELECT animals.name,date_of_visit
  FROM animals
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON vets_id = vets.id WHERE vets.name = 'Maisy Smith' 
  ORDER BY date_of_visit LIMIT 1;


-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name,date_of_birth,escape_attempts,neutered,weight_kg,species.name as specie,
      vets.name as vet_name,vets.age as vet_age,date_of_graduation ,date_of_visit
  FROM species 
  JOIN animals ON animals.species_id = species.id
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON visits.vets_id = vets.id
  ORDER BY date_of_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
  SELECT vets.name,count(*) 
    FROM visits
    JOIN  vets ON vets.id = visits.vets_id  
    LEFT JOIN specializations ON vets.id = specializations.vets_id WHERE specializations.vets_id IS NULL
    GROUP BY vets.name;
    
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
  SELECT species.name AS specialization,count(*) AS number_of_visits
    FROM species
    JOIN  animals ON species.id = animals.species_id
    JOIN visits ON animals.id  = visits.animals_id
    JOIN vets ON visits.vets_id = vets.id  WHERE vets.name = 'Maisy Smith'
    GROUP BY species.name ORDER BY number_of_visits DESC LIMIT 1;