/* Database schema to keep the structure of entire database. */
-- Connect to the server
> psql

-- Create the database
CREATE DATABASE vet_clinic

-- Connect to the database
\c vet_clinic

-- Create tables:
CREATE TABLE author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name TEXT,
    last_name TEXT,
   PRIMARY KEY(id)
);

CREATE TABLE game (
  id INT PRIMARY KEY REFERENCES item(id),
  multiplayer VARCHAR(30) NOT NULL,
  last_played_at DATE NOT NULL
);