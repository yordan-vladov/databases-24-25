
# Работа с данни

---

# Преговор

---

![](/Attachments/Databases_Working_With_Data_Pic_1.png)

---

![](/Attachments/Databases_Working_With_Data_Pic_2.png)

---

```sql
CREATE TABLE students(
    number INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    gpa FLOAT
);
```

---
![](/Attachments/Databases_Working_With_Data_Pic_3.png)

---

![](/Attachments/Databases_Working_With_Data_Pic_4.png)

---

![](/Attachments/Databases_Working_With_Data_Pic_5.png)

---

![](/Attachments/Databases_Working_With_Data_Pic_6.png)

---

![](/Attachments/Databases_Working_With_Data_Pic_7.png)

---

![](/Attachments/Databases_Working_With_Data_Pic_8.png)

---

![](/Attachments/Databases_Working_With_Data_Pic_9.png)

---

![](/Attachments/Databases_Working_With_Data_Pic_10.png)

---

```sql
CREATE TABLE teachers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
);
```

---

```sql
CREATE TABLE lessons(
    id INT PRIMARY KEY AUTO_INCREMENT,
    room VARCHAR(255) NOT NULL,
    schedule DATETIME NOT NULL,
    teacher_id INT NOT NULL,
    FOREIGN KEY (teacher_id)
    REFERENCES teachers(id)
);
```

---

![](/Attachments/Databases_Working_With_Data_Pic_11.png)

---

![](/Attachments/Databases_Working_With_Data_Pic_12.png)

---
```sql
CREATE TABLE people(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
);
```

---

```sql
CREATE TABLE passports(
    number INT PRIMARY KEY,
    country VARCHAR(255) NOT NULL,
    issue_date DATETIME,
    owner_id INT NOT NULL UNIQUE,
    FOREIGN KEY (owner_id)
    REFERENCES people(id)
);
```

---

![](/Attachments/Databases_Working_With_Data_Pic_13.png)

---

![](/Attachments/Databases_Working_With_Data_Pic_14.png)

---

```sql
CREATE TABLE customers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
);
```

---

```sql
CREATE TABLE products(
    id INT PRIMARY KEY AUTO_INCREMENT,
    price FLOAT NOT NULL,
    description TEXT,
    name VARCHAR(255)
);
```

---

```sql
CREATE TABLE customers_products(
    customer_id INT,
    product_id INT,
    FOREIGN KEY (customer_id) REFERENCES
    customers(id),
    FOREIGN KEY (product_id) REFERENCES
    products(id),
    PRIMARY KEY(customer_id, product_id)
);
```

---

## Работа с данни - 1/2

1. ~~Структуриране на данни~~
2. ~~Добавяне на данни~~
3. ~~Извличане на данни~~

---
## Работа с данни - 2/2

4. Филтриране на данни
5. Актуализиране на данни
6. Изтриване на данни

---

## Филтриране на данни

```sql
SELECT <column-list> FROM <table-name>
WHERE <filters>
```

---

## Оператор за равенство (=)

- Намира редовете, които имат колона с определена стойност

```sql
SELECT * FROM students WHERE number = 21601;
```

---

## Оператори за сравнение (>, <, !=, >=,  ...)

- Работят по очакваният начин като при другите езици

```sql
SELECT * FROM students WHERE gpa >= 5.5;
```

---

## IS \[NOT] NULL,

- Когато искаме да проверим дали дадена колона няма стойност, т.е дали е `NULL`.

```sql
SELECT * FROM studenst WHERE gpa IS NULL;
```

---

## IN

- Проверява дали дадена колона има стойност от определен списък

```sql
SELECT * FROM subjects WHERE name IN ("Operating Systems",
"Databases");
```

---
## LIKE

- Търси стойности, които спазват определен шаблон
- Използва специални символи
    - % - 0 или повече символа
    - _  - 1 символ

---

```sql
SELECT * FROM students WHERE name LIKE "Ivan %";
SELECT * FROM students WHERE name LIKE "% Johnson";
SELECT * FROM subjects WHERE name LIKE "%Programming%";
```

---

## AND

- Позволява ни да комбинираме няколко условия
- Връща редовете, които спазват всички условия

```sql
SELECT * FROM students WHERE class_number = 216 AND gpa >= 5.5;
```

---

## OR

- Позволява ни да комбинираме няколко условия
- Връща редовете, които спазват поне едно от условията

```sql
SELECT * FROM students WHERE class_number = 216 OR gpa >= 5.5;
```

---
## NOT

- Връща редовете, които не спазват условие

```sql
SELECT * FROM subjects WHERE type NOT IN ("Lecture", "Lab");
```

---

## Задача

- Намерете всички ученици от четвърти курс
- Напишете поне две различни заявки

---

## Актуализиране на таблица

```sql
UPDATE <table-name> SET <column-1> = <value-1>,
<column-2> = <value-2>,... WHERE <condition>;
```

---

## Актуализиране на един ред

- Обикновено намираме реда чрез неговият главен ключ

```sql
UPDATE students SET gpa = 5.75 WHERE number = 21601;
```

---

## Задача

- Увеличете заплатата на всички учители с 15%

---

## Триене на елементи

```sql
DELETE FROM <table-name> WHERE <condition>;
```


---

- обикновено трием единични елементи, като ги намираме чрез техният главен ключ

```sql
DELETE FROM students WHERE number = 21601;
```

---
## Задача

- Изтрийте вашият клас от базата данни

---
