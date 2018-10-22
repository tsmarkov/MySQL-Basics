DELIMITER $$

DROP FUNCTION IF EXISTS ufn_calculate_future_value;

CREATE FUNCTION ufn_calculate_future_value(init_sum DOUBLE(10, 5), yearly_interest_rate DOUBLE(10, 5), years INT)
RETURNS DOUBLE(15, 9)
BEGIN
    RETURN init_sum * pow( 1 + yearly_interest_rate, years);
END;
$$

SELECT ufn_calculate_future_value(1000, 0.1, 5);