USE soft_uni;

# v2
SELECT 
DISTINCT
	e.employee_id,
    e.first_name, 
    e.last_name,
    e.department_id,
    e.salary
FROM employees AS e
LEFT JOIN employees AS e2
ON e2.manager_id = e.employee_id
WHERE e.manager_id IS NULL;

# v1
/*
SELECT 
	employee_id,
    first_name, 
    last_name,
    department_id,
    salary
FROM employees AS e
WHERE e.manager_id IS NULL;
*/