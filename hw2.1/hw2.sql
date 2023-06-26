-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE DATABASE IF NOT EXISTS HW21;
USE HW21;
DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
bucket INT(4)
);

INSERT INTO sales ( order_date, bucket)
VALUES 
("2022-01-01",156),
("2022-01-02",180),
("2022-01-03",21),
("2022-01-04",124),
("2022-01-05",341);
/* Для данных таблицы “sales” укажите тип 
заказа в зависимости от кол-ва : 
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ */
SELECT * FROM sales;
SELECT 
id AS "id заказа", order_date, bucket,
CASE
WHEN bucket < 100
THEN "Маленький заказ"
WHEN bucket BETWEEN 100 AND 300
THEN "Средний заказ"
ELSE "Большой заказ"
END AS "Тип заказа"
FROM sales;

-- Создайте таблицу “orders”, заполните ее значениями
DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
order_id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(4),
amount DECIMAL(6,2),
order_status VARCHAR(10));

INSERT INTO orders (employee_id, amount, order_status)
VALUES 
('e03',15.00,'OPEN'),
('e01',25.50,'OPEN'),
('e05',100.70,'CLOSED'),
('e02',22.18,'OPEN'),
('e04',9.50,'CANCELLED'),
('e04',99.99,'OPEN');

SELECT * FROM orders;
/*Покажите “полный” статус заказа, используя оператор CASE:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled*/

SELECT
order_id,
order_status,
CASE
WHEN order_status = 'OPEN'
THEN "Order is in open state"
WHEN order_status = 'CLOSED'
THEN "Order is closed"
WHEN order_status = 'CANCELLED'
THEN "Order is cancelled"
END AS "order_status"
FROM orders;