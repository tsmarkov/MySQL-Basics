# 2 - Data Insertion
INSERT INTO issues(title, issue_status, repository_id, assignee_id)
SELECT
	concat('Critical Problem With ', f.name, '!') AS title,
	'open' AS issue_status,
	ceiling((f.id * 2) / 3) AS repository_id,
    u.id AS assignee_id
FROM files AS f
JOIN commits AS c
	ON c.id = f.commit_id
JOIN users AS u
	ON u.id = c.contributor_id
WHERE f.id BETWEEN 46 AND 50;

# 3 - Data Update

INSERT INTO repositories_contributors(repository_id, contributor_id)
SELECT *
FROM (
		SELECT min(r.id) AS repository_id
		FROM repositories_contributors AS rc
		RIGHT JOIN repositories AS r
			ON r.id = rc.repository_id
		WHERE rc.contributor_id IS NULL) as t1
CROSS JOIN (
		SELECT rc.contributor_id
		FROM repositories_contributors AS rc
		WHERE rc.repository_id = rc.contributor_id) as t2;
        
# 4 - Data Deletion 

DELETE repositories
FROM repositories AS r
LEFT JOIN  issues AS i
	ON i.repository_id = r.id
WHERE i.id IS NULL;







