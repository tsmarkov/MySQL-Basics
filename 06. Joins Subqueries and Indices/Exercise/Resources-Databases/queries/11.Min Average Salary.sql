USE soft_uni;

SELECT
	avg(salary) AS min_avgerage_salary
FROM employees AS e
GROUP BY e.department_id
ORDER BY avg(e.salary)
LIMIT 1;