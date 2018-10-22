USE gringotts;

SELECT 
	(CASE 
		WHEN age < 0 THEN '[Invalid]'
		WHEN age BETWEEN 0 AND 10 THEN '[0-10]' 
		WHEN age BETWEEN 10 AND 20 THEN '[11-20]'
        WHEN age BETWEEN 20 AND 30 THEN '[21-30]'
        WHEN age BETWEEN 30 AND 40 THEN '[31-40]'
        WHEN age BETWEEN 40 AND 50 THEN '[41-50]'
        WHEN age BETWEEN 50 AND 60 THEN '[51-60]'
		WHEN age > 60 THEN '[61+]'
    END) AS age_group,
    COUNT(id) AS wizard_count
FROM wizzard_deposits
GROUP BY age_group
ORDER BY wizard_count;