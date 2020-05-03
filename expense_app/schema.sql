CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount numeric(6,2),
  memo text,
  created_on date DEFAULT now()
);


ALTER TABLE expenses
ALTER COLUMN amount SET NOT NULL,
ALTER COLUMN memo SET NOT NULL,
ALTER COLUMN created_on SET NOT NULL;

ALTER TABLE expenses
ADD CHECK (amount >= 0.01);

INSERT INTO expenses (amount, memo) 
VALUES (14.56, 'Pencils'),
       (3.29, 'Coffee'),
       (49.99, 'Text Editor');