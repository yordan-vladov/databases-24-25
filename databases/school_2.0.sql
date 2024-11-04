
DROP DATABASE IF EXISTS abcd;
-- Create a new database named 'abcd' for a fake school
-- In this version the table students has a column group_number, which specifies the students group (1 or 2)
CREATE DATABASE abcd;

-- Select the 'abcd' database for use
USE abcd;

-- Disable foreign key checks to avoid conflicts during table creation
SET FOREIGN_KEY_CHECKS=0;

-- Create the 'students' table to store student information
CREATE TABLE students(
    number INT PRIMARY KEY,                    -- Primary key for each student (student number)
    name VARCHAR(255) NOT NULL,                -- Student name, cannot be NULL
    gpa FLOAT,                                 -- Student's GPA
    email VARCHAR(255) NOT NULL UNIQUE,        -- Student's email, must be unique and cannot be NULL
    class_number INT NOT NULL,                 -- Class number the student belongs to (foreign key)
    group_number ENUM('1','2'),
    FOREIGN KEY (class_number) REFERENCES classes(number)  -- Set a foreign key constraint on 'class_number' to reference the 'classes' table
) ENGINE=InnoDB   DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Create the 'classes' table to store information about classes
CREATE TABLE classes(
    number INT PRIMARY KEY,                    -- Primary key for the class (class number)
    number_of_students INT NOT NULL,           -- Number of students in the class
    leader_id INT NOT NULL UNIQUE,             -- Teacher assigned as class leader (foreign key)
    FOREIGN KEY (leader_id) REFERENCES teachers(id)  -- Set a foreign key constraint on 'leader_id' to reference the 'teachers' table
) ENGINE=InnoDB   DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Create the 'teachers' table to store information about teachers
CREATE TABLE teachers(
    id INT PRIMARY KEY AUTO_INCREMENT,         -- Primary key for each teacher (auto-incremented)
    name VARCHAR(255) NOT NULL,                -- Teacher's name, cannot be NULL
    salary FLOAT NOT NULL,                     -- Teacher's salary
    email VARCHAR(255) UNIQUE NOT NULL         -- Teacher's email, must be unique and cannot be NULL
)  ENGINE=InnoDB   DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Create the 'subjects' table to store information about subjects
CREATE TABLE subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,         -- Primary key for each subject (auto-incremented)
    name VARCHAR(255) NOT NULL,                -- Subject name, cannot be NULL
    type VARCHAR(255) NOT NULL                 -- Type of subject (e.g., lecture, lab), cannot be NULL
) ENGINE=InnoDB   DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Create the 'subjects_teachers' table for the many-to-many relationship between subjects and teachers
CREATE TABLE subjects_teachers(
    subject_id INT,                            -- Foreign key referencing the 'subjects' table
    teacher_id INT,                            -- Foreign key referencing the 'teachers' table
    FOREIGN KEY (subject_id) REFERENCES subjects(id),   -- Set foreign key constraint on 'subject_id'
    FOREIGN KEY (teacher_id) REFERENCES teachers(id),   -- Set foreign key constraint on 'teacher_id'
    PRIMARY KEY(subject_id, teacher_id)        -- Composite primary key combining 'subject_id' and 'teacher_id'
)  ENGINE=InnoDB   DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Reenable foreign key checks after all tables have been created
SET FOREIGN_KEY_CHECKS=1;

