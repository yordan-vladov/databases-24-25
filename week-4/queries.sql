-- Select a student with a specific student number
SELECT * FROM students
WHERE number = 10201;

-- Select all students from a specific class
SELECT * FROM students
WHERE class_number = 102;

-- Select all subjects of a specific type ("Lecture")
SELECT * FROM subjects
WHERE type = "Lecture";

-- Select students from classes with a class number greater than 105
SELECT * FROM students
WHERE class_number > 105;

-- Select students with no GPA (NULL value)
SELECT * FROM students
WHERE gpa IS NULL;

-- Select students in multiple specific classes
SELECT * FROM students
WHERE class_number IN (102, 103);

-- Select students with first name "Ava"
SELECT * FROM students
WHERE name LIKE "Ava %";

-- Select students whose name starts with "Chris" ("Chris", "Christopher")
SELECT * FROM students
WHERE name LIKE "Chris%";

-- Select students whose last name is "Green"
SELECT * FROM students
WHERE name LIKE "% Green";

-- Select subjects whose name does not contain the word "Programming"
SELECT * FROM subjects
WHERE name NOT LIKE "%Programming%";


-- Task 1: Select all students in course 1 (101 to 105)

-- Select students in specific class numbers (101 to 105)
SELECT * FROM students
WHERE class_number IN (101, 102, 103, 104, 105);

-- Select students whose class number is between 101 and 105 (using >= and <=)
SELECT * FROM students
WHERE class_number >= 101
AND class_number <= 105;

-- Select students whose class number is between 101 and 105 (using BETWEEN)
SELECT * FROM students
WHERE class_number BETWEEN 101 AND 105;

-- Select students whose student number starts with "10"
SELECT * FROM students
WHERE number LIKE "10%";

-- Update the GPA of a specific student
UPDATE students
SET gpa = 6
WHERE number = 10206;

-- Update the GPA for all students in a specific class
UPDATE students
SET gpa = 6
WHERE class_number = 102;

-- Select all students in class number 102 (to verify the previous update)
SELECT * FROM students
WHERE class_number = 102;

-- Task 2: Increase the salary of all teachers by 15%
UPDATE teachers
SET salary = salary * 1.15;

-- Select all teachers (to verify the salary update)
SELECT * FROM teachers;

-- Delete a student with a specific student number
DELETE FROM students
WHERE number = 10216;

-- Select a class with a specific class number
SELECT * FROM classes
WHERE number = 102;

-- Task 3: Delete a specific class

-- Delete all students from a specific class
DELETE FROM students
WHERE class_number = 102;

-- Delete a class with a specific class number
DELETE FROM classes
WHERE number = 102;
