-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

-- Check if Customer (Answ: Yes, cID: 70)
SELECT 
  CustomerID,
  FirstName || ' ' || LastName AS CustomerName,
  Address
FROM
  Customers
WHERE 
  CustomerName = 'Loretta Hundey';

-- Insert customer order
INSERT INTO Orders (CustomerID,OrderDate)
VALUES (70,'2022-09-20 14:00:00');

-- What is the orderID? (1001)
SELECT OrderID
FROM Orders
WHERE
  CustomerID = 70
AND
  OrderDate = '2022-09-20 14:00:00';

-- What are the DishIDs (4,7,20)
SELECT DishID
FROM Dishes
WHERE
  Name IN ('House Salad', 'Mini Cheeseburgers', 'Tropical Blue Smoothie')
;

INSERT INTO 
  OrdersDishes (OrderID, DishID)
VALUES 
  (1001, (SELECT DishID FROM Dishes WHERE Name = 'House Salad')),
  (1001, (SELECT DishID FROM Dishes WHERE Name = 'Mini Cheeseburgers')),
  (1001, (SELECT DishID FROM Dishes WHERE Name = 'Tropical Blue Smoothie'));

SELECT
  *
FROM
  OrdersDishes
WHERE OrderID = 1001
;

SELECT
  -- od.OrderID, od.DishID,
  SUM(d.Price)
FROM 
  OrdersDishes AS od
INNER JOIN
  Dishes AS d
ON od.DishID = d.DishID
WHERE
  od.OrderID = 1001
