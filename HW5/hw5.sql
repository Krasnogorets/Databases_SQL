CREATE DATABASE IF NOT EXISTS hw5;
USE hw5;
DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR(45),
    cost DECIMAL(8,0)
);

INSERT cars (brand, cost)
VALUES
  ('Audi',  52642),
  ('Mercedes',  57127),
  ('Skoda', 9000),
  ('Volvo',  29000),
  ('Bentley',  35000),
  ('Citroen',  21000),
  ('Hummer',  41400),
  ('Volkswagen',  21600);
  
SELECT * from cars;

-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE OR REPLACE VIEW cheap_cars 
AS
SELECT
brand,
cost
FROM cars
WHERE cost < 25000
ORDER BY cost;
SELECT * FROM cheap_cars;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW cheap_cars AS
SELECT
brand,
cost
FROM cars
WHERE cost < 30000
ORDER BY cost;
SELECT * FROM cheap_cars;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE OR REPLACE VIEW VAG_cars 
AS
SELECT
brand,
cost
FROM cars
WHERE brand = "Audi" OR brand = "Skoda";
SELECT * FROM VAG_cars;

/* Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. 
Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.*/

DROP TABLE IF EXISTS train;
CREATE TABLE train
(
	train_id INT,
    station VARCHAR(20),
    station_time TIME
);
INSERT train (train_id, station, station_time)
VALUES
  (110,'San Francisco',  "10:00:00"),
  (110,'Redwood City',  "10:54:00"),
  (110,'Palo Alto',  "11:02:00"),
  (110,'San Jose',  "12:35:00"),
    (120,'San Francisco',  "11:00:00"),
     (120,'Palo Alto',  "12:49:00"),
     (120,'San Jose',  "13:30:00");
     
SELECT * FROM train;  

SELECT
train_id, 
station, 
station_time,
timediff(LEAD(station_time) OVER(PARTITION BY train_id ),station_time) AS  time_to_next_station
FROM train;
