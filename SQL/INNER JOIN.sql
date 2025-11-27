-- SQL Server INNER JOIN 
-- ProductCategory table with four records:

CREATE TABLE ProductCategory (
    CategoryID INT NOT NULL PRIMARY KEY,
    CategoryName VARCHAR(50)
);

INSERT INTO ProductCategory VALUES
(1, 'Bikes'),
(2, 'Components'),
(3, 'Clothing'),
(4, 'Accessories')

-- Creating a Geography table with three rows.

CREATE TABLE Geography (
    GeographyID INT PRIMARY KEY,
    Country VARCHAR(50)
);

INSERT INTO Geography VALUES
(1, 'USA'),
(2, 'INDIA'),
(3, NULL);


CREATE TABLE Fact (
    ID INT PRIMARY KEY,
    CategoryID INT,
    GeographyID INT,
    Orders INT NULL,
    Sale DECIMAL(10, 2),
    OrderDate DATE
    FOREIGN KEY (CategoryID) 
	REFERENCES ProductCategory(CategoryID),
    FOREIGN KEY (GeographyID) 
	REFERENCES Geography(GeographyID)
);

INSERT INTO Fact VALUES
(301, 1, 1, 15, 7500.00, '2025-09-28'),  
(302, 2, 2, 45, 500.00, '2025-04-01'),    
(303, 3, NULL, 75, 100.00, '2024-08-15'),  
(304, NULL, 1, 10, 4000.00, '2023-07-11'),
(305, 4, 1, 9, 1500.00, '2024-12-31'),
(306,1, 2, 22,1200.00, '2025-09-30'),
(307, 2, 1, 30, 8000.00, '2025-05-01'),
(308, 4, 3, 25, 9000.00, '2025-01-13');


SELECT * FROM ProductCategory
INNER JOIN Fact 
ON ProductCategory.CategoryID = Fact.CategoryID

-- Dropping inner keyword
SELECT * FROM ProductCategory
JOIN Fact 
ON ProductCategory.CategoryID = Fact.CategoryID

select * from fact;

-- SQL INNER JOIN Select a Few Columns
SELECT CategoryName, Orders, Sale, 
OrderDate FROM ProductCategory
INNER JOIN Fact ON
ProductCategory.CategoryID = Fact.CategoryID


