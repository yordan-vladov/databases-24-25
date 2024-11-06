# Контролно 1 - Подготовка

---
## Задание

- Дизайн на база данни:
    - Анализ на изискванията
    - Концептуален дизайн - ER Диаграма
    - Логически дизайн - SQL заявки
---
## Задание - Пример

- База данни за препоръки за готварски рецепти.
- Пази информация за рецепти, потребителски предпочитания, диетични ограничения, достъпност на съставки.

---
## Aнализ на изискванията

- Дефинираме какви релации трябва да имаме в системата и техните атрибути.
- В случая можем да включим релации за потребители, рецепти, съставки и категории
---
## Потребители

- id: int
- name: varchar(255)
- dob: date
---
## Рецепти

- id: int
- name: varchar(255)
- difficulty: enum('easy', 'medium', 'hard')

---
## Съставки

- id: int
- name: varchar(255)
- description: text
- calories: int
---
## Категории

- id: int
- name: varchar(255)
- is_allergen: bool
---
## Концептуален дизайн

- Създаваме ER Диаграма, в която моделираме дефинираните релации и връзките между тях.

---

![](/Attachments/DB_Test_1_Prep_Pic_1.png)

---
## Логически дизайн

- Пишем SQL заявки, чрез които да създадем в СУБД дефинираните релации/връзки.

---
```sql
CREATE DATABASE recipees;
USE recipees;
```
---
```sql
CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE NOT NULL
);
```
---
```sql
CREATE TABLE recipes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    difficulty ENUM('easy','medium','hard') NOT NULL
);
```
---
```sql
CREATE TABLE categories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    is_allergen BOOLEAN
);
```
---
```sql
CREATE TABLE ingedients(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    calories INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
```
---
```sql
CREATE TABLE allergies(
    user_id INT,
    category_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id),
    PRIMARY KEY (user_id,category_id)
);
```
---
```sql
CREATE TABLE recommendation(
    user_id INT,
    recipe_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    PRIMARY KEY (user_id,recipe_id)
);
```
---
```sql
CREATE TABLE likes(
    user_id INT,
    recipe_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    PRIMARY KEY (user_id,recipe_id)
);
```

---

```sql
CREATE recipes_ingredients(
	recipe_id INT,
	ingredient_id INT,
	unit VARCHAR(255) NOT NULL,
	quantity FLOAT NOT NULL,
	FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (ingredients_id) REFERENCES ingredient(id),
    PRIMARY KEY(recipe_id, ingredient_id)
);
```
