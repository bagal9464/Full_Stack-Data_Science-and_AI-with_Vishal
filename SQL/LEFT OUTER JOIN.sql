-- LEFT OUTER JOIN
-- CREATE THE BELOW TABLES AND INSERT THE 
-- VALUES IN IT.

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    ListPrice DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName,
 Category, ListPrice) VALUES
(1, 'Laptop', 'Electronics', 2000.00),
(2, 'Phone', 'Electronics', 800.00),
(3, 'Pants', 'Clothing', 150.00),
(4, 'Football', 'Sports', 20.00);  

-- CREATE TABLE CUSTOMER
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers (CustomerID, Name, Country,
State, City) VALUES
(1, 'John', 'USA', 'CA', 'San Francisco'),
(2, 'Ram', 'INDIA', 'UP', 'Lucknow');

CREATE TABLE InternetSales (
    ProductID INT,
    CustomerID INT,
    OrderDate DATE,
    Quantity INT,
    Sales DECIMAL(10, 2),
    FOREIGN KEY (ProductID) 
	REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) 
	REFERENCES Customers(CustomerID)
);

INSERT INTO InternetSales (ProductID, CustomerID, OrderDate, Quantity, Sales) VALUES
(1, 1, '2025-01-01', 2, 4400.00), 
(2, 1, '2025-02-14', 1, 900.00),   
(3, 2, '2025-07-05', 4, 800.00),  
(1, 2, '2025-04-20', 1, 2100.00),  
(3, 2, '2025-05-20', 2, 350.00),  
(2, 2, '2025-02-14', 3, 2550.00);  


-- SQL LEFT JOIN Example
SELECT * FROM PRODUCTS p 
LEFT JOIN InternetSales s
ON p.ProductID = s.ProductID

SELECT * FROM PRODUCTS p 
LEFT OUTER JOIN InternetSales s
ON p.ProductID = s.ProductID

-- Choose Few Columns
SELECT ProductName, Category, ListPrice,
OrderDate, Quantity, Sales
FROM Products 
LEFT JOIN InternetSales
ON Products.ProductID = InternetSales.ProductID

SELECT ProductName, Category, ListPrice,
OrderDate, Quantity, Sales
FROM Products P
LEFT JOIN InternetSales S
ON P.ProductID = S.ProductID

-- Importance of table ALIAS Names in SQL LEFT JOIN
-- THE BELOW QUERY WILL PRODUCEE ERROR
-- As you can see from the message, the LEFT JOIN 
-- throws an error: Ambiguous column name ‘ProductID’. 
-- It is because the ProductID is present in both tables.


SELECT ProductID, ProductName, Category, 
ListPrice, OrderDate, Quantity, Sales
FROM Products 
LEFT JOIN InternetSales
ON Products.ProductID = InternetSales.ProductID


-- Let’s rewrite the above query with ALIAS table names. 
-- If you see the query below, we mention explicitly that 
-- we are looking for the ProductID that belongs to the Products table.

SELECT p.ProductID, p.ProductName, 
p.Category, s.OrderDate, s.Quantity, s.Sales
FROM Products p 
LEFT JOIN InternetSales s
ON p.ProductID = s.ProductID 


-- Show all marks where a student took a subject 
-- and both the student and subject exist.

SELECT s.Sname, sm.Subcode, sub.subdesc, sm.Marks
FROM Students s
INNER JOIN Studmarks sm 
ON s.Sno = sm.Sno
INNER JOIN Subjects sub 
ON sm.Subcode = sub.subcode;

-- LEFT OUTER JOIN 
SELECT s.Sname, sm.Subcode, sm.Marks
FROM Students s
LEFT OUTER JOIN Studmarks sm 
ON s.Sno = sm.Sno;

SELECT s.Sname, sm.Subcode, sub.subdesc, sm.Marks
FROM Students s
JOIN Studmarks sm 
ON s.Sno = sm.Sno
JOIN Subjects sub 
ON sm.Subcode = sub.subcode; 

-- DISTINCT + JOIN Examples
-- List distinct faculties who taught subjects 
-- to active students
SELECT DISTINCT SM.Faculty
FROM Studmarks SM
JOIN Students S ON S.Sno = SM.Sno



