CREATE DATABASE abcd;

CREATE TABLE abcd.users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary FLOAT
);

INSERT INTO abcd.users(name,salary) VALUES ("Gosho",2000);
