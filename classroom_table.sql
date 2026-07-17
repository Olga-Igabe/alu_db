-- Raul: Classroom table

CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    PRIMARY KEY (classroom_id)
);

-- Sample data
INSERT INTO Classroom (room_number, building, capacity) VALUES
('101', 'Innovation Hub', 30),
('102', 'Innovation Hub', 25),
('201', 'Science Block', 40),
('202', 'Science Block', 35),
('305', 'Main Building', 20);

-- Update: change capacity of room 101
UPDATE Classroom
SET capacity = 32
WHERE room_number = '101';

-- Delete: remove room 305
DELETE FROM Classroom
WHERE room_number = '305';

-- Select: find classrooms with capacity over 30
SELECT * FROM Classroom
WHERE capacity > 30;
