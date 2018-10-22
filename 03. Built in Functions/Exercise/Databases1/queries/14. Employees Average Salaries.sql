USE soft_uni;

CREATE TEMPORARY TABLE IF NOT EXISTS top_paid
AS (
	SELECT *
    FROM employees
    WHERE salary > 30000
);

DELETE 
FROM top_paid
WHERE manager_id = 42;

UPDATE top_paid
SET salary = salary + 5000
WHERE department_id = 1;

SELECT department_id, avg(salary) AS avg_salary
FROM top_paid
GROUP BY department_id
ORDER BY department_id ASC;

