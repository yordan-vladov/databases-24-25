# Проектиране на база данни - Продължение

---

# Преговор

---

![Example_Entity_Test](/Attachments/Example_Entity_Test.png)

---

![Example_Relationship](/Attachments/Example_Relationship.png)

---

![Example_One_To_One_Test](/Attachments/Example_One_To_One_Test.png)

---

![Example_One_To_Many_Test](/Attachments/Example_One_To_Many_Test.png)

---

![Example_Many_To_Many_Test](/Attachments/Example_Many_To_Many_Test.png)

---

![Example_ER_Relationships](/Attachments/Example_ER_Relationships.png)

---

## База данни на UKTC

![UKTC_ER](/Attachments/UKTC_ER.png)

---

## Дизайн на база данни

1. ~~Анализ на изискванията~~
2. ~~Концептуален дизайн~~
3. Логически дизайн

---
## Логически дизайн

- избор на DBMS
- имплементация на обектите и връзките между тях

---

## Избор на DMBS

- ще използваме релационна СУБД
- MySQL за Windows, MariaDB за Linux
- използваме MySQL Workbench за графичен интерфейс

---

## Създаване на база данни

```sql
CREATE DATABASE [IF NOT EXISTS] database_name;
```

---

## Създаване на база данни за УКТЦ

```sql
CREATE DATABASE uktc;
USE uktc;
```

---

## Създаване на таблица - 1/2

```sql
CREATE TABLE <table> (<table_def>)
```

---

## Създаване на таблица - 2/2

```sql
CREATE TABLE <table> (
...
<column-name> <column-type> <column-constraints>,
...
)
```

---

##  Създаване на таблица - Пример

```sql
CREATE TABLE students (
	number INT,
	name VARCHAR(255),
	gpa FLOAT,
	email VARCHAR(255)
);
```

---

## Триене на таблица

```sql
DROP TABLE <table-name>;
```

---

## Колони - ограничения

- ограничава допълнително стойностите на дадена колона
- **PRIMARY KEY** - колоната е главен ключ
- **NOT NULL** - колоната трябва да има стойност
- **UNIQUE** - всяка стойност на колоната трябва да е уникална

---

## Създаване на таблица с ограничения - Пример

```sql
CREATE TABLE students (
	number INT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	gpa FLOAT,
	email VARCHAR(255) UNIQUE NOT NULL
);
```

---

## Въвеждане на данни

```sql
INSERT INTO <table> VALUES (<values-list>);
INSERT INTO <table> (<column-list>)
VALUES (<value-list>)
```

- При първият вариант трябва да попълним всички полета
- При вторият вариант всички полета, което не са в \<column-list> ще останат със стойност `null`

---

## Въвеждане на данни - Пример

```sql
INSERT INTO students VALUES (21601, "Alexander Alexandrov", 6.00, "21601@uktc-bg.com");
INSERT INTO  students (number, name, email) VALUES (21602, "Boris Borisov", "21602@uktc-bg.com");
```

---

## Извличане на данни

```sql
SELECT * FROM <table-name>;
SELECT <column-list> FROM <table-name>;
```

---

## Извличане на данни - Пример

```sql
SELECT * FROM students;
SELECT name, gpa FROM students;
```

---

## Самоувеличаващи се колони

- Колона може да има ограничение **AUTO_INCREMENT**
- При въвеждане нов ред, стойността на тази колона се въвежда автоматично
- Обикновено се използва за главният ключ

---

```sql
CREATE TABLE teachers(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	salary FLOAT NOT NULL
);

INSERT INTO teachers(name, email, salary)
VALUE ("Yordan Vladov", "y.vladov@uktc-bg.com", 100000);

SELECT * FROM teachers;
```

---

# Осъществяване на връзки

---

## Едно-Към-Много (1:N)

- Таблицата с "много" съответстващи елементи ще съдържа колона, която сочи към главният ключ на таблицата с "един" съответстващ елемент
- тази колона се нарича външен ключ (**FOREIGN KEY**)

---

![Many_To_One_Implementation](/Attachments/Many_To_One_Implementation.png)

---

```sql
CREATE TABLE students (
	number INT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	gpa FLOAT,
	email VARCHAR(255) UNIQUE NOT NULL,
	class_number INT,
	FOREIGN KEY (class_number) REFERENCES classes(number)
);
```

---
## Едно-Към-Едно (1:1)

- Една от таблиците съдържа колона външен ключ, който сочи към другата
- За да няма повторения, външният има ограничение **UNIQUE**

---

![One_To_One_Implementation](/Attachments/One_To_One_Implementation.png)

---

```sql
CREATE TABLE classes (
	number INT PRIMARY KEY,
	students_number INT NOT NULL,
	leader_id INT UNIQUE,
	FOREIGN KEY (leader_id) REFERENCES teachers(id)
);
```

---

## Много-Към-Много (N:N)

- Използваме междинна свързваща таблица, в която записваме различни свързвани обекти от двете таблици


---

![[Many_To_Many_Implementation.png]]
![Many_To_Many_Implementation](/Attachments/Many_To_Many_Implementation.png)

---

```sql
CREATE TABLE subjects_teachers(
	subject_id INT,
	teacher_id INT,
	PRIMARY KEY (subject_id, teacher_id),
	FOREIGN KEY (subject_id) REFERENCES subjects(id),
	FOREIGN KEY (teacher_id) REFERENCES teachers(id),
);
```
