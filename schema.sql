-- ===================================================
-- INDIVIDUAL TASK (CREATING TABLES AND INSERTING DATA)
-- ===================================================
create DATABASE alu_db;
use alu_db;

-- ==========================================
-- Member A: Tharcisse Irasubiza
-- ==========================================

-- 1. CREATE TABLE Statement
CREATE TABLE Students (
    student_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    classroom_id INT,
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- 2. INSERT INTO Statement (5 Sample Rows)
-- Note: Assumes classroom_ids 101, 102, 103 already exist in the Classroom table.
INSERT INTO Students (student_id, name, email, classroom_id, enrollment_date) VALUES
(1, 'Alice Johnson', 'alice.j@alu.edu', 101, '2026-05-11'),
(2, 'Bob Smith', 'bob.smith@alu.edu', 102, '2026-05-12'),
(3, 'Charlie Kamau', 'charlie.k@alu.edu', 101, '2026-05-11'),
(4, 'Diana Prince', 'diana.p@alu.edu', 103, '2026-05-14'),
(5, 'Emmanuel Mensah', 'e.mensah@alu.edu', 102, '2026-05-15');

-- 3. UPDATE Statement
-- Updating Diana's email address
UPDATE Students 
SET email = 'diana.prince@alu.edu' 
WHERE student_id = 4;
-- ===================================================
-- Member: Olga Igabe
-- Table: Classroom
-- ===================================================
CREATE TABLE Classroom (
    classroom_id INT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);

-- Insert sample rows
INSERT INTO Classroom (classroom_id, room_number, building, capacity)
VALUES
    (1, '108', 'Social Commons', 30),
    (2, '210', 'Entreprise Commons', 25),
    (3, '203', 'Science Block', 40),
    (4, '304', 'Leadership Center', 35),
    (5, '105', 'Arts Block', 20);

-- UPDATE statement
UPDATE Classroom
SET capacity = 45
WHERE classroom_id = 3;

-- DELETE statement
DELETE FROM Classroom
WHERE classroom_id = 5;

-- SELECT query with WHERE clause
SELECT * FROM Classroom
WHERE building = 'Science Block';

-- ===================================================
-- Member:
-- Table: Faculty
-- ===================================================

-- ===================================================
-- Member: 
-- Table: Students 
-- ===================================================

-- ===================================================
-- Member: 
-- Table: Courses
-- ===================================================

-- ===================================================
-- Member: 
-- Table: Extracurricular Activities 
-- ===================================================

-- ===================================================
-- GROUP TASKS (to be completed together)
-- ===================================================

-- Normalization check:
-- [Write the group's paragraph here once all tables are reviewed]

-- Join query 1:


-- Join query 2:


-- Join query 3:


-- Aggregate query:
