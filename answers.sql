
--Question 1
SELECT
  OrderID,
  CustomerName,
  TRIM(value) AS Product
FROM
  ProductDetail
  CROSS APPLY STRING_SPLIT(Products, ',');

--Question 2
     step 1:

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);


CREATE TABLE OrderItems (
  OrderID INT,
  Product VARCHAR(100),
  Quantity INT,
  PRIMARY KEY (OrderID, Product)
);
 
   step 2:
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
