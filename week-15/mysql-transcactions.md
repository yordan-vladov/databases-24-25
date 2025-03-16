# MySQL - Транзакции
---
## Съдържание

- Как работят MySQL транзакции.
- Настройки на транзакциите.
---
### MySQL - Транзакция

```mysql
START TRANSACTION;
-- queries
COMMIT;
```
---
### Отменяне на транзакция

```mysql
START TRANSACTION;
-- queries
ROLLBACK;
```
---
```mysql
DROP DATABASE IF EXISTS customer_db;
CREATE DATABASE customer_db;
USE customer_db;
CREATE TABLE customers (a INT, b CHAR (20), INDEX (a));
START TRANSACTION;
INSERT INTO customers VALUES (10,'Ivan');
COMMIT;

SELECT * FROM customers;

START TRANSACTION;
INSERT INTO customers VALUES (15, 'John');
INSERT INTO customers VALUES (20, 'Paul');
DELETE FROM customers WHERE b = 'Ivan';
-- Now we undo those last 2 inserts and the delete.
ROLLBACK;

SELECT * FROM customers;
```
---
### Автоматично записване

- По подразбиране всяка успешна операция се записва в базата данни.
- Това се определя от променливата `autocommit`.
---
```mysql
/*Disabling the auto-commit  */
SET autocommit = 0;
/* OR */
SET autocommit = OFF;

/* Enabling the operations to automatically commit every operation*/
SET autocommit = 1;
/* OR */
SET autocommit = ON
```
---
### Изолация

- Можем да зададем нивото на изолация в нашият MySQL сървър. То определя как транзакциите могат да си взаимодействат.
```mysql
SELECT @transaction_isolation;
```
---
- Можем да зададем следните нива на изолация:
    - `READ UNCOMMITTED`
    - `READ COMMITTED`
    - `REPEATABLE READ` (default)
    - `SERIALIZABLE`
---
#### READ UNCOMMITTED

- Най-ниското ниво на изолация. Транзакция може да чете незаписани данни.
- Допускат се **Dirty Read**, **Phantom Read** и **Non-repeatable read**.
---
#### READ COMMITED

- Могат да се четат само записани данни. Съществуващи данни могат да се променят.
- Предотвратява се **DR**, но все още се допускат **PR** и **NR**.
---
#### REPEATABLE READ

- Могат да се четат само записани данни. Данни, които се четат, не могат да се променят от други транзакции.
- Предотвратяват се **DR** и **NR**, но все още се допуска **PR**.
---
#### SERIALIZABLE

- Могат да се четат само записани данни.
- Други транзакции не могат:
    - да променят данни, които се четат.
    - да добавят нови данни, които биха се прочели.
- Предотвратява **DR**, **NR** и **PR**.
---

| Изолация        | Dirty Read | NR Read | Phantom Read |
| --------------- | ---------- | ------- | ------------ |
| Read Uncommited | x          | x       | x            |
| Read Commited   | √          | x       | x            |
| Repeatable read | √          | √       | x            |
| Serializable    | √          | √       | √            |

---
#### Задаване на ниво на изолация

 ```mysql
-- next transaction
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- transactions in current session
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- all transactions
SET GLOBAL TRANSACTION ISOLATION LEVEL READ COMMITTED;
```

---
### Savepoint

- Позволява ни да се върнем към конкретна точка в транзакция.
```mysql
SAVEPOINT identifier
```
---
### Savepoint - Пример

```mysql
DROP DATABASE IF EXISTS EMP_DB;
CREATE DATABASE EMP_DB;
USE EMP_DB;

SET autocommit=0;

CREATE TABLE EMP(
   FIRST_NAME CHAR(20) NOT NULL,
   LAST_NAME CHAR(20),
   AGE INT,
   SEX CHAR(1),
   INCOME FLOAT);

INSERT INTO EMP VALUES
('Krishna', 'Sharma', 19, 'M', 2000),
('Raj', 'Kandukuri', 20, 'M', 7000),
('Ramya', 'Ramapriya', 25, 'F', 5000);

START TRANSACTION;

SELECT * FROM EMP;
UPDATE EMP SET AGE = AGE + 1;

SAVEPOINT samplesavepoint;

INSERT INTO EMP VALUES ('Mac', 'Mohan', 26, 'M', 2000);

ROLLBACK TO SAVEPOINT samplesavepoint;
COMMIT;
```
