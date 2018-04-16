
-- deletes the many table
DROP TABLE tickets;
-- deletes the many table
DROP TABLE films;
-- deletes the many table
DROP TABLE customers;

-- creates the customers table
CREATE TABLE customers(
-- gives the customers table an id which is a primary key
  id SERIAL4 PRIMARY KEY,
-- this table will have a 'name' key which is a string
   name VARCHAR(255),
-- this table will have a 'funds' key which is a interger
   funds INT4
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);
