use PGTrainingDS
Go

CREATE TABLE CUSTOMERS5( 
   ID   INT              NOT NULL, 
   NAME VARCHAR (20)     NOT NULL, 
   AGE  INT              NOT NULL, 
   ADDRESS  CHAR (25) , 
   SALARY   DECIMAL (18, 2),        
   PRIMARY KEY (ID));

   select * from CUSTOMERS5;

INSERT INTO CUSTOMERS5(ID, NAME, AGE, ADDRESS, SALARY) 
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );

INSERT INTO CUSTOMERS5(ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 );

INSERT INTO CUSTOMERS5(ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );  

INSERT INTO CUSTOMERS5(ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (6, 'Komal', 22, 'MP', 4500.00 );

INSERT INTO CUSTOMERS5 VALUES
(8, 'Vijay', 24, 'Indore', 10000.00 );


UPDATE TABLE
UPDATE CUSTOMERS5
SET ADDRESS = 'HyD', AGE=30, SALARY=5000 
WHERE ID = 6;   

select * from CUSTOMERS5;

DELETE FROM CUSTOMERS5 
WHERE ID = 6;

SELECT ID, NAME, SALARY  
FROM CUSTOMERS5 
WHERE SALARY = 8500;

SELECT ID, NAME, SALARY  
FROM CUSTOMERS5
WHERE NAME = 'Hardik';
-- Strings where last name starts with A, B, or C
SELECT * FROM CUSTOMERS5 
WHERE ADDRESS NOT LIKE 'M%'; 


******************************************************************************
Students Database for course completion
******************************************************************************


Create table subjects (subcode varchar(10) constraint subjects_ky primary key, 
subdesc varchar(20), 
versions varchar(3), 
full_duration numeric(3),
part_duration numeric(3)); 

exec sp_columns subjects
 
insert into subjects values ('VB', 'Visual Basic' ,'5.0', 20, 60); 

select * from subjects;
insert into subjects values ('C', 'Programming', 27, 56); 
insert into subjects values ('C', 'Programming',  '', 27, 56); 
insert into subjects values ('RDBMS', 'Oracle' ,'10g', 42, 36); 
insert into subjects values ('DS', 'Data Science', ' ', 45, 76); 
insert into subjects values ('JV', 'Java Programming',' ', 20, 60); 
insert into subjects values ('PTY', 'Python Programming','4.0', 25, 35);
insert into subjects values ('MAT', 'Matlab Programming','24', 35, 25);
insert into subjects values ('RBY', 'Ruby Programming','5', 45, 25);
insert into subjects values ('HTML', 'Web Development','4.0', 35, 25);  
insert into subjects values ('R', 'Statistical Methods', '', 15, 15);  



******************************************************************************
CREATING STUDENTS TABLE
******************************************************************************
CREATE TABLE Students (
    Sno NUMERIC(5) NOT NULL 
        CONSTRAINT student_pk PRIMARY KEY,

    Sname VARCHAR(20) NOT NULL,   

    Sadd VARCHAR(15),

    Gender VARCHAR(1) 
        CONSTRAINT stud_type CHECK (UPPER(Gender) IN ('M','F')),

    [Type] VARCHAR(1) 
        CONSTRAINT student_type CHECK (UPPER([Type]) IN ('P','F')),

    Course VARCHAR(10),

    jdate DATE,

    Total_fees NUMERIC(7) NOT NULL, 

    Fees_paid NUMERIC(5),

    Statuss VARCHAR(1) 
        CONSTRAINT status_chk CHECK (UPPER(Statuss) IN ('C','S')),

    payment_modes NUMERIC(3),

    CONSTRAINT student_fee_chk CHECK (Total_fees >= Fees_paid)
);
******************************************************************************
INSERTING ROWS INTO STUDENTS TABLE
******************************************************************************


INSERT INTO Students (Sno, Sname, Sadd, Gender, [Type], Course, jdate, Total_fees, Fees_paid, Statuss, payment_modes)
VALUES
(1, 'Ravi',   'Delhi',     'M', 'P', 'BCA',  '2024-06-15', 50000, 30000, 'C', 101),
(2, 'Sneha',  'Mumbai',    'F', 'F', 'MBA',  '2024-07-01', 75000, 75000, 'S', 102),
(3, 'Karan',  'Pune',      'M', 'P', 'BSc',  '2024-05-20', 40000, 20000, 'C', 103),
(4, 'Meena',  'Chennai',   'F', 'F', 'MCA',  '2024-06-10', 60000, 45000, 'C', 104),
(5, 'Ajay',   'Hyderabad', 'M', 'P', 'BBA',  '2024-08-12', 55000, 30000, 'C', 105),
(6, 'Pooja',  'Nagpur',    'F', 'F', 'MBA',  '2024-07-18', 80000, 70000, 'C', 106),
(7, 'Vikas',  'Delhi',     'M', 'P', 'BCA',  '2024-09-05', 50000, 50000, 'S', 107),
(8, 'Anita',  'Bangalore', 'F', 'F', 'MCom', '2024-06-22', 45000, 30000, 'C', 108),
(9, 'Rahul',  'Kolkata',   'M', 'P', 'BSc',  '2024-07-30', 40000, 20000, 'C', 109),
(10,'Divya',  'Jaipur',    'F', 'F', 'MBA',  '2024-08-25', 75000, 75000, 'S', 110);

