SELECT department_id, MIN(salary) as min_salary
FROM employees
GROUP BY department_id
HAVING min_salary > 800
ORDER BY department_id
LIMIT 1;