INSERT INTO teachers(id,name,salary,email) VALUES (1,'Grace L. Parker',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'grace.parker@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (2,'Ella N. Ward',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'ella.ward@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (3,'James R. Collins',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'james.collins@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (4,'Lily M. Evans',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'lily.evans@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (5,'Alice T. Holmes',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'alice.holmes@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (6,'Olivia K. Brooks',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'olivia.brooks@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (7,'Jack B. Carter',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'jack.carter@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (8,'Ava L. Foster',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'ava.foster@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (9,'Michael S. Greene',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'michael.greene@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (10,'Mia J. Powell',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'mia.powell@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (11,'Benjamin F. Adams',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'ben.adams@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (12,'Emma D. Lane',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'emma.lane@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (13,'Samuel W. Bennett',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'samuel.bennett@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (14,'Charlotte O. Ross',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'charlotte.ross@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (15,'Noah G. Morgan',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'noah.morgan@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (16,'Sophia E. Wallace',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'sophia.wallace@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (17,'Liam H. Wood',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'liam.wood@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (18,'Isabella V. Hughes',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'isabella.hughes@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (19,'Mason A. Cooper',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'mason.cooper@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (20,'Harper C. Simmons',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'harper.simmons@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (21,'Lucas P. Grant',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'lucas.grant@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (22,'Evelyn F. Murphy',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'evelyn.murphy@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (23,'Elijah Q. Jenkins',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'elijah.jenkins@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (24,'Abigail K. Rogers',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'abigail.rogers@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (25,'Logan N. Myers',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'logan.myers@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (26,'Aria M. Perry',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'aria.perry@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (27,'Jacob T. Diaz',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'jacob.diaz@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (28,'Scarlett R. Hughes',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'scarlett.hughes@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (29,'Aiden J. Howard',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'aiden.howard@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (30,'Sofia W. Hayes',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'sofia.hayes@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (31,'Ethan U. Morgan',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'ethan.morgan@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (32,'Chloe S. Bailey',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'chloe.bailey@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (33,'Daniel L. Morales',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'daniel.morales@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (34,'Nora P. Foster',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'nora.foster@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (35,'Matthew B. Clark',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'matthew.clark@abcd.com');
INSERT INTO teachers(id,name,salary,email) VALUES (36,'Victor E. Colson',ROUND(2000.00 + (RAND() * (4000.00 - 2000.00)), 2),'victor.colson@abcd.com');

INSERT INTO classes(number,number_of_students,leader_id) VALUES (101,27,1);
INSERT INTO classes(number,number_of_students,leader_id) VALUES (102,26,2);
INSERT INTO classes(number,number_of_students,leader_id) VALUES (103,24,3);
INSERT INTO classes(number,number_of_students,leader_id) VALUES (104,25,4);
INSERT INTO classes(number,number_of_students,leader_id) VALUES (105,27,5);

INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10101,'John E. Carter','10101@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10102,'James Y. Moore','10102@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10103,'Jack T. Thompson','10103@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10104,'Joseph D. Smith','10104@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10105,'Michael A. Ford','10105@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10106,'Alexander M. Taylor','10106@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10107,'Emily S. White','10107@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10108,'David S. Barnes','10108@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10109,'Daniel B. Wood','10109@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10110,'Matthew Y. Ross','10110@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10111,'Christopher P. Wright','10111@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10112,'Kevin P. Hall','10112@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10113,'Patrick I. Johnson','10113@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10114,'Thomas K. Lewis','10114@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10115,'Anthony V. Diaz','10115@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10116,'Emma S. Anderson','10116@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10117,'Sarah M. Edwards','10117@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10118,'Ryan R. Walker','10118@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10119,'George S. Hayes','10119@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10120,'Nicholas S. Hughes','10120@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10121,'Jessica A. Young','10121@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10122,'Anna C. Scott','10122@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10123,'Sophia T. Evans','10123@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10124,'Oliver S. Perez','10124@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10125,'Chloe Z. Collins','10125@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10126,'Lucas Z. Turner','10126@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10127,'Henry I. Coleman','10127@abcd.com',ROUND(2 + (RAND() * 4), 2),101,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10201,'Aiden D. Fuller','10201@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10202,'Elijah A. Morgan','10202@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10203,'Grace P. Sanders','10203@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10204,'Owen Z. Lane','10204@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10205,'Sophia Y. Perry','10205@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10206,'Amelia A. Foster','10206@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10207,'Liam R. Green','10207@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10209,'Ethan V. Mitchell','10209@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10211,'Madison G. Reed','10211@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10212,'Noah Y. Bennett','10212@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10213,'Dylan K. Phillips','10213@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10214,'Mia M. Rose','10214@abcd.com',ROUND(2 + (RAND() * 4), 2),102,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10215,'Ava V. Cox','10215@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10216,'Logan N. Rivera','10216@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10217,'Leo A. Ortiz','10217@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10218,'Luke I. Cooper','10218@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10219,'Sam P. Harris','10219@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10220,'Lily M. King','10220@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10221,'Ben I. Roberts','10221@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10222,'Jacob S. Howard','10222@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10223,'Hudson V. Butler','10223@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10224,'Austin S. Barnes','10224@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10225,'Adam P. Gonzalez','10225@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10226,'Isaac N. Clark','10226@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10227,'Michael T. Price','10227@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10228,'Faith E. Collins','10228@abcd.com',ROUND(2 + (RAND() * 4), 2),102,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10301,'Zoe N. Bell','10301@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10303,'Angel S. Stone','10303@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10304,'Victor V. Campbell','10304@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10305,'Austin I. Parker','10305@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10306,'Sam N. Gray','10306@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10307,'Paul N. Diaz','10307@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10308,'John I. Sanders','10308@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10310,'Ellie V. Watson','10310@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10312,'Gregory K. Watson','10312@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10313,'Evan E. Brooks','10313@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10314,'Zachary S. Flores','10314@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10316,'Eric N. Griffin','10316@abcd.com',ROUND(2 + (RAND() * 4), 2),103,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10317,'Isaiah P. Hill','10317@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10318,'Ava I. Ford','10318@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10319,'Owen M. Cook','10319@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10320,'Mason M. Diaz','10320@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10321,'Aidan H. Sullivan','10321@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10322,'Jason K. Diaz','10322@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10323,'Paige C. Mills','10323@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10326,'Connor V. Morgan','10326@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10327,'Caden S. White','10327@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10328,'James N. Kelly','10328@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10329,'Daniel P. Peterson','10329@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10330,'Stella Y. Morris','10330@abcd.com',ROUND(2 + (RAND() * 4), 2),103,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10401,'Liam A. Bailey','10401@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10402,'Alex P. Price','10402@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10403,'Cole I. Myers','10403@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10404,'Mark L. Riley','10404@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10405,'Luke V. Cooper','10405@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10406,'Henry C. Russell','10406@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10407,'Eric A. Murphy','10407@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10408,'Louis I. Brown','10408@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10409,'Mila C. Baker','10409@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10410,'Jane V. Mitchell','10410@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10411,'George H. Simmons','10411@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10412,'Amy V. Ford','10412@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10413,'Eric R. Patterson','10413@abcd.com',ROUND(2 + (RAND() * 4), 2),104,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10414,'Jacob D. Rivera','10414@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10415,'Ivy I. Roberts','10415@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10416,'Jack V. Larson','10416@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10417,'Lisa M. Turner','10417@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10418,'Hannah V. Flores','10418@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10419,'Joe I. Hawkins','10419@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10420,'Mark Z. Garcia','10420@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10421,'Liam N. Green','10421@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10422,'Ella P. Shaw','10422@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10424,'Sophia N. Roberts','10424@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10425,'Chris N. Elliott','10425@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10426,'Tom K. Riley','10426@abcd.com',ROUND(2 + (RAND() * 4), 2),104,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10501,'Jack I. Fowler','10501@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10502,'Mia M. Hughes','10502@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10503,'Emily M. Morgan','10503@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10504,'Louis D. Ward','10504@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10506,'Gregory P. Adams','10506@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10507,'Chloe S. Bell','10507@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10508,'Adam Z. Wilson','10508@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10509,'Michael P. Harris','10509@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10510,'Julia K. Watson','10510@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10511,'Tyler S. Foster','10511@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10512,'Martin A. Stone','10512@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10513,'Martin B. Matthews','10513@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10514,'Martin N. Fields','10514@abcd.com',ROUND(2 + (RAND() * 4), 2),105,1);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10515,'Michael N. Tate','10515@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10516,'Nicholas V. Voss','10516@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10517,'Samuel S. Cross','10517@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10518,'Simon R. Allen','10518@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10519,'Steven G. Irving','10519@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10520,'Stanley A. Vincent','10520@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10521,'Thea V. Vaughn','10521@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10522,'Tony I. Ellis','10522@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10523,'Colin P. Payne','10523@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10524,'Chloe D. Peterson','10524@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10525,'Claire P. Carter','10525@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10526,'Christopher P. Blake','10526@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10527,'Nathan G. Grant','10527@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);
INSERT INTO students(number,name,email,gpa,class_number, group_number) VALUES (10528,'Grace I. Bolton','10528@abcd.com',ROUND(2 + (RAND() * 4), 2),105,2);

INSERT INTO subjects(id,name,type) VALUES (1,'German','Lecture');
INSERT INTO subjects(id,name,type) VALUES (2,'Mathematics','Lecture');
INSERT INTO subjects(id,name,type) VALUES (3,'PE','Other');
INSERT INTO subjects(id,name,type) VALUES (4,'English','Lecture');
INSERT INTO subjects(id,name,type) VALUES (5,'Foreign Languages','Lecture');
INSERT INTO subjects(id,name,type) VALUES (6,'Class Hour','Other');
INSERT INTO subjects(id,name,type) VALUES (7,'Object Oriented Programming','Lab');
INSERT INTO subjects(id,name,type) VALUES (8,'Intro to Programming Algorithms','Lecture');
INSERT INTO subjects(id,name,type) VALUES (9,'Intro to Programming Algorithms','Lab');
INSERT INTO subjects(id,name,type) VALUES (10,'Project Activities','Other');
INSERT INTO subjects(id,name,type) VALUES (11,'Databases','Lecture');
INSERT INTO subjects(id,name,type) VALUES (12,'Databases','Lab');
INSERT INTO subjects(id,name,type) VALUES (13,'Operating Systems','Lecture');
INSERT INTO subjects(id,name,type) VALUES (14,'Operating Systems','Lab');
INSERT INTO subjects(id,name,type) VALUES (15,'Data Structures','Lecture');
INSERT INTO subjects(id,name,type) VALUES (16,'Data Structures','Lab');
INSERT INTO subjects(id,name,type) VALUES (17,'Web Development','Lecture');
INSERT INTO subjects(id,name,type) VALUES (18,'Web Development','Lab');
INSERT INTO subjects(id,name,type) VALUES (19,'Computer Networks','Lecture');
INSERT INTO subjects(id,name,type) VALUES (20,'Computer Networks','Lab');
INSERT INTO subjects(id,name,type) VALUES (21,'Software Engineering','Lecture');
INSERT INTO subjects(id,name,type) VALUES (22,'Mobile App Development','Lab');
INSERT INTO subjects(id,name,type) VALUES (23,'Cybersecurity Basics','Lecture');
INSERT INTO subjects(id,name,type) VALUES (24,'Machine Learning Fundamentals','Lecture');
INSERT INTO subjects(id,name,type) VALUES (25,'Cloud Computing','Lecture');
INSERT INTO subjects(id,name,type) VALUES (26,'Artificial Intelligence Concepts','Lecture');
INSERT INTO subjects(id,name,type) VALUES (27,'Music','Other');


INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (1,6);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (2,14);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (3,27);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (4,10);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (5,21);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (6,13);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (7,1);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (7,17);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (8,2);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (8,5);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (9,4);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (9,11);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (10,7);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (10,8);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (11,19);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (11,18);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (12,25);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (12,20);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (13,3);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (13,12);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (14,5);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (14,23);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (15,18);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (15,9);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (16,12);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (16,11);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (17,9);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (17,3);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (18,11);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (18,15);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (19,16);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (19,10);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (20,8);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (20,22);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (21,17);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (21,29);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (22,20);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (22,6);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (23,15);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (23,4);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (24,23);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (24,19);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (25,30);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (25,21);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (26,29);
INSERT INTO subjects_teachers(subject_id,teacher_id) VALUES (26,14);
