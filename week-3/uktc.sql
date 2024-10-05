-- Create a new database named 'uktc'
CREATE DATABASE uktc;

-- Select the 'uktc' database for use
USE uktc;

-- Disable foreign key checks to avoid conflicts during table creation
SET FOREIGN_KEY_CHECKS=0;

-- Create the 'students' table to store student information
CREATE TABLE students(
    number INT PRIMARY KEY,                    -- Primary key for each student (student number)
    name VARCHAR(255) NOT NULL,                -- Student name, cannot be NULL
    gpa FLOAT,                                 -- Student's GPA
    email VARCHAR(255) NOT NULL UNIQUE,        -- Student's email, must be unique and cannot be NULL
    class_number INT NOT NULL,                 -- Class number the student belongs to (foreign key)
    FOREIGN KEY (class_number) REFERENCES classes(number)  -- Set a foreign key constraint on 'class_number' to reference the 'classes' table
);

-- Create the 'classes' table to store information about classes
CREATE TABLE classes(
    number INT PRIMARY KEY,                    -- Primary key for the class (class number)
    number_of_students INT NOT NULL,           -- Number of students in the class
    leader_id INT NOT NULL UNIQUE,             -- Teacher assigned as class leader (foreign key)
    FOREIGN KEY (leader_id) REFERENCES teachers(id)  -- Set a foreign key constraint on 'leader_id' to reference the 'teachers' table
);

-- Create the 'teachers' table to store information about teachers
CREATE TABLE teachers(
    id INT PRIMARY KEY AUTO_INCREMENT,         -- Primary key for each teacher (auto-incremented)
    name VARCHAR(255) NOT NULL,                -- Teacher's name, cannot be NULL
    salary FLOAT NOT NULL,                     -- Teacher's salary
    email VARCHAR(255) UNIQUE NOT NULL         -- Teacher's email, must be unique and cannot be NULL
);

-- Create the 'subjects' table to store information about subjects
CREATE TABLE subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,         -- Primary key for each subject (auto-incremented)
    name VARCHAR(255) NOT NULL,                -- Subject name, cannot be NULL
    type VARCHAR(255) NOT NULL                 -- Type of subject (e.g., lecture, lab), cannot be NULL
);

-- Create the 'subjects_teachers' table for the many-to-many relationship between subjects and teachers
CREATE TABLE subjects_teachers(
    subject_id INT,                            -- Foreign key referencing the 'subjects' table
    teacher_id INT,                            -- Foreign key referencing the 'teachers' table
    FOREIGN KEY (subject_id) REFERENCES subjects(id),   -- Set foreign key constraint on 'subject_id'
    FOREIGN KEY (teacher_id) REFERENCES teachers(id),   -- Set foreign key constraint on 'teacher_id'
    PRIMARY KEY(subject_id, teacher_id)        -- Composite primary key combining 'subject_id' and 'teacher_id'
);

-- Re-enable foreign key checks after all tables have been created
SET FOREIGN_KEY_CHECKS=1;

-- Insert rows into 'teachers' table
INSERT INTO teachers (name, salary, email) VALUES
('John Doe', 50000, 'jdoe@example.com'),    -- Teacher ID 1
('Jane Smith', 55000, 'jsmith@example.com'), -- Teacher ID 2
('Emily Davis', 52000, 'edavis@example.com'); -- Teacher ID 3

-- Insert rows into 'classes' table
INSERT INTO classes (number, number_of_students, leader_id) VALUES
(101, 30, 1),   -- Class 101 led by Teacher ID 1
(102, 25, 2),   -- Class 102 led by Teacher ID 2
(103, 20, 3);   -- Class 103 led by Teacher ID 3

-- Insert rows into 'students' table
INSERT INTO students (number, name, gpa, email, class_number) VALUES
(1, 'Alice Johnson', 3.8, 'alice@example.com', 101), -- Alice in Class 101
(2, 'Bob Brown', 3.5, 'bob@example.com', 102),       -- Bob in Class 102
(3, 'Charlie Clark', 3.9, 'charlie@example.com', 103),-- Charlie in Class 103
(4, 'Diana White', 3.6, 'diana@example.com', 101);   -- Diana in Class 101

-- Insert rows into 'subjects' table
INSERT INTO subjects (name, type) VALUES
('Mathematics', 'Lecture'), -- Subject ID 1
('Physics', 'Lecture'),     -- Subject ID 2
('Chemistry', 'Lab'),       -- Subject ID 3
('English', 'Lecture');     -- Subject ID 4

-- Insert rows into 'subjects_teachers' table to map teachers to subjects
INSERT INTO subjects_teachers (subject_id, teacher_id) VALUES
(1, 1), -- Teacher ID 1 teaches Mathematics (Subject ID 1)
(2, 2), -- Teacher ID 2 teaches Physics (Subject ID 2)
(3, 3), -- Teacher ID 3 teaches Chemistry (Subject ID 3)
(4, 1), -- Teacher ID 1 also teaches English (Subject ID 4)
(3, 2); -- Teacher ID 2 also teaches Chemistry (Subject ID 3)

-- Check data by selecting records from the respective tables
SELECT * FROM teachers;
SELECT * FROM classes;
SELECT * FROM students;
SELECT * FROM subjects;
SELECT * FROM subjects_teachers;
