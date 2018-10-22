SELECT department_id, round(avg(salary), 2) as average_salary
FROM employees
GROUP BY department_id
ORDER BY department_id;