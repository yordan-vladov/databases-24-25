# Потребители
---
## Съдържание

- Какво са потребители в MySQL?
- Създаване на потребители.
- Даване на привилегии.
---
## Какво е потребител?

- Акаунт, който има достъп до MySQL сървър.
- Чрез потребители ние можем да администрираме пряката работа с базите данни.
---
- Всеки сървър има **root** потребител, който има достъп до всички бази данни.
- Не е добра идея всеки да работи със сървъра чрез **root**.
- Правим връзка чрез потребител, който има само нужните привилегии.
---
### Създаване на потребител

```mysql
CREATE USER [IF NOT EXISTS] account_name
IDENTIFIED BY 'password';
```
---
### Потребителско име

```bash
username@hostname # важи само се прави връзка от специфичен адрес
username@% # може да прави връзка от всеки адрес
```
---
### Потребител - Пример

- Създаваме потребител `bob`, който може да прави връзка само от `localhost` с парола `1234`.
---

```mysql
CREATE USER bob@localhost
IDENTIFIED BY '1234';
```
---
### Показване на потребители

```mysql
SELECT
  user
FROM
  mysql.user;
```
---
### Правене на връзка

- Ако искаме да направим връзка като конкретен потребител може да използваме конзолата:
```bash
mysql -u bob -p
```
---
- Друг вариант е да настроим нова връзка в **MySQL Workbench**
![](/Attachments/DB-Users-Pic-1.png)
---
###  Задаване на привилегии

- По подразбиране създаден потребител не може да прави нищо с базите данни от сървъра.
- Той трябва да бъде даден привилегии, за да може да изпълнява определено действие.
---
```mysql
GRANT <PRIVILEGE>
ON <DATABASE-NAME>.<TABLE-NAME>
TO <user> [WITH GRANT OPTION];
```
---
###  Привилегии - Пример

- Създаваме база данни `bobdb` и даваме на `bob` пълни права върху нея.
- Трябва да го направим като **root** или като потребител, притежаващ нужните привилегии.
---
```mysql
CREATE DATABASE bobdb;
GRANT ALL ON bobdb.* TO bob@localhost;
```
---
### Привилегии - Нива

![](/Attachments/DB-Users-Pic-2.png)

---
### Глобални привилегии

- Прилагат се върху всички бази данни в сървъра. Отбелязват се чрез `*.*`.
```mysql
GRANT SELECT
ON *.*
TO bob@localhost;
```
---
### Привилегии върху база данни

- Прилагат се върху всички обекти от база данни. Отбелязват се чрез `database_name.*`.
```mysql
GRANT INSERT
ON classicmodels.*
TO bob@localhost;
```
---
### Привилегии върху таблица

 Прилагат се върху всички колони от таблица. Отбелязват се чрез `database_name.table_name`.
```mysql
GRANT DELETE
ON classicmodels.employees
TO bob@localhsot;
```
---
### Привилегии върху колони

- Прилагат се върху определени колони от таблица.
```mysql
GRANT
   SELECT (employeeNumner,lastName, firstName,email),
   UPDATE(lastName)
ON employees
TO bob@localhost;
```
---
### Привилегии върху процедури

- Прилагат се върху запазени процедури и функции.
```mysql
GRANT EXECUTE
ON PROCEDURE CheckCredit
TO bob@localhost;
```
---
### Прокси привилегии

-  Позволяват на един потребител да има всичките права на друг потребител.
```mysql
GRANT PROXY
ON root
TO alice@localhost;
```
---
### Показване на привилегии

```mysql
SHOW GRANTS FOR user;
```
---
### Отнемане на права

- Използваме ключовата дума `REVOKE`.
```mysql
REVOKE privilegee [,privilege]..
ON [object_type] privilege_level
FROM user1 [, user2] ..;
```
---
### Отнемане на всички права

```mysql
REVOKE
    ALL [PRIVILEGES],
    GRANT OPTION
FROM user1 [, user2];
```
---
### Отнемане на прокси

```mysql
REVOKE PROXY
ON proxied_user
FROM proxy_user1[,proxy_user1]...;
```
---
### Пример за отнемане на права

```mysql

-- създаваме нов потребител

CREATE USER rfc@localhost
IDENTIFIED BY 'Secret1Pass!';

-- даваме му права върху таблицата 'classicmodels'

GRANT SELECT, UPDATE, INSERT
ON classicmodels.*
TO rfc@localhost;

-- показваме му правата

SHOW GRANTS FOR rfc@localhost;

-- отнемаме му правата

REVOKE INSERT, UPDATE
ON classicmodels.*
FROM rfc@localhost;

-- показваме му правата отново

SHOW GRANTS FOR rfc@localhost;
```
---
## Изтриване на потребител

```mysql
DROP USER [IF EXISTS] user [, user] ...
```
