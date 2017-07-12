DROP TABLE IF EXISTS pokemon;

CREATE TABLE pokemon (
  
  id SERIAL PRIMARY KEY,
  index INTEGER NOT NULL,
  name TEXT NOT NULL,
  location TEXT,
  day DATE NOT NULL,
  shiny BOOLEAN NOT NULL

);

INSERT INTO pokemon (index, name, location, day, shiny) VALUES (001, 'Bulbasaur', 'grass', '2017-02-15', false);
INSERT INTO pokemon (index, name, location, day, shiny) VALUES (002, 'Charmander', 'fire', '2016-12-25', false);
INSERT INTO pokemon (index, name, location, day, shiny) VALUES (003, 'Squirtle', 'water', '2017-04-17', false);