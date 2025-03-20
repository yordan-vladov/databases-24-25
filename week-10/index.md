# Индекси

---
## Съдържание

1. Какво е индекс?
2. Работа с индекси.
3. Различни видове индекси.
---
## Какво е индекс?

- Структура от данни, пази информация за таблица.
- Прави **SELECT** заявките по-бързи.
- Прави **INSERT**, **UPDATE**, **DELETE** заявките по-бавни.
---
## Индекс - Пример

- **PRIMARY KEY** на всяка таблица се индексира автоматично.
- Това означава, че всеки път когато искаме да потърсим елемент по неговият **PRIMARY KEY**, базата данни го връща веднага.
---
## Индекс - Use Case

- Търсене на служители по име
```mysql
SELECT * FROM employees
WHERE first_name = "Steven" AND last_name = "King";
```

---
## Създаване на индекс

```mysql
CREATE TABLE t(
   c1 INT PRIMARY KEY,
   c2 INT NOT NULL,
   c3 INT NOT NULL,
   c4 VARCHAR(10),
   INDEX (c2)
);
```

---
## Добавяне на индекс

```mysql
CREATE INDEX index_name
ON table_name (column_list);

CREATE INDEX idx_c4 ON t(c4); -- за горната таблица
```

---
## Премахване на индекс

```mysql
DROP INDEX index_name
ON table_name;
```

---
## Индекс - Задача

- Искаме да индексираме колоната **first_name** от таблицата **employees**, понеже очакваме да търсим служители по техните първи имена много често.
---
```mysql

-- искаме да изведем всички служители, които се казват 'John'
SELECT * FROM employees
WHERE first_name = "John";

-- колоната 'first_name' не е индексирана, затова заявката трябва да обработи всички редове на таблицата. За да направим заявката по-ефективна създаваме индекс

CREATE INDEX first_name ON employees(first_name);

-- ако изпълним заявката отново MySQL ще обработи само търсените редове, понеже колоната вече е индексирана

EXPLAIN SELECT * FROM employees WHERE first_name = "John";

-- ако не очакваме да търсим спрямо тяхното първо име, тогава индексът не ни трябва и можем да го изтрием

DROP INDEX first_name ON employees;
```
---
## Алтернативно наименование

- Индексът също така може да се нарича ключ (**KEY**) при различните заявки.

```mysql
CREATE TABLE t(
   c1 INT PRIMARY KEY,
   c2 INT NOT NULL,
   c3 INT NOT NULL,
   c4 VARCHAR(10),
   KEY (c2)
);
```
---
```mysql
CREATE KEY index_name
ON table_name (column_list);

DROP KEY index_name
ON table_name;
```
---
# Видове индекси
---
## Съставен индекс

- Индексираме повече от една колона.
- Ще оптимизира заявки, в които се търси по индексираните колони.
- Важен е редът, в който са индексирани колоните.
---
## Съставен индекс - Синтаксис

```mysql
CREATE TABLE table_name (
    c1 data_type PRIMARY KEY,
    c2 data_type,
    c3 data_type,
    c4 data_type,
    INDEX index_name (c2,c3,c4)
);
```
---
```mysql
CREATE INDEX index_name
ON table_name(c2,c3,c4);
```
---
- Ако индексираме колоните `(c1, c2, c3)`, тогава ще се оптимизират заявки, в които търсим по:
```txt
(c1)
(c1,c2)
(c1,c2,c3)
```
---
## Съставен ключ - Задача

- Искаме да индексираме колоните **first_name**, **middle_name**, **last_name** от таблицата **employees**, понеже очакваме да търсим служители по техните имена много често.
- В какъв ред ще ги индексираме?
---
```mysql
-- създаване на индекс върху колоните 'first_name' и 'last_name'

CREATE INDEX name ON employees(first_name,last_name, middle_name);

-- тази заявка сега ще бъде оптимизирана

SELECT * FROM employees WHERE first_name = "Steven"
AND last_name = "King" AND middle_name = "E.";

-- тази заявка също

SELECT * FROM employees WHERE first_name = "Steven"
AND last_name = "King";

-- тази също
SELECT * FROM employees WHERE first_name = "Steven";

-- тази няма да е оптимизирана, защото колоната не формира ляв префикс на индекса

SELECT * FROM employees WHERE last_name = "King";
```
---
## Уникален индекс

- Налага уникалността на индексираните колони.
- Създава се автоматично при дефиниране на ограничение **UNIQUE**

---
## Уникален индекс - Синтаксис

