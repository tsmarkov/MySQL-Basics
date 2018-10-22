DELIMITER $$

SET GLOBAL log_bin_trust_function_creators = 1;

CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(20, 4))
RETURNS VARCHAR(10)
BEGIN
	DECLARE level VARCHAR(10);
    SET level := (
		CASE
			WHEN salary < 30000.00 THEN 'Low'
			WHEN salary > 50000.00 THEN 'High'
			ELSE 'Average'
		END
    );
    RETURN level;
END
$$

SELECT ufn_get_salary_level(40000.99999);