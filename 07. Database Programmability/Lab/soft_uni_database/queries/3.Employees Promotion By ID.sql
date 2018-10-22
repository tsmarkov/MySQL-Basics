USE soft_uni;
DELIMITER $$

DROP PROCEDURE IF EXISTS usp_raise_salary_by_id;

CREATE PROCEDURE usp_raise_salary_by_id(id INT)
BEGIN
	START TRANSACTION;
	IF((SELECT count(employee_id) FROM employees AS e WHERE e.employee_id = id)<>1)
		THEN ROLLBACK;
	ELSE 
       	UPDATE employees AS e
		SET salary = salary * 1.05
		WHERE e.employee_id = id;
    END IF;
END
$$