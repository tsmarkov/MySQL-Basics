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
END;
$$

CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(10))
BEGIN
	SELECT e.first_name, e.last_name
    FROM employees AS e
    WHERE ufn_get_salary_level(e.salary) = salary_level
    ORDER BY e.first_name DESC, e.last_name DESC;
END;
$$

CALL usp_get_employees_by_salary_level('High');