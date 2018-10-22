INSERT INTO travel_cards(card_number, job_during_journey, colonist_id, journey_id)
SELECT 
	(
		CASE 
        WHEN c.birth_date > str_to_date(1980-01-01, '%Y-%m-%d') THEN
			concat(year(c.birth_date), day(c.birth_date), left(c.ucn, 4))
        ELSE
			concat(year(c.birth_date), month(c.birth_date), right(c.ucn, 4))
		END
    ) AS card_number,
    (
		CASE 
        WHEN c.id % 2 = 0 THEN 'Pilot'
        WHEN c.id % 3 = 0 THEN 'Cook'
        ELSE 'Engineer'
		END
    ) AS job_during_journey,
    c.id AS colonist_id,
    (left(c.ucn, 1)) AS journey_id
FROM colonists AS c
WHERE c.id BETWEEN 96 AND 100;
