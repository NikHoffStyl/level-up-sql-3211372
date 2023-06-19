-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)

-- Check if Sam exists as a Customer
SELECT *
FROM Customers
WHERE Email = 'smac@kinetecoinc.com'
  -- FirstName = 'Sam'
-- AND
  -- LastName = 'McAdams'

-- Sam is not yet a Customer
INSERT INTO Customers (FirstName, LastName, Email)
VALUES ('Sam', 'McAdams', 'smac@kinetecoinc.com')

-- Check if Sam exists as a Customer (and customerID)
SELECT CustomerID
FROM Customers
WHERE 
  Email = 'smac@kinetecoinc.com'
AND
  FirstName = 'Sam'
AND
  LastName = 'McAdams'



-- Create reservation August 12, 2022 at 6PM (18:00)
INSERT INTO Reservations (CustomerID, Date, PartySize)
VALUES (102,'2022-08-12 18:00:00',5);

-- Check Reservations and Customer Tables
SELECT 
  * 
FROM 
  Reservations AS r
INNER JOIN
  Customers AS c
ON 
  c.CustomerID = r.CustomerID
ORDER BY
  ReservationID DESC;
