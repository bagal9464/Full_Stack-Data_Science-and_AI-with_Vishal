
CREATE TABLE Installments (
    Sno NUMERIC(5) NOT NULL,
    Instamt INT,
    Instno INT NOT NULL,
    paydate DATE,
    CONSTRAINT installment_pk PRIMARY KEY (Sno, Instno),
    CONSTRAINT fk_installments_students FOREIGN KEY (Sno) 
	REFERENCES students(Sno)
);

INSERT INTO Installments(Sno, Instamt,  Instno, paydate)
VALUES(10, 19550, 2, '2025-03-13');


select * from Installments;


Sno	Instamt	Instno	paydate
1	12000	2	2024-07-15
2	15500	1	2024-09-12
3	20000	2	2025-01-12
4	5500	1	2025-02-17
5	9500	1	2024-03-17
6	19500	3	2024-07-19
7	17550	3	2025-03-13
8	17550	3	2025-03-13
9	17550	3	2025-03-13
10	19550	2	2025-03-13


-- Show column definitions with types 
-- and default values for subjects and check for
-- rest three tables in same form.

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'subjects';
 

-- Find students whose status is active 
 -- (Statuss = 'S')
SELECT * FROM Students WHERE Statuss = 'C';

-- Find only Male students 
SELECT * FROM Students WHERE Gender='M';

-- Get subjects taught by each faculty
-- DISTINCT will remove duplicates
SELECT DISTINCT Faculty, Subcode FROM Studmarks;

-- Find difference between columns
-- Using As duration_difference is temporary column
 SELECT subcode, (part_duration - full_duration) 
 AS duration_difference
FROM subjects;

--	This will display 5 rows with those specific columns.
SELECT TOP 5 subcode, subdesc, versions, 
part_duration, full_duration
FROM subjects;

-- Use aliases with As
Select * from students;
SELECT Sname AS [Student Name], 
Course AS [COCSIT Course Name] FROM Students;

SELECT Sname AS [Student Name], 
Course AS [Course Name] FROM Students;

-- Find total and pending fees using arithmetic
SELECT Sname, Total_fees, Fees_paid, (Total_fees - Fees_paid)
AS [Pending Amount]
FROM Students;

-- List all students with unpaid fees.
-- using where clause
SELECT Sno, Sname, Total_fees, Fees_paid
FROM Students
WHERE Fees_paid < Total_fees;

-- List all students with unpaid fees.
-- using where clause
SELECT Sno, Sname, Total_fees, Fees_paid
FROM Students
WHERE Fees_paid = 30000;
