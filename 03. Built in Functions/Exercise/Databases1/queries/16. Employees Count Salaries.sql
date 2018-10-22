USE soft_uni;

SELECT count(salary) AS salaries_count
FROM employees
WHERE manager_id IS NULL;