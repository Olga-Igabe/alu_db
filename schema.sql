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
-- Table : Student_Courses, Student_Activities (junction tables)
-- ==========================================

-- ===================================================
-- GROUP TASKS (to be completed together)
-- ===================================================
-- Relationship Verification
-- Purpose: confirm every foreign key in the schema points to a valid
-- primary key in its referenced table. Each query below should return
-- ZERO rows if the relationship is clean. Any row returned means an
-- orphaned reference exists and must be fixed in that table's INSERT.

-- Check 1: Students.classroom_id -> Classroom.classroom_id
SELECT s.student_id, s.name, s.classroom_id
FROM Students s
LEFT JOIN Classroom c ON s.classroom_id = c.classroom_id
WHERE s.classroom_id IS NOT NULL AND c.classroom_id IS NULL;

-- Check 2: Courses.faculty_id -> Faculty.faculty_id
SELECT co.course_id, co.course_name, co.faculty_id
FROM Courses co
LEFT JOIN Faculty f ON co.faculty_id = f.faculty_id
WHERE co.faculty_id IS NOT NULL AND f.faculty_id IS NULL;

-- Check 3: Courses.classroom_id -> Classroom.classroom_id
SELECT co.course_id, co.course_name, co.classroom_id
FROM Courses co
LEFT JOIN Classroom c ON co.classroom_id = c.classroom_id
WHERE co.classroom_id IS NOT NULL AND c.classroom_id IS NULL;

-- Check 4: Extra_Curricular_Activities.faculty_advisor_id -> Faculty.faculty_id
SELECT a.activity_id, a.activity_name, a.faculty_advisor_id
FROM Extra_Curricular_Activities a
LEFT JOIN Faculty f ON a.faculty_advisor_id = f.faculty_id
WHERE a.faculty_advisor_id IS NOT NULL AND f.faculty_id IS NULL;

-- Check 5: Student_Courses.student_id -> Students.student_id
SELECT sc.student_id, sc.course_id
FROM Student_Courses sc
LEFT JOIN Students s ON sc.student_id = s.student_id
WHERE s.student_id IS NULL;

-- Check 6: Student_Courses.course_id -> Courses.course_id
SELECT sc.student_id, sc.course_id
FROM Student_Courses sc
LEFT JOIN Courses co ON sc.course_id = co.course_id
WHERE co.course_id IS NULL;

-- Check 7: Student_Activities.student_id -> Students.student_id
SELECT sa.student_id, sa.activity_id
FROM Student_Activities sa
LEFT JOIN Students s ON sa.student_id = s.student_id
WHERE s.student_id IS NULL;

-- Check 8: Student_Activities.activity_id -> Extra_Curricular_Activities.activity_id
SELECT sa.student_id, sa.activity_id
FROM Student_Activities sa
LEFT JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
WHERE a.activity_id IS NULL;

-- Result summary: all 8 checks returned zero rows -- no orphaned foreign
-- key references found across the schema.

-- Normalization check:

-- Each table stores only attributes that describe its own entity directly
-- (e.g. Students stores student info, Faculty stores faculty info), and
-- shared/repeated data is not duplicated across tables. Relationships
-- between entities are expressed through foreign keys (Students ->
-- Classroom, Courses -> Faculty/Classroom, Activities -> Faculty) rather
-- than by copying data. The many-to-many relationships (students to
-- courses, students to activities) are handled through dedicated junction
-- tables (Student_Courses, Student_Activities) rather than repeating
-- student or course/activity data inside either table, which avoids
-- duplication and keeps each fact stored in exactly one place.

-- Join query 1: Student enrolled in a course, taught by faculty, in a classroom

SELECT s.name AS student_name, c.course_name, f.name AS faculty_name, cl.room_number
FROM Student_Courses sc
JOIN Students s ON sc.student_id = s.student_id
JOIN Courses c ON sc.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

-- Join query 2: Student participates in an activity, advised by faculty

SELECT s.name AS student_name, a.activity_name, f.name AS advisor_name
FROM Student_Activities sa
JOIN Students s ON sa.student_id = s.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty f ON a.faculty_advisor_id = f.faculty_id;

-- Join query 3: Which classroom each course is held in, and which building it's in

SELECT c.course_name, cl.room_number, cl.building
FROM Courses c
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

-- Aggregate query: number of students enrolled in each course

SELECT c.course_name, COUNT(sc.student_id) AS student_count
FROM Courses c
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_name;
