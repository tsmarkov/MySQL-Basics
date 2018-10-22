DELIMITER $$

DROP PROCEDURE IF EXISTS usp_get_holders_with_balance_higher_than;

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(min_balance DECIMAL(20, 4))
BEGIN
	SELECT 
		ah.first_name, 
		ah.last_name
	FROM accounts AS a
	JOIN account_holders AS ah
		ON ah.id = a.account_holder_id
	GROUP BY a.account_holder_id
	HAVING sum(a.balance) > min_balance
	ORDER BY a.id;
END
$$

CALL usp_get_holders_with_balance_higher_than(7000);