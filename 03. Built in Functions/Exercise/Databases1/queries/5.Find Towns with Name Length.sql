USE soft_uni;

SELECT t.name
FROM towns AS t
WHERE CHAR_LENGTH(t.name) BETWEEN 5 AND 6
ORDER BY t.name ASC;