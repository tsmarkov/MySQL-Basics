USE soft_uni;

SELECT e.first_name
FROM employees AS e
WHERE e.department_id IN (3,10) 
	AND 
	EXTRACT(YEAR FROM e.hire_date) BETWEEN 1995 AND 2005
ORDER BY e.employee_id;