SELECT 
	e.employee_id AS id,
    concat(e.first_name, ' ', e.last_name) AS full_name,
    d.department_id,
    d.name AS depatment_name
FROM employees AS e
RIGHT JOIN departments AS d
ON e.employee_id = d.manager_id
ORDER BY e.employee_id
LIMIT 5;