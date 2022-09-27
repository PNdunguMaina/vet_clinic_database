-- day 1
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(20),
    date_of_birth date,
    escape_attempts INT,
    neutered bool,
    weight_kg DECIMAL
);
