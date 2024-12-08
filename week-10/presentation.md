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
