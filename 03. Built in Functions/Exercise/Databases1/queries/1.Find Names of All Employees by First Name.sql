USE soft_uni;

SELECT e.first_name, e.last_name
FROM employees AS e
WHERE left(e.first_name, 2) = 'Sa'
ORDER BY e.employee_id; 