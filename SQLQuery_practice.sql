-- Basic query
USE Northwind

SELECT CustomerID, CompanyName, ContactTitle, [Address], Country 
FROM Customers
WHERE Country IN ('usa', 'mexico')
ORDER BY Country		
GO


SELECT country, COUNT(*) AS [Counted]
FROM Customers
GROUP BY Country
HAVING COUNT(*) > 10
ORDER BY Country
GO

SELECT Productname, unitprice FROM Products
WHERE unitprice BETWEEN 15 AND 20
ORDER BY ProductName
GO

SELECT city, COUNT(CompanyName) AS # 
FROM Customers
WHERE city LIKE 'A%'
GROUP BY City
GO

SELECT CustomerId, OrderId, OrderDate, 
YEAR(orderdate) AS Anio, 
MONTH(orderDate) AS Mes
FROM orders
GO


-- Consulta de mas de dos tablas
SELECT C.CustomerID, C.CompanyName, C.ContactName, C.Country, 
O.OrderID, O.OrderDate, 
P.ProductName,
D.UnitPrice, D.Quantity
FROM Customers AS C INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN [Order Details] AS D
ON O.OrderID = D.OrderID
INNER JOIN Products AS P
ON D.ProductID = P.ProductID
GO


SELECT C.CustomerID, C.CompanyName, C.ContactName, C.Country,
 O.OrderID, O.OrderDate
 FROM Customers AS C LEFT OUTER JOIN Orders AS O
 ON C.CustomerID = O.CustomerID
 WHERE O.OrderID IS NULL
 GO


 -- # Self Join 
USE Northwind
GO


SELECT J.FirstName +' '+J.LastName AS JEFE, 
S.FirstName +' '+S.LastName AS SUBALTERNO
FROM Employees AS J INNER JOIN Employees AS S
ON J.EmployeeID = S.ReportsTo
ORDER BY J.FirstName
GO

SELECT J.FirstName +' '+J.LastName AS JEFE, 
S.FirstName +' '+S.LastName AS SUBALTERNO
FROM Employees AS J LEFT OUTER JOIN Employees AS S
ON J.EmployeeID = S.ReportsTo
GO