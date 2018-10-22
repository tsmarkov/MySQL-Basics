USE soft_uni;

SELECT count(*) AS count
FROM employees AS e
WHERE e.salary > (
	SELECT avg(e2.salary)
    FROM employees AS e2
);