-- Use the 'abcd' database about a fictional school from the 'school.sql' file in the 'databases' folder
USE abcd;

-- Select all columns from the students table where the GPA is greater than 4.5
SELECT * FROM students WHERE
gpa > 4.5;

-- Select all columns from the subjects table where the name contains the substring " Programming "
SELECT * FROM subjects WHERE
name LIKE '% Programming %';

-- Decrease the GPA of all students by 1
UPDATE students SET gpa = gpa - 1;

-- Delete all students from the table whose GPA is less than 2
DELETE FROM students WHERE gpa < 2;

-- Select the teacher's name, class number, and number of students in each class
SELECT t.name teacher, c.number class, c.number_of_students students
FROM teachers t JOIN classes c
ON t.id = c.leader_id;

-- Select the teacher's name, subject name, and subject type by joining subjects, subjects_teachers, and teachers tables
SELECT t.name teacher, s.name subject, s.type
 FROM subjects s JOIN subjects_teachers st
ON s.id = st.subject_id JOIN teachers t ON t.id = st.teacher_id;

-- Select the teacher's name, subject name, and subject type for the subject named 'Databases'
SELECT t.name teacher, s.name subject, s.type
 FROM subjects s JOIN subjects_teachers st
ON s.id = st.subject_id JOIN teachers t ON t.id = st.teacher_id
WHERE s.name = 'Databases';

-- Select the class number of classes led by the teacher named "Grace L. Parker"
SELECT c.number class
FROM teachers t JOIN classes c
ON t.id = c.leader_id
WHERE t.name = "Grace L. Parker";

-- Select the class number and name of students in classes led by "Grace L. Parker"
SELECT s.number, s.name class
FROM teachers t JOIN classes c
ON t.id = c.leader_id
JOIN students s ON s.class_number = c.number
WHERE t.name = "Grace L. Parker";

-- Select the teacher's name and the class number, and number of students of their class, including teachers without classes
SELECT t.name teacher, c.number class, c.number_of_students students
FROM teachers t LEFT JOIN classes c
ON t.id = c.leader_id;

-- Select the teacher's name and the subject name and type of the subjects that they lead, including subjects without assigned teachers
SELECT t.name teacher, s.name subject, s.type
 FROM teachers t RIGHT JOIN subjects_teachers st ON t.id = st.teacher_id
RIGHT JOIN  subjects s ON s.id = st.subject_id;

-- Select distinct names and emails from both teachers and students
SELECT name, email FROM teachers
UNION
SELECT name, email FROM students;

-- Select teacher names, subject names, and types, including teachers without assigned subjects AND subjects without assigned teachers
SELECT t.name teacher, s.name subject, s.type
 FROM teachers t LEFT JOIN subjects_teachers st ON t.id = st.teacher_id
LEFT JOIN  subjects s ON s.id = st.subject_id
UNION
SELECT t.name teacher, s.name subject, s.type
 FROM teachers t RIGHT JOIN subjects_teachers st ON t.id = st.teacher_id
RIGHT JOIN  subjects s ON s.id = st.subject_id;
