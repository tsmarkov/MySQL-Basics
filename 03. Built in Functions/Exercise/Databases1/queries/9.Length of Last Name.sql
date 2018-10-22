USE soft_uni;

SELECT e.first_name, e.last_name
FROM employees AS e
WHERE char_length(e.last_name) = 5;