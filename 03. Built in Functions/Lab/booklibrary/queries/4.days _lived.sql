SELECT concat(first_name, ' ', last_name) AS full_name,
	timestampdiff(DAY, born, died) AS days_lived
FROM authors;