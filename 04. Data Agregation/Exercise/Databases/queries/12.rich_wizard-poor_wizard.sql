USE gringotts;

SELECT sum(
		w1.deposit_amount - 
        (
			SELECT w2.deposit_amount
            FROM wizzard_deposits AS w2
            WHERE w2.id = w1.id + 1
        )
	) AS sum_difference
FROM wizzard_deposits AS w1;