```mysql
CREATE TABLE table_name(
...
   UNIQUE KEY(index_column_,index_column_2,...)
);
```
---
```mysql
CREATE UNIQUE INDEX index_name
ON table_name(index_column_1,index_column_2,...);
```
---
Алтернативно:

```mysql
CREATE TABLE table_name(
...
  CONSTRAINT c_unique UNIQUE (index_column_,index_column_2,...)
);
```
---
```mysql
ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE KEY(column_1,column_2,...);
```
---
## UNIQUE и NULL

- В MySQL всички `NULL` стойности се третират като различни.
```mysql
CREATE TABLE contacts(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) UNIQUE
);
```
---
```mysql
INSERT INTO contacts(name, phone)
VALUES
   ('Alice','(408)-102-2456'),
   ('John', NULL),
   ('Jane', NULL);
```
---
## Префиксен индекс

- Данните на индексирана колона се съхраняват в отделна структура от данни.
- Ако стойностите на колоните са много дълги (например при **VARCHAR**), това може да отнеме много пространство.
- Затова ние можем да пазим само началото на всяка стойност (префиксът) в индекса.
---
## Префиксен индекс - Синтаксис

```mysql
CREATE TABLE table_name(
    column_list,
    INDEX(column_name(length))
);
```
---
```mysql
CREATE INDEX index_name
ON table_name(column_name(length));
```
---
## Префиксен индекс - Пример

![](/Attachments/DB-Indexes-Pic-1.png)

---
- Искаме да индексираме колоната **productName**
- Тя има максимална дължина 70, което може да забави индексирането
- Затова ще я индексираме по префикс
---
- Намираме подходяща дължина на префикс:
```mysql
SELECT COUNT(*) FROM products;
SELECT
   COUNT(DISTINCT LEFT(productName, 20)) unique_rows
FROM
   products;
```
---
- Създаваме индекса:
```mysql
CREATE INDEX idx_productname  ON products(productName(20));
```
---
- Проверяваме резултат:
```mysql
EXPLAIN SELECT
    productName,
    buyPrice,
    msrp
FROM
    products
WHERE
    productName LIKE '1970%';
```
---
## Клъстерен индекс

- Самата таблица, определя подреждането на добавени редове
- При **InnoDB** всяка таблица трябва да има клъстерен индекс
- По подразбиране това е **PRIMARY KEY**
---
- Ако таблица няма **PRIMARY KEY**, ще се използва първата колона или набор от колони, които имат ограничения **UNIQUE** и **NOT NULL**
- Ако няма такъв, ще се създаде виртуален клъстерен индекс
- Всички други индекси на една таблица се водят вторични
---
- Понеже клъстерният индекс се използва често, добра идея е **PRIMARY KEY** на една таблица да бъде кратък
- Затова повечето пъти един **PRIMARY KEY** е от тип **INT** с ограничение **AUTO_INCREMENT**
---
## Функционален индекс

- Индексираме резултата от функция, използваща една или повече колони на таблицата.
- Правим го ако тази функция участва в често използвана заявка.
---
## Функционален индекс - Синтаксис

```mysql
CREATE INDEX index_name
ON table_name ((fn));
```

---
## Функционален индекс - Пример

![](/Attachments/DB-Indexes-Pic-2.png)

---
- Искаме да забързаме следната заявка
```mysql
SELECT COUNT(*) FROM    orders  WHERE    YEAR(orderDate) = 2004;
```
---
- Ще индексираме функцията **YEAR**
```mysql
CREATE INDEX idx_year
ON orders((YEAR(orderDate)));
```

---
- Някои **СУБД** не поддържат функционални индекси
- В този случай можем да имплементираме функционален индекс като създадем **генерирана** колона - резултат от функцията.
- Ние след ще индексираме генерираната колона.
---
```mysql
CREATE TABLE `orders` (
  `orderNumber` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `orderYear` INT AS (YEAR(`orderDate`)),
  `requiredDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `comments` text DEFAULT NULL,
  `customerNumber` int(11) NOT NULL,
  PRIMARY KEY (`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE INDEX idx_order_date ON orders(orderYear)
```
---
## Кардиналност

- Броят уникални стойности, съхранени в един индекс
- Колкото е по-висока кардиналността на един индекс, толкова е по-добър
- Използва се от базата данни, за определи дали да се използва индекса
---
## Показваме на индекси

- Ако искаме да видим индексите на една таблица ще използваме:
```mysql
SHOW INDEXES FROM table_name;
```
