# Съединения

---

# Преговор

---

![](/Attachments/Databases_Joins_Pic_1.png)

---

![](/Attachments/Databases_Joins_Pic_2.png)

---
- Намалете средният успех на всички ученици
- Изтрийте учениците със среден успех под 2.00
---
## Какво е съединение?

- Заявка, която ни позволява да съединим редовете на две или повече таблици на база някоя съвпадаща колона (често външен ключ)
- Позволява ни достъп до информация от повече от една таблица в една заявка
---
## Пример

![](/Attachments/Databases_Joins_Pic_3.png)

---
## Съединения - Синтаксис

```sql
SELECT <columns>
FROM <table-1> JOIN <table-2> ON <join-pred> ...
```
---
```sql
SELECT t.name, c.number, c.number_of_students students FROM teachers t
JOIN classes c ON t.id = c.leader_id;
```
---
## Съединение между три таблици

- Съединение, при което извличаме информация между три таблици
- Често се използва при релации 'Много-Към-Много'
---

## Пример

![](/Attachments/Databases_Joins_Pic_4.png)

---
```sql
SELECT t.name, s.name, s.type FROM subjects s JOIN subjects_teachers st
ON s.id = st.subject_id JOIN teachers t ON t.id = st.teacher_id;
```

---
## Съединение с филтър

```sql
SELECT <columns>
FROM <table-1> JOIN <table-2> ON <join-pred> ...
WHERE <cond>;
```

---
## Примери

 - Имената на всички преподаватели, които водят 'Бази Данни'
 - Класът на Иванка Манчева
 - Всички ученици, на които е класен ръководител Краси Илиев
---

```sql
SELECT t.name, s.name, s.type FROM subjects s JOIN subjects_teachers st
ON s.id = st.subject_id JOIN teachers t ON t.id = st.teacher_id
WHERE s.name = "Бази Данни";
```
---
```sql
SELECT c.number FROM teachers t JOIN classes c
ON c.leader_id = t.id;
```
---
```sql
SELECT s.name FROM teachers t JOIN classes c
ON c.leader_id = t.id
JOIN students s ON s.class_number = c.number
WHERE t.name = "Красимир Илиев";
```
---
## Видове съединения

- **INNER JOIN**
- **LEFT JOIN**
- **RIGHT JOIN**
- **ДРУГИ**
---
## INNER JOIN

- Избираме редове, които имат съвпадащи стойности в двете таблици
- Примерите, които разглеждахме досега
---
![](/Attachments/Databases_Joins_Pic_5.png)

---
## LEFT \[OUTER] JOIN

- Извеждаме всички редове от лявата таблица и съвпадащите редове от дясната таблица. Където няма съвпадение, се записва `null`
---
![](/Attachments/Databases_Joins_Pic_6.png)

---

![](/Attachments/Databases_Joins_Pic_7.png)

---

```mysql
SELECT t.name, c.number class FROM teachers t LEFT JOIN classes c
ON t.id = c.leader_id;
```

---
## RIGHT \[OUTER] JOIN

- Извеждаме всички редове от дясната таблица и съвпадащите редове от лявата таблица. Където няма съвпадение, се записва `null`

---
![](/Attachments/Databases_Joins_Pic_8.png)

---
![](/Attachments/Databases_Joins_Pic_9.png)

---
```mysql
SELECT t.name, c.number class FROM  classes c RIGHT JOIN teachers t
ON t.id = c.leader_id;
```
---
## UNION \[ALL]

- Позволява ни да комбинираме изхода от няколко **SELECT** заявки, като:
    - заявките трябва да имат еднакъв брой колони
    - колоните трябва да имат подобни типове
    - колоните трябва да са един и същи ред
---
## UNION - Синтаксис

- Премахва повторения
```sql
SELECT <column-list> FROM <table1>
UNION
SELECT <column-list> FROM <table2>;
```

---
## UNION ALL- Синтаксис

- Запазва повторения
```sql
SELECT <column-list> FROM <table1>
UNION ALL
SELECT <column-list> FROM <table2>;
```

---
## UNION - Пример

- Имената и имейлите на всичките потребители на системата (учители и ученици).

---

```sql
SELECT name, email FROM teachers
UNION
SELECT name, email FROM students;
```

---
## FULL \[OUTER] JOIN

- Извеждаме всички редове от двете таблица и допълва съвпадения. Където няма съвпадение, се записва `null`

---
![](/Attachments/Databases_Joins_Pic_10.png)

---

![](/Attachments/Databases_Joins_Pic_11.png)

---
```mysql
SELECT t.name, c.number class FROM teachers t LEFT JOIN classes c
ON t.id = c.leader_id;
UNION
SELECT t.name, c.number class FROM teachers t RIGHT JOIN classes c
ON t.id = c.leader_id;
```
---
## Задание

- Изведете информация кои учители какви предмети водят. Изходът да включва учители, които не водят предмети и предмети без учители.
---
