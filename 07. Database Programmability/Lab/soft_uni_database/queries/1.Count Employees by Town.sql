USE soft_uni;
DELIMITER $$

SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION ufn_count_employees_by_town;

CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS DOUBLE
BEGIN
	DECLARE e_count DOUBLE;
    SET e_count := (
		SELECT COUNT(employee_id)
		FROM employees AS e
        INNER JOIN addresses AS a
			ON e.address_id = a.address_id
		INNER JOIN towns AS t
			ON a.town_id = t.town_id
		WHERE t.name = town_name
	);
    RETURN e_count;
END

$$

SELECT ufn_count_employees_by_town('Sofia');