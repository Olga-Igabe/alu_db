-- ===================================================
-- INDIVIDUAL TASK (CREATING TABLES AND INSERTING DATA)
-- ===================================================
create DATABASE alu_db;
use alu_db;
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