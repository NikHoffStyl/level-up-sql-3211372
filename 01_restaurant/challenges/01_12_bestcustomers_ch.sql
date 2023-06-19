-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

SELECT
  o.CustomerID,
  c.FirstName || ' ' || c.LastName AS [Customer Name],
  Count(o.OrderID) AS [Order Count]
  -- SUM(d.Price) AS [Total Payment]
FROM Orders AS o
-- INNER JOIN OrdersDishes AS od
-- ON o.OrderID = od.OrderID
-- INNER JOIN Dishes AS d
-- ON od.DishID = d.DishID
INNER JOIN Customers AS c
ON c.CustomerID = o.CustomerID
GROUP BY o.CustomerID
ORDER BY [Order Count] DESC
LIMIT 10

