/* Database schema to keep the structure of entire database. */
-- Connect to the server
> psql

-- Create the database
CREATE DATABASE catalog_of_my_things

-- Connect to the database
\c catalog_of_my_things

-- Create tables:

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
);

CREATE TABLE genre (
  id SERIAL PRIMARY KEY,
  name NARCHAR(50)
  );

CREATE TABLE label (
  id SERIAL PRIMARY KEY,
  title VARCHAR(250),
  color VARCHAR(250)
);

CREATE TABLE item (
id SERIAL PRIMARY KEY,
publish_date DATE NOT NULL,
archived BOOLEAN NOT NULL,
label_id INT REFERENCES label(id),
author_id INT REFERENCES author(id),
genre_id INT REFERENCES genre(id),
);

CREATE TABLE game (
  multiplayer VARCHAR(30) NOT NULL,
  last_played_at DATE NOT NULL
  item_id INT references item(id)
);

CREATE TABLE book (
item_id INT REFERENCES item(id),
publisher VARCHAR(250) NOT NULL,
cover_state VARCHAR(250) NOT NULL
);