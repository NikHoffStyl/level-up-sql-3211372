-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.

SELECT
  r.ReservationID,
  c.CustomerID,
  c.FirstName || ' ' || c.LastName AS [Customer Name],
  r.Date,
  r.PartySize
FROM
  Reservations AS r
INNER JOIN
  Customers AS c
ON
  c.CustomerID = r.CustomerID
WHERE
  c.LastName LIKE 'St%'
AND 
  r.PartySize = 4
-- AND
--   DATE(r.Date) LIKE '%-06-%' 
ORDER BY
  r.Date
;