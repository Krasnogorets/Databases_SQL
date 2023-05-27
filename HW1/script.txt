-- Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными.
CREATE DATABASE IF NOT EXISTS HW1;
USE HW1;
DROP TABLE IF EXISTS mob_phones;
CREATE TABLE mob_phones
(
id INT PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR(46),
Manufacture VARCHAR(46),
ProductCount INT(2),
Price INT(5)
);
INSERT mob_phones (ProductName,Manufacture,ProductCount,Price)
VALUES
	('iphone X','Apple',3,76000),
    ('iphone 8','Apple',2,51000),
     ('Galaxy S9','Samsung',2,56000),
     ('Galaxy S8','Samsung',1,41000),
     ('P20 pro','Huawei',5,36000);
SELECT * FROM mob_phones;
-- Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacture, Price 
FROM mob_phones
WHERE ProductCount >2;
-- Выведите весь ассортимент товаров марки “Samsung”
SELECT ProductName, Price
FROM mob_phones
WHERE Manufacture = 'Samsung';
-- Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000
SELECT ProductName 
FROM mob_phones
WHERE (ProductCount*Price) >100000 AND (ProductCount*Price) <145000;
--  С помощью регулярных выражений найти Товары, в которых есть упоминание "Iphone"
SELECT ProductName
FROM mob_phones
WHERE ProductName LIKE '%Iphone%';
--  С помощью регулярных выражений найти Товары, в которых есть упоминание "Galaxy"
SELECT ProductName
FROM mob_phones
WHERE ProductName LIKE '%Galaxy%';
--  С помощью регулярных выражений найти Товары,  в которых есть ЦИФРЫ
SELECT ProductName
FROM mob_phones
WHERE ProductName RLIKE '[0-9]';
--  С помощью регулярных выражений найти Товары,  в которых есть ЦИФРА 8
SELECT ProductName
FROM mob_phones
WHERE ProductName RLIKE '[8]';