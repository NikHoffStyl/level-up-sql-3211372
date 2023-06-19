-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

DELETE FROM
  Reservations
WHERE
  ReservationID = (SELECT 
  r.ReservationID
FROM 
  Customers AS c
INNER JOIN
  Reservations AS r
ON
  c.CustomerID = r.CustomerID
WHERE
  c.FirstName = 'Norby'
AND
  -- DATE(r.Date) LIKE '2022-07%');
  DATE(r.Date) > '2022-07-24';

-- This is to check info again
SELECT 
  r.ReservationID,
  r.Date
FROM 
  Customers AS c
INNER JOIN
  Reservations AS r
ON
  c.CustomerID = r.CustomerID
WHERE
  c.FirstName = 'Norby'
AND
  DATE(r.Date) < '2022-07-24';