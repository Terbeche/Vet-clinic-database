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


CREATE TABLE owners (
    id            INT GENERATED ALWAYS AS IDENTITY,
    full_name     VARCHAR(100),
    age           INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id            INT GENERATED ALWAYS AS IDENTITY,
    name          VARCHAR(100),
    PRIMARY KEY(id)
);