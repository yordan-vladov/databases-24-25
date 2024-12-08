
-- подреждаме учениците по среден успех
-- в низходящ ред
SELECT * FROM students
ORDER BY gpa DESC;

-- подреждаме учителите по заплати
-- в низходящ ред
SELECT * FROM teachers
ORDER BY salary DESC;

-- подреждаме класовете по среден успех
-- в низходящ ред
SELECT class_number, ROUND(AVG(gpa), 2) avg_gpa
FROM students
GROUP BY class_number
ORDER BY avg_gpa DESC;


-- подреждаме учениците от всеки клас
-- по среден успех
SELECT * FROM students
ORDER BY class_number, gpa;

-- подреждаме учениците от всяка група
-- по среден успех
SELECT * FROM students
ORDER BY class_number, group_number, gpa;

-- връщаме първият ученик
SELECT * FROM students
LIMIT 1;

-- намираме първите 10 ученика
-- с най-добър среден успех
SELECT * FROM students
ORDER BY gpa DESC
LIMIT 10;

-- намираме първите 5 учителя с най-добър
-- среден успех
SELECT * FROM teachers
ORDER BY salary DESC
LIMIT 5;

-- намираме първите 3 класа с най-много ученици
SELECT * FROM classes
ORDER BY number_of_students DESC
LIMIT 3;

SELECT class_number, COUNT(*) number_of_students FROM students
GROUP BY class_number
ORDER BY number_of_students DESC
LIMIT 3;

-- намираме от 11-ят до 20-ят ученик
-- с най-добър среден успех
SELECT * FROM students
ORDER BY gpa DESC
LIMIT 10 OFFSET 10;


-- страница = 15 ученика
-- 5-та страница
SELECT * FROM students
LIMIT 15 OFFSET 15;
