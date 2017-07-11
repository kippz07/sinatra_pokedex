DROP TABLE IF EXISTS pokemon;

CREATE TABLE pokemon (
  
  id SERIAL PRIMARY KEY,
  index INTEGER NOT NULL,
  name TEXT NOT NULL,
  location TEXT,
  day TEXT NOT NULL,
  shiny BOOLEAN NOT NULL

);

INSERT INTO pokemon (index, name, location, day, shiny) VALUES (001, 'Bulbasaur', 'grass', 'today', FALSE);
INSERT INTO pokemon (index, name, location, day, shiny) VALUES (002, 'Charmander', 'fire', 'today', TRUE);
INSERT INTO pokemon (index, name, location, day, shiny) VALUES (003, 'Squirtle', 'water', 'yesterday', FALSE);