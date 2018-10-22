DELIMITER $$

CREATE PROCEDURE usp_get_towns_starting_with(name_start VARCHAR(10))
BEGIN
	SELECT t.name AS town_name
    FROM towns AS t
	WHERE t.name LIKE concat(name_start, '%')
    ORDER BY town_name;
END
$$

CALL usp_get_towns_starting_with('b');