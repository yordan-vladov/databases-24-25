# Разделяне на базата данни
---
## Съдържание

- Какво е разделяне?
- Видове разделяне?
- Разделяне в MySQL.
---
### Какво е разделяне?

- **Разделяне (Partitioning)** е техника, в която разделяме таблиците на базата да---нни на по-малки, независими части, наречени **раздели (partitions)**.
- Това трябва да увеличи скоростта и наличността на големи бази данни.
---
### Видове разделяне

- Спрямо начина, по който разделяме таблицата:
    - **вертикално** - разделяме колоните
    - **хоризонтално** - разделяме редовете
---
### Вертикално разделяне

- Разделяме таблицата на база нейните **колони**. Колоните в даден раздел се определят от критерий като логическа свързаност, честота на достъп, т.н.
---
![](/Attachments/DB_Partioining_1.png)

---
![](/Attachments/DB_Partioining_2.png)

---
- Чрез вертикалното разделяне ние можем да направим заявките по-бързи, понеже данните, които се достъпват/обработват, са по-малки.
---
- **MySQL** не поддържа пряко вертикално разделяне. Вместо да разделяме таблицата, можем да ограничаваме колоните, които достъпваме (избягваме `SELECT *`).
---
- Ако някои колони от таблицата отнемат много пространство (като `BLOB` или `JSON`) или се актуализират много често, тогава можем да се замислим дали да ги сложим в отделна таблица.
---
## Хоризонтално разделяне

- Разделяме таблицата на база нейните **редове**. Редовете в даден раздел се определят от критерий като стойност на определена колона, време на създаване и др.
---
![](/Attachments/DB_Partioining_1.png)

---
![](/Attachments/DB_Partioining_3.png)

---
![](/Attachments/DB_Partioining_4.png)

---

- **MySQL** предлага няколко начина да разделим една таблица хоризонтално.
---
### Хоризонтално разделяне - Пример

- Имаме следната таблица:
```sql
CREATE TABLE library_books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    publication_year INT,
    isbn VARCHAR(13),
    genre VARCHAR(50),
    checked_out BOOLEAN DEFAULT FALSE,
    checked_out_date DATE,
    due_date DATE,
    shelf_location VARCHAR(50)
)
```
---
### RANGE Partition

- Разделяме таблицата спрямо различни диапазони на една колона:
```mysql
PARTITION BY RANGE (publication_year) (
    PARTITION p0 VALUES LESS THAN (1900),
    PARTITION p1 VALUES LESS THAN (1950),
    PARTITION p2 VALUES LESS THAN (2000),
    PARTITION p3 VALUES LESS THAN MAXVALUE
);
```
---
### LIST Partition

- Всеки раздел има фиксиран списък от стойности:
```mysql
PARTITION BY LIST (author) (
    PARTITION p0 VALUES IN ('William Shakespeare', 'Jane Austen', 'George Orwell'),
    PARTITION p1 VALUES IN ('J.K. Rowling', 'Agatha Christie', 'Stephen King'),
    PARTITION p2 VALUES IN ('J.R.R. Tolkien', 'Gabriel García Márquez', 'Toni Morrison'),
    PARTITION p3 VALUES IN ('Haruki Murakami', 'Neil Gaiman', 'Chimamanda Ngozi Adichie')
);
```
---
### KEY Partition

- Разделяме таблицата спрямо главният ключ:
```mysql
PARTITION BY KEY()
PARTITIONS 4;
```
---
## Sharding

- Вертикално разделяне на таблица, като всеки раздел се пази на отделен MySQL Server.
- Допълнително пододрябва скалируемостта на базата данни.
---
