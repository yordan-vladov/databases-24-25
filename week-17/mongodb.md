# MongoDB
![](/Attachments/DB-MongoDB-1.png)

---
## Съдържание

- Какво е MongoDB?
- Инсталиране/Конфигурация.
- Използване на MongoDB.
- Основи на MongoDB.
---
## Какво е MongoDB?

- NoSQL база данни.
- Документно базирана.
- Използва BSON (Binary JSON) формат.
---
![](/Attachments/DB-MongoDB-2.png)

---
## Инсталиране на MongoDB

- Ако искаме да работим с MongoDB, има два основни начина:
    1. Да създадем [Atlas Cluster](https://www.mongodb.com/docs/atlas/)
    2. Да създадем [localhost БД](https://www.prisma.io/dataguide/mongodb/setting-up-a-local-mongodb-database#setting-up-mongodb-on-linux)
---
- Прост начин да инсталираме MongoDB на всяка ОС е чрез Docker:
```bash
docker pull mongo
docker run -d \
  --name mongodb \
  -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=secret \
  mongo
```
---
## Използване на MongoDB

- Ако искаме да използваме MongoDB пряко, можем да използваме:
    1. `mongosh` - CLI
    2. MongoDB Compass - GUI
---
### mongosh

- Mongo shell - CLI приложение, чрез което правим връзка към MongoDB инстанция.
```bash
mongosh # връзка към локална БД
mongosh "mongodb://admin:secret@localhost:27017" # връзка към локална БД като определен потребител
mongosh "mongodb+srv://myUser:myPassword@cluster0.abcd.mongodb.net/myDatabase" # връзка към дистанционна БД
docker exec -it mongodb mongosh -u admin -p secret
```
---
## MongoDB Compass

- Графично приложение, което ни позволява на работим с различни MongoDB бази данни.
![](/Attachments/DB-MongoDB-3.png)
---
## MongoDB - Структура

- Документи.
- Колекции.
- Бази Данни.
---
### Документи

- Основна единица данни в MongoDB.
- Подобни на JSON обекти.
- **Пример:** Потребител с име, възраст и адрес.
---
```json
{
  "_id": ObjectId("5099803df3f4948bd2f98391"),
  "name": "John Doe",
  "age": 30,
  "address": {
    "street": "123 Main St",
    "city": "Springfield"
  }
}
```
---
### Колекции

- Група от документи, подобно на таблици.
- За разлика от таблицата, колекциите нямат наложена схема, т.е различните документи могат да имат различни полета.
- **Пример:** Различни видове потребители
---
```json
{
  "_id": ObjectId("507f191e810c19729de860ea"),
  "name": "Alice Smith",
  "email": "alice@example.com",
  "age": 28,
  "address": {
    "street": "123 Main St",
    "city": "New York",
    "zip": "10001"
  },
  "isActive": true
}
```
---
```json
{
  "_id": ObjectId("507f1f77bcf86cd799439011"),
  "username": "bob_developer",
  "email": "bob@example.com",
  "joinedAt": ISODate("2023-01-15T10:00:00Z"),
  "skills": ["JavaScript", "MongoDB", "Node.js"],
  "socialMedia": {
    "twitter": "@bobdev",
    "github": "bobcoder"
  }
}
```
---
## Бази Данни

- Контейнер за колекции.
```js
use DB_Name
```
---
## Основни Операции

- **Create**: `insertOne()`, `insertMany()`
- **Read**: `find()`, `findOne()`
- **Update**: `updateOne()`, `updateMany()`
- **Delete**: `deleteOne()`, `deleteMany()`
---
Общият синтаксис за изпълняване на команда:
```js
db.collection.operation(args)
```
---
## Създаване

- Използваме операции като `insertOne()` и `insertMany()`.
- Пример: Имаме база данни `bookstore` с колекция `books`. Искаме да вкараме три книги с информация за заглавие, автор, година на издаване и жанр.
---
```js
use bookstore
db.books.insertMany([
  {
    title: "Frankenstein",
    author: "Mary Shelley",
    year: 1818,
    genre: "Gothic fiction",
    link: "https://gutenberg.org/ebooks/84"
  },
  {
    title: "A Game of Thrones",
    author: "George R.R. Martin",
    year: 1996,
    genre: "Fantasy",
    sales: 90_000_000
  },
  {
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    year: 1937,
    genre: "Fantasy"
  }
])
```
---
## Четене

- Използваме операции като `find()`, `findOne()`, като им прилагаме филтри.
- **Пример:** Изведете всичките книги от колекцията. След това изведете само книгите с жанр "Fantasy".
---
```js
db.books.find()
db.books.find({genre: "Fantasy"})
```
---
## Актуализиране

- Използваме операции като `updateOne()`, `updateMany()`, като им прилагаме филтри за намиране и оператори за актуализиране.
- **Пример:** Променете годината на издаване на определена книга в колекцията. Добавете ново поле към определена книга, като например "издател".
---
```js
db.books.updateOne(
  { title: "The Hobbit" },
  { $set: { year: 1938 } }
)
db.books.updateOne(
  { title: "Frankenstein" },
  { $set: { publisher: "Lackington, Hughes, Harding, Mavor & Jones" } }
)
```
---
## Триене

- Използваме операции като `deleteOne()`, `deleteMany()`, като им прилагаме филтри.
- Изтрийте книгата "Frankenstein". Изтрийте книгите от 1990.
---
```js
db.books.deleteOne({ title: "Frankenstein" })
db.books.deleteMany({ year: 1990 })
```
---
## Сложни заявки
---
### Примерна база данни

- Съществуват много примерни MongoDB бази данни, с които да се упражняваме.
- Един популярен избор е `sample_mflix`, която съдържа данни за филми, кина и др.
---
- Примерен документ за филм:
```json
{
  "_id": {
    "$oid": "573a1390f29313caabcd413b"
  },
  "title": "The Arrival of a Train",
  "year": {
    "$numberInt": "1896"
  },
  "runtime": {
    "$numberInt": "1"
  },
  "released": {
    "$date": {
      "$numberLong": "-2335219200000"
    }
  },
  "poster": "http://ia.media-imdb.com/images/M/MV5BMjEyNDk5MDYzOV5BMl5BanBnXkFtZTgwNjIxMTEwMzE@._V1_SX300.jpg",
  "plot": "A group of people are standing in a straight line along the
    platform of a railway station, waiting for a train, which is seen
    coming at some distance. When the train stops at the platform, ...",
  "fullplot": "A group of people are standing in a straight line along
    the platform of a railway station, waiting for a train, which is
    seen coming at some distance. When the train stops at the platform,
    the line dissolves. The doors of the railway-cars open, and people
    on the platform help passengers to get off.",
  "lastupdated": "2015-08-15 00:02:53.443000000",
  "type": "movie",
  "directors": [
    "Auguste Lumière",
    "Louis Lumière"
  ],
  "imdb": {
    "rating": {
      "$numberDouble": "7.3"
    },
    "votes": {
      "$numberInt": "5043"
    },
    "id": {
      "$numberInt": "12"
    }
  },
  "cast": [
    "Madeleine Koehler"
  ],
  "countries": [
    "France"
  ],
  "genres": [
    "Documentary",
    "Short"
  ],
  "tomatoes": {
    "viewer": {
      "rating": {
        "$numberDouble": "3.7"
      },
      "numReviews": {
        "$numberInt": "59"
      }
    },
    "lastUpdated": {
      "$date": {
        "$numberLong": "1441993589000"
      }
    }
  },
  "num_mflix_comments": {
    "$numberInt": "1"
  }
}
```
---
## Оператори за сравнение

- При MongoDB операторите са сравнение не се изразяват чрез математически символи, а чрез специални ключови думи.
- **Пример:** Намерете всички филми, по-дълги от 120 минути.
---
- Операторът за "по-голямо" е `gt`:
```js
db.movies.find({ runtime: { $gt: 120 } })
```
---

| Оператор | Значение |
| -------- | -------- |
| `$eq`    | =        |
| `$ne`    | !=       |
| `$gt`    | >        |

---

| Оператор | Значение |
| -------- | -------- |
| `$gte`   | >=       |
| `$lt`    | <        |
| `$lte`   | <=       |

---
- **Задачи:** Намерете:
    - Филми, издадени през 1995.
    - Филми, които не са от тип "movie".
    - Филми с IMDb рейтинг под 5.0.
---
## Търсене с няколко условия (AND)

- Ако искаме да намерим документи, които спазват повече от едно условие, просто трябва да ги добавим в заявката.
---

- **Пример:** Всички филми, пуснати след 2000 година
```js
db.movies.find({type:"movie",year: {$gt:2000}})
```
---
- **Задача:** Всички серии под 50 минути
---
## Търсене с няколко условия (OR)

- Ако искаме да намерим документи, които спазват поне едно от дадени условия, можем да използваме операторът `$or`.
---
**Пример:** Всички филми, които имат награда или имат imdb рейтинг над 8.0

```js
db.movies.find({$or:[{'awards.wins':{$gt:0}},{'imdb.rating':{$gt:8}}]})
```
---

- **Задача:** Всички филми, които имат над 1000 гласа от 'imdb' или над 100 потребителски ревюта от 'tomatoes'.

---
- Ако искаме намерим документи, които поле със стойност, която се намира в определен списък, ще използваме операторът `$in`
---

- **Пример:** Всички филми, които имат рейтинг 'G' или 'TV-G'

```js
db.movies.find({rated:{$in:['G','TV-G']}})
```
---
**Задача:** Всички кина в Алабама и Тексас

---
## Търсене със списъци

- Ако документ има атрибути, които са списъци, има няколко начина да ги филтрираме.
---
### Съдържане на елемент

- Ако искаме да проверим дали списък съдържа даден елемент, ще го запишем в заявката във формат '{списък:елемент}', все едно че проверяваме за дадена стойност.
---

- **Пример:** Всички филми, в които участва 'Buster Keaton'

```js
db.movies.find({cast: "Buster Keaton"})
```
---

- **Задача:** Всички филми, които са на английски

---
### Съдържане на подмасив

- Ако искаме да проверим дали един масив съдържа всички елементи на друг масив, можем да използваме оператора `$all`
---
- **Пример:** Всички романтични комедии

```js
db.movies.find({genres:{$all:['Romance','Comedy']}})
```
---

- **Задача:** Всички филми, в които участват 'Buster Keaton' и 'Kathryn McGuire'
---
### Проверка на елементите на масива

- Ако искаме да видим дали масив съдържа елемент от дадена група, можем да използваме `$in`
---

- **Пример:** Всички филми, които са романтики, комедии или и двете

```js
db.movies.find({genres:{$in:["Romance","Comedy"]}})
```
---

- **Задача:** Всички филми, които са написани от 'Buster Keaton' или 'Charles Chaplin'
---
# Агрегационна рамка

---

## Тръбопроводи

 - Документите от колекция преминават през тръбопровод за агрегиране, който трансформира тези обекти, докато преминават.

---

## Изрази

- Изразите създават изходни документи въз основа на изчисления, извършени върху входни документи. Рамката за агрегиране дефинира изрази, използвайки префиксен формат на документ.

---

# Употреба

---
## Филтрираме на елементи

- Преди да използваме приложим дадена агрегация можем да искаме първо да приложим даден филтър. Затова първо ще използваме оператора `$match`
---
- **Пример:** Всички английски филми

```js
db.movies.aggregate(
  {$match: {languages:'English'}}
)
```
---
## Проектиране на елементи

- Ако искаме да трансформираме намерените елементи по някакъв начин ще използваме оператора `$project`

---

- **Пример:** Всички английски филми със заглавие и imdb рейтинг

```js
db.movies.aggregate(
  {$match: {languages:'English'}},
  {$project: {title:1,imdbRating: '$imdb.rating'}}
)
```
---
## Групиране на елементи

- Ако искаме да групираме документите по дадени полета, използваме оператора `$group`

---

- **Пример:** Броят филми и средният им рейтинг от всяка година

```js
db.movies.aggregate({
$group: {
	_id: "$year",
	numberOfFilms: {$sum: 1},
	avgRating: {$avg: "$imdb.rating"}}
})
```

---
## Сортиране и ограничаване

- При сортиране използваме оператора `$sort`
---

- **Пример:** Филмите сортирани по години

```js
// ascending
db.movies.aggregate({$sort:{year:1}})

// descending
db.movies.aggregate({$sort:{year:-1}})
```

---
- Ако искаме да ограничим изхода ще използваме `$limit`
---

- **Пример:** Топ 5 най-награждавани филми

```js
db.movies.aggregate({$sort:{'awards.wins':-1}},{$limit:5})
```

---

- **Пример:** Топ 5 филми с най-висок рейтинг

```js
db.movies.aggregate({$sort:{'imdb.rating':-1}},{$limit:5})
```
