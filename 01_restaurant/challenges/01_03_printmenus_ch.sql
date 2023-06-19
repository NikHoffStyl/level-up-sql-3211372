-- Create reports that will be used to make three menus.

-- Create a report with all the items sorted by price (lowest to highest).
SELECT
  Name, 
  Type, 
  Price
FROM
  Dishes
ORDER BY
  Price;

-- Create a report showing appetizers and beverages.
SELECT
  Name, Type, Price
FROM
  Dishes
WHERE
  Type IN ('Appetizer', 'Beverage')
ORDER BY
  Price;

-- Create a report with all items except beverages.
SELECT
  Name, Type, Price
FROM
  Dishes
WHERE
  Type <> 'Beverage'
ORDER BY
  Price;
