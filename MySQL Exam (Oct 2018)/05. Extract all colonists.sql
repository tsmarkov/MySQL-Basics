SELECT 
	c.id, 
    concat(c.first_name, ' ',c.last_name),
    c.ucn
FROM colonists AS c
ORDER BY  c.first_name, c.last_name, c.id;