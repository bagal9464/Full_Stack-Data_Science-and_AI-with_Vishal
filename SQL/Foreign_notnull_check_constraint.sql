CREATE TABLE Studmarks (
    Sno NUMERIC(5) NOT NULL,
    Subcode VARCHAR(10) NOT NULL,
    Faculty VARCHAR(25),
    Sdate DATE NOT NULL DEFAULT (GETDATE()),
    End_date DATE NOT NULL DEFAULT (GETDATE()),
    Marks VARCHAR(3),

    -- Primary Key (Composite: Sno + Subcode)
    CONSTRAINT studmarks_pk PRIMARY KEY (Sno, Subcode),

    -- Foreign Keys (assuming related tables exist)
    CONSTRAINT fk_studmarks_students FOREIGN KEY (Sno) REFERENCES Students(Sno),
    CONSTRAINT fk_studmarks_subjects FOREIGN KEY (Subcode) REFERENCES Subjects(Subcode),

    -- Check constraint: start date must be before end date
    CONSTRAINT studmarks_date_chk CHECK (Sdate < End_date)
);



INSERT INTO Studmarks (Sno, Subcode, Faculty, Sdate, End_date, Marks)
VALUES
(1, 'C', 'Dr. Sharma', '2024-06-15', '2024-07-15', '85'),
(2, 'DS', 'Dr. Sharma', '2024-06-15', '2024-07-15', '90'),
(3, 'HTML', 'Prof. Iyer', '2024-06-20', '2024-07-20', '78'),
(4, 'JV', 'Prof. Iyer', '2024-06-20', '2024-07-20', '88'),
(5, 'MAT', 'Dr. Verma',  '2024-07-01', '2024-08-01', '92'),
(6, 'PTY', 'Dr. Verma',  '2024-07-01', '2024-08-01', '81'),
(7, 'R', 'Prof. Rao',  '2024-07-05', '2024-08-05', '76'),
(8, 'RBY', 'Prof. Rao',  '2024-07-05', '2024-08-05', '89'),
(9, 'RDBMS', 'Dr. Patel',  '2024-07-10', '2024-08-10', '95'),
(10,'VB', 'Dr. Patel',  '2024-07-10', '2024-08-10', '84');
