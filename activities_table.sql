-- Raul: Extra_Curricular_Activities table

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
('Basketball Team', 'Sports', 2),
('Coding Club', 'Technology', 1),
('Drama Society', 'Arts', 3),
('Chess Club', 'Academic', 2);

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
