-- Basic query
-- Fue utilizada la DB de pruebas #Northwind
USE Northwind

/*
Utiliza la tabla #Customer,
Filtra solo las #Country que sean USA or MEXICO
y muestra los distintos campo del SELECT
y los ordena por el country
*/
SELECT CustomerID, CompanyName, ContactTitle, [Address], Country 
FROM Customers
WHERE Country IN ('usa', 'mexico')
ORDER BY Country		
GO

/*
Utiliza la tabla # Customers
Los agrupa por Country
HAVING lo filtra al mostrar solo los grupo mayores a 10
los ordena por Country
muestra 2 columnas, Country y cuantas veces se repite
*/
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

/*
Utilizando las Tablas #Customer, #Orders, #Products y #Order Details
Se relacionan con INNER JOIN, solo los valores que tiene relacion, Implica no NUllS

*/
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

/*
Utilizando las tablas #Customers y #Orders
LEFT OUTER JOIN, se mostraran solo los valores de #Customers que no tengan
coneccion con la #Orders
*/
SELECT C.CustomerID, C.CompanyName, C.ContactName, C.Country,
 O.OrderID, O.OrderDate
 FROM Customers AS C LEFT OUTER JOIN Orders AS O
 ON C.CustomerID = O.CustomerID
 WHERE O.OrderID IS NULL
 GO


 -- # Self Join 
USE Northwind
GO

/*
Se crea una relacion con las misma Tabla, solo las que tenga una relacion
*/
SELECT J.FirstName +' '+J.LastName AS JEFE, 
S.FirstName +' '+S.LastName AS SUBALTERNO
FROM Employees AS J INNER JOIN Employees AS S
ON J.EmployeeID = S.ReportsTo
ORDER BY J.FirstName
GO

/*
Muestra todos los balores de la primera Tabla,
los que tiene relacion como los que no
*/
SELECT J.FirstName +' '+J.LastName AS JEFE, 
S.FirstName +' '+S.LastName AS SUBALTERNO
FROM Employees AS J LEFT OUTER JOIN Employees AS S
ON J.EmployeeID = S.ReportsTo
GO