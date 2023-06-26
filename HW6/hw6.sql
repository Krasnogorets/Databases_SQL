-- Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP PROCEDURE IF EXISTS calc_time;
DELIMITER $$ 
CREATE PROCEDURE calc_time
(
	IN _sectotal INT
)
BEGIN
	
    DECLARE result VARCHAR (100) ;
    DECLARE _days INT DEFAULT 0;
    DECLARE _hours INT DEFAULT 0;
    DECLARE _min INT DEFAULT 0;
    DECLARE _sec INT DEFAULT 0;
	DECLARE _days_text VARCHAR (10);
    IF _sectotal >= 86400 
    THEN
        SET _days = _sectotal DIV 86400;
        SET _sectotal = _sectotal % 86400;
	END IF;
	IF _sectotal >= 3600 
		THEN
        SET _hours = _sectotal DIV 3600;
        SET _sectotal = _sectotal % 3600;
	END IF;
	IF _sectotal >= 60 THEN
        SET _min = _sectotal DIV 60;
        SET _sectotal = _sectotal % 60;
	END IF;
    IF _days = 1 
		THEN SET _days_text = "день";
    ELSEIF _days BETWEEN 2 AND 4
		THEN SET _days_text = "дня";
    ELSE SET _days_text = "дней";
    END IF;
    SET result = CONCAT(_days, " ",_days_text," ",_hours, " часов ", _min, " минут ", _sectotal, " секунд");
    SELECT result;
	
END $$

CALL calc_time(156996);



