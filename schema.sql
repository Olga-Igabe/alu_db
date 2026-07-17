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


-- ==========================================
-- Member : Tharcisse Irasubiza
-- Table : Students
-- ==========================================

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

INSERT INTO Students (student_id, name, email, classroom_id, enrollment_date) VALUES
(1, 'Alice Johnson', 'alice.j@alu.edu', 1, '2026-05-11'),
(2, 'Bob Smith', 'bob.smith@alu.edu', 2, '2026-05-12'),
(3, 'Charlie Kamau', 'charlie.k@alu.edu', 1, '2026-05-11'),
(4, 'Diana Prince', 'diana.p@alu.edu', 3, '2026-05-14'),
(5, 'Emmanuel Mensah', 'e.mensah@alu.edu', 2, '2026-05-15');

-- 3. UPDATE Statement
-- Updating Diana's email address
UPDATE Students 
SET email = 'diana.prince@alu.edu' 
WHERE student_id = 4;

-- 4. DELETE Statement
-- Removing a student record (e.g., student dropped out)
DELETE FROM Students 
WHERE student_id = 5;

-- 5. SELECT Query with a WHERE Clause
-- Finding all students enrolled on the first day of the term
SELECT student_id, name, email, classroom_id 
FROM Students 
WHERE enrollment_date = '2026-05-11';

-- ===================================================
-- Member: Niyonkuru Kabanda chris 
-- Table: Faculty
-- ===================================================
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL
);

INSERT INTO Faculty (faculty_id, name, email, department)
VALUES
    (1, 'Dr. Aline Uwase', 'aline.uwase@alu.edu', 'Computer Science'),
    (2, 'Dr. Eric Niyonsaba', 'eric.niyonsaba@alu.edu', 'Mathematics'),
    (3, 'Prof. Grace Mukamana', 'grace.mukamana@alu.edu', 'Business'),
    (4, 'Dr. Kevin Habimana', 'kevin.habimana@alu.edu', 'Computer Science'),
    (5, 'Prof. Diane Ingabire', 'diane.ingabire@alu.edu', 'Ethics & Leadership');

UPDATE Faculty
SET department = 'Computer Science'
WHERE faculty_id = 4;
DELETE FROM Faculty
WHERE faculty_id = 2;
SELECT * FROM Faculty
WHERE department = 'Computer Science';

-- ===================================================
-- Member: Maxim
-- Table: Courses
-- ===================================================
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    faculty_id INT,
    classroom_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id) ON DELETE SET NULL,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id) ON DELETE SET NULL
);

INSERT INTO Courses (course_name, course_code, faculty_id, classroom_id) VALUES
('Introduction to Linux', 'CS101', 1, 1),
('Calculus I', 'MATH101', 2, 2),
('Business Strategy', 'BUS101', 3, 3),
('Data Structures', 'CS201', 4, 1),
('Applied Ethics', 'ETH101', 5, 4);

UPDATE Courses SET course_name = 'Introduction to Python' WHERE course_id = 1;
DELETE FROM Courses WHERE course_id = 5;
SELECT * FROM Courses WHERE faculty_id IS NOT NULL;
-- ===================================================
-- Member: Raul
-- Table: Extracurricular Activities 
-- ===================================================
CREATE TABLE Extra_Curricular_Activities (
    activity_id INT AUTO_INCREMENT,
    activity_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    faculty_advisor_id INT,
    PRIMARY KEY (activity_id),
    FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

-- Sample data
INSERT INTO Extra_Curricular_Activities (activity_name, category, faculty_advisor_id) VALUES
('Debate Club', 'Academic', 1),
('Basketball Team', 'Sports', 4),
('Coding Club', 'Technology', 1),
('Drama Society', 'Arts', 3),
('Chess Club', 'Academic', 5);

-- Update: change category of Chess Club
UPDATE Extra_Curricular_Activities
SET category = 'Strategy'
WHERE activity_name = 'Chess Club';

-- Delete: remove Drama Society
DELETE FROM Extra_Curricular_Activities
WHERE activity_name = 'Drama Society';

-- Select: find all Academic category activities
SELECT * FROM Extra_Curricular_Activities
WHERE category = 'Academic';

-- ==========================================
-- Member : Enzo Ngarambe Ibeshaho
-- Table : Relationships verification
-- ==========================================

-- ===================================================
-- GROUP TASKS (to be completed together)
-- ===================================================

-- Normalization check:
-- [Write the group's paragraph here once all tables are reviewed]

-- Join query 1:


-- Join query 2:


-- Join query 3:


-- Aggregate query:
