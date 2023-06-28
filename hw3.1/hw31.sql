CREATE DATABASE IF NOT EXISTS hw31;
USE hw31;
DROP TABLE IF EXISTS salespeople;
CREATE TABLE salespeople
(
	snum INT PRIMARY KEY,
    sname VARCHAR(45),
	city VARCHAR(45)
  
);
INSERT salespeople (snum, sname, city)
VALUES
  (1001, 'Peel', 'London'),
  (1002, 'Serres', 'Sant Jose'),
  (1004, 'Motika', 'London'),
  (1007, 'Rifkin', 'Barcelona'),
  (1003, 'Axelrod', 'New York');
DROP TABLE IF EXISTS customers;
CREATE TABLE customers
(
	cnum INT PRIMARY KEY,
    cname VARCHAR(45),
	city VARCHAR(45),
    rating INT,
	snum INT
); 
INSERT customers (cnum, cname, city,rating,snum)
VALUES
  (2001, 'Hoffman', 'London',100,1001),
  (2002, 'Giovanni', 'Rome',200,1003),
  (2003, 'Liu', 'Sant Jose',200,1002),
  (2004, 'Grass', 'Berlin',300,1002),
  (2006, 'Clemens', 'London',100,1001),
  (2008, 'Cisneros', 'Sant Jose',300,1007),
  (2007, 'Pereira', 'Rome',100,1004);
DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	onum INT PRIMARY KEY,
    amt DECIMAL(7,2),
	odate DATE,
    cnum INT,
	snum INT
); 
INSERT orders (onum, amt, odate, cnum, snum)
VALUES
  (3001, 18.69,'1990-10-03',2008,1007),
  (3003, 767.19,'1990-10-03',2001,1001),
  (3002, 1900.10,'1990-10-03',2007,1004),
  (3005, 5160.45,'1990-10-03',2003,1002),
  (3006, 1098.16,'1990-10-03',2008,1007),
  (3009, 1713.23,'1990-10-04',2002,1003),
  (3007, 75.75,'1990-10-04',2004,1002),
  (3008, 4723.00,'1990-10-05',2006,1001),
  (3010, 1309.95,'1990-10-06',2004,1002),
  (3011, 9891.88,'1990-10-06',2006,1001);
  
  /* 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке:
  city, sname, snum, comm. (к первой или второй таблице, используя SELECT) */

  SELECT city, sname, snum
  FROM salespeople;
  
  /* 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую
  именем каждого заказчика в городе San Jose. (“заказчики”)
  */
SELECT cname, city, rating
FROM customers
WHERE city ='Sant Jose';

/*3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы 
заказов без каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”)
*/
SELECT DISTINCT snum
FROM salespeople;

/*Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
Используется оператор "LIKE": (“заказчики”)
*/
SELECT * FROM customers
WHERE cname LIKE "G%";

/* 5. Напишите запрос, который может дать вам все заказы со значениями суммы
 выше чем $1,000.(“Заказы”, “amt” - сумма)
*/

SELECT * FROM orders
WHERE amt >1000;

/*6. Напишите запрос который выбрал бы наименьшую сумму заказа.
(Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение
*/
SELECT MIN(amt) as min_order
FROM orders;

/* 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков,
 у которых рейтинг больше 100 и они находятся не в Риме.*/
SELECT * FROM customers
WHERE rating >100 AND city !='Rome';

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45),
	lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2),
    age INT
);

INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
  ('Вася', 'Васькин', 'Начальник', 40, 100000, 60),
  ('Петя', 'Петькин', 'Начальник', 8, 70000, 30),
  ('Катя', 'Катькина', 'Инженер', 2, 70000, 25),
  ('Саша', 'Сашкин', 'Инженер', 12, 50000, 35),
  ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
  ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
  ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
  ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
  ('Юрий', 'Юркин', 'Рабочий', 5, 15000, 25),
  ('Максим', 'Воронин', 'Рабочий', 2, 11000, 22),
  ('Юра', 'Галкин', 'Рабочий', 3, 12000, 24),
  ('Люся', 'Люськина', 'Уборщик', 10, 10000, 49);
  
 -- Отсортируйте поле “зарплата” в порядке убывания и возрастания 
SELECT * FROM staff
ORDER BY salary DESC;
 
SELECT * FROM staff
ORDER BY salary;
 

 
 /* 2. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с 
наибольшей заработной платой (возможен подзапрос)*/
SELECT * FROM staff
ORDER BY salary
LIMIT 7,5;

 /* Выполните группировку всех сотрудников по специальности , 
суммарная зарплата которых превышает 100000 */
-- такая формулировка на даст результата, тк. нет зп выше 100 000
-- делаю запрос вывести должности, при которой сумма зарплат по должности выше 100 000
SELECT 
	post AS post,
    SUM(salary) AS sum_post
    FROM staff
	GROUP BY post
    HAVING sum_post >100000;



