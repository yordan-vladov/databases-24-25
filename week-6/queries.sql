-- Counts the total number of records in the 'students' table.
SELECT COUNT(*) FROM students;

-- Counts the number of non-null 'gpa' values in the 'students' table.
SELECT COUNT(gpa) FROM students;

-- Calculates the total of all 'salary' values in the 'teachers' table, rounding to two decimal places.
SELECT ROUND(SUM(salary), 2) FROM teachers;

-- Calculates the average 'gpa' of all students, rounding to two decimal places.
SELECT ROUND(AVG(gpa), 2) FROM students;

-- Finds the minimum 'gpa' value in the 'students' table.
SELECT MIN(gpa) FROM students;

-- Finds the maximum 'gpa' value in the 'students' table.
SELECT MAX(gpa) FROM students;

-- Counts the number of students in each 'class_number' group in the 'students' table.
SELECT class_number, COUNT(*)
FROM students
GROUP BY class_number;

-- Calculates the average 'gpa' for each 'class_number' group in the 'students' table, rounding to two decimal places.
SELECT class_number, ROUND(AVG(gpa), 2)
FROM students
GROUP BY class_number;

-- Counts the number of subjects each teacher teaches, including teachers with no subjects (using a LEFT JOIN).
SELECT t.name, COUNT(st.subject_id)
FROM teachers t
LEFT JOIN subjects_teachers st ON t.id = st.teacher_id
GROUP BY t.id;

-- Calculates the average salary of teachers for each subject, rounding to two decimal places,
-- including subjects without assigned teachers (using LEFT JOIN).
SELECT s.name, ROUND(AVG(t.salary), 2)
FROM subjects s
LEFT JOIN subjects_teachers st ON s.id = st.subject_id
LEFT JOIN teachers t ON t.id = st.teacher_id
GROUP BY s.id;

-- Counts the number of students in each combination of 'class_number' and 'group_number'.
SELECT class_number, group_number, COUNT(*) AS students
FROM students
GROUP BY class_number, group_number;
