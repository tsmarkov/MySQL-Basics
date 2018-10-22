DELIMITER $$
SET GLOBAL log_bin_trust_function_creators = 1;

CREATE PROCEDURE udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50), light_speed_rate_increse INT(11))
BEGIN
	START TRANSACTION;
	IF ((SELECT count(ss.id) FROM spaceships AS ss WHERE ss.name = spaceship_name)<>1) 
		THEN 
		ROLLBACK;
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Spaceship you are trying to modify does not exists.';
	ELSEIF ((SELECT count(ss.id) FROM spaceships AS ss WHERE ss.name = spaceship_name)<>0) 
		THEN
		UPDATE spaceships
		SET light_speed_rate = light_speed_rate + light_speed_rate_increse
		WHERE name = spaceship_name; 	
		COMMIT;
    END IF;
END;
$$

CALL udp_modify_spaceship_light_speed_rate('USS Templar', 10);

SELECT * FROM spaceships;