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
('Introduction to linux', 'CS101', 1, 1);

UPDATE Courses SET course_name = 'Introduction to python' WHERE course_id = 1;
DELETE FROM Courses WHERE course_id = 1;
SELECT * FROM Courses WHERE faculty_id IS NOT NULL;