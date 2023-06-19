-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

-- check original value 
SELECT FavoriteDish FROM Customers WHERE FirstName = 'Cleo';

UPDATE Customers
SET FavoriteDish = (SELECT DishID FROM Dishes WHERE Name = 'Quinoa Salmon Salad')
WHERE 
  FirstName = 'Cleo'
AND 
  LastName = 'Goldwater';


-- check value now 
SELECT FavoriteDish FROM Customers WHERE FirstName = 'Cleo';