# 5 - Users

SELECT 
	u.id,
    u.username
FROM users AS u
ORDER BY u.id;

# 6 - Lucky Numbers

SELECT 
	rc.repository_id,
	rc.contributor_id
FROM repositories_contributors AS rc
WHERE rc.repository_id = rc.contributor_id
ORDER BY rc.repository_id;

# 7 - Heavy HTML

SELECT 
	f.id,
    f.name,
    f.size
FROM files AS f
WHERE f.size > 1000
	AND f.name LIKE '%.html'
ORDER BY f.size DESC;

# 8 - Issues and Users

SELECT 
	i.id,
	concat( u.username, ' : ', i.title) AS issue_assignee
FROM issues AS i
JOIN users AS u
	ON u.id = i.assignee_id
ORDER BY i.id DESC;

# 9 - Non-Directory Files

SELECT
DISTINCT
	f.id, 
    f.name,
    concat(f.size, 'KB') as size
FROM files AS f
LEFT JOIN files AS f2
	ON f2.parent_id = f.id
WHERE f2.parent_id IS NULL
ORDER BY f.id;

# 10 - Active Repositories

SELECT 
	r.id,
	r.name,
	count(i.id) AS count
FROM repositories AS r
JOIN issues AS i
	ON i.repository_id = r.id
GROUP BY r.id
ORDER BY 
	count DESC,
    r.id ASC
LIMIT 5;

# 11 - Most Contributed Repository

SELECT 
	r.id,
	r.name,
	(
		SELECT count(*)
        FROM commits AS c
        WHERE c.repository_id = r.id
    ) AS commits,
	count(rc.contributor_id) AS contributors
FROM repositories_contributors AS rc
JOIN repositories AS r
	ON r.id = rc.repository_id
GROUP BY rc.repository_id
ORDER BY
	contributors DESC,
    r.id ASC
LIMIT 1;

# 12 - Fixing My Own Problems

SELECT  
    u.id,
	u.username,
    (
		SELECT count(*) 
		FROM issues  AS i
        JOIN commits AS c
			ON c.issue_id = i.id AND c.contributor_id = i.assignee_id
		WHERE i.assignee_id = u.id
    ) AS commits
FROM users AS u
ORDER BY commits DESC, u.id ASC;

# 13 - Recursive Commits

SELECT
	(left(f.name, locate('.', f.name) - 1)) AS file,
    (
		SELECT count(*)
        FROM commits AS c
        WHERE c.message LIKE concat('%', file,'%')
    ) AS recursive_count
FROM files AS f
JOIN files AS f2
	ON f2.parent_id = f.id 
		AND f2.id = f.parent_id
        AND f.id != f2.id
ORDER BY file ASC;


# 14 - Repositories and Commits
SELECT
	r.id,
    r.name,
    count(DISTINCT c.contributor_id) AS users
FROM repositories AS r
LEFT JOIN commits AS c
	on c.repository_id = r.id
GROUP BY r.id
ORDER BY users DESC, r.id ASC;



















