# Нормализация на базата данни

---
## Какво е нормализация?

- Намаляване на припокриването и подобряване на интегритетът на данните.
- Организираме колоните и таблиците по такъв начин, че зависимостите да могат да се спазват.
- Може да се приложи при синтезиране (създаване) или декомпозиция (подобряване) на база данни.
---
## Цели

1. Да премахне аномалии при добавяне, ъпдейтване и триене на данни.
2. Да минимизира реструктурирането на съществуващи таблици при разширяване на базата данни.
---
3. Да направи базата данни по-информативна за потребителите.
4. Да направи базата данни независима от заявките към нея.
---
## Аномалии

- Когато е направен опит да се модифицира (добавяне, ъпдейтване, триене) дадена релация, която не е нормализирана, може да има следните странични ефекти:
---
## Аномалия при добавяне

- Не можем да добавим ред поради липсващи данни.
---
![](/Attachments/DB_Normalization_Pic_1.png)

---
## Аномалия при ъпдейтване

- Ако едни и същи данни се повтарят, ъпдейтването на данните може да доведе до несъответствия.
---

![](/Attachments/DB_Normalization_Pic_2.png)

---
## Аномалия при триенето

- Триенето на едни данни неволно води до триенето триенето на други, напълно различни данни.
---

![](/Attachments/DB_Normalization_Pic_3.png)

---

# Нормални форми

---
## Първа нормална форма

- Една релация е в първа нормална форма ако всички нейни атрибути са от област, която съдържа само една стойност.
---
- Релация не може да има атрибут:
    - друга таблица
    - списък от елементи
    - обект
---
## 1NF - Предимства:

- Данните могат да се представят чрез прости двумерни масиви.
- Всяка данна може да се идентицира чрез таблица, ключ и име на атрибута.
- Могат да се представят различни взаимодействия (one-to-one, one-to-many, many-to-many).
---

- Базата данни по-лесно може да се разширява.
- Служи като база за следващите нормални форми.
---
## 1NF - Недостатъци:

- Определени операции са по-скъпи.
- Неудобство при взаимодействие с йерархични технологии (напр. OOP езици).
- Може да лимитира използването на комплексни типове.
---
## Втора нормална форма

- Една релация е във втора нормална форма ако:
    - е в първа нормална форма.
    - не съдържа вторичен атрибут, който да е зависим от което и да е истинско подмножество на ключовете на релацията.
---
- \*вторичен атрибут - атрибут, който не участва в никой ключ
---
## 2NF - Пример:

***StudentProject***

| **StudentID** | **ProjectNo** | **StudentName** | **ProjectName**     |
| ------------- | ------------- | --------------- | ------------------- |
| S01           | 199           | Katie           | Geo Location        |
| S02           | 120           | Ollie           | Cluster Exploration |

---
## 2NF - Решение:

***StudentInfo***

| **StudentID** | **StudentName** |
| ------------- | --------------- |
| S01           | Katie           |
| S02           | Ollie           |

---

***ProjectInfo***

| **ProjectNo** | **ProjectName**     |
| ------------- | ------------------- |
| 199           | Geo Location        |
| 120           | Cluster Exploration |

---

***StudentProject***

| **ProjectNo** | **StudentID** |
| ------------- | ------------- |
| 199           | S01           |
| 120           | S02           |

---
## Трета нормална форма

- Една релация е в трета нормална форма ако:
    - е във втора нормална форма.
    - не съдържа вторични атрибути, които да са транзитивно зависими от главният ключ.
---
- Транзитивна зависимост, в която X -> Z индиректно, понеже X -> Y и Y -> Z.
---
## 3NF - Пример

***Tournament Winners***

| Tournament           | Year | Winner         | Winner's date of birth |
| -------------------- | ---- | -------------- | ---------------------- |
| Indiana Invitational | 1998 | Al Fredrickson | 21 July 1975           |
| Cleveland Open       | 1999 | Bob Albertson  | 28 September 1968      |

---
- Главният ключ е **(Tournament, Year).**
- **Winner's date of birth** зависи от **Winner**, който зависи от **(Tournament, Year)**.
---
## 3NF - Решение

***Tournament Winners***

| Tournament           | Year | Winner         |
| -------------------- | ---- | -------------- |
| Indiana Invitational | 1998 | Al Fredrickson |
| Cleveland Open       | 1999 | Bob Albertson  |

---

***Winner's dates of birth***

| Winner         | Date of birth     |
| -------------- | ----------------- |
| Al Fredrickson | 21 July 1975      |
| Bob Albertson  | 28 September 1968 |

---
## Нормализация - Предимства

1. Актуализациите се изпълняват бързо.
2. Вмъкванията се изпълняват бързо.
3. Таблиците обикновено са по-малки.
4. Цялост и последователност на данните.
---
## Нормализация - Недостатъци

1. Необходими са съединения на таблици.
2. Индексирането не толкова ефективно.

---
# Нормализация - Пример
