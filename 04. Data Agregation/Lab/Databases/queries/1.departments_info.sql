SELECT department_id, count(id) as employees_count
FROM employees
GROUP BY department_id
ORDER BY department_id, employees_count;