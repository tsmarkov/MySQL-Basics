USE `soft_uni`;

# --- 1 ---
SELECT * 
	FROM `departments`;

# --- 2 ---
SELECT `name` 
	FROM `departments`;

# --- 3 ---
SELECT `first_name`, `last_name`, `salary` 
	FROM `employees`;

# --- 4 ---
SELECT `first_name`, `middle_name`, `last_name` 
	FROM `employees`;

# --- 5 ---
SELECT concat(`first_name`, '.', `last_name`, '@softuni.bg') 
	AS `full_email_address` 
	FROM `employees`;


# --- 6 ---
SELECT DISTINCT `salary` 
	FROM `employees`
	ORDER BY `employee_id` ASC;


# --- 7 ---
SELECT * 
	FROM `employees` 
    WHERE `job_title` = 'Sales Representative';

# --- 8 ---
SELECT `first_name`, `last_name`, `job_title` 
	FROM `employees` 
	WHERE  `salary` BETWEEN 20000 AND 30000;

# --- 9 ---
SELECT concat(`first_name`, ' ', `middle_name`, ' ', `last_name`) 
	AS 'Full Name' 
	FROM `employees`
	WHERE `salary` = 25000 or 
		`salary` = 14000 or 
		`salary` = 12500 or 
		`salary` = 23600;

# --- 10 ---
SELECT `first_name`, `last_name` 
	FROM `employees` 
	WHERE `manager_id` IS NULL;

# ---- 11 ---
SELECT `first_name`, `last_name`, `salary`
	FROM `employees`
	WHERE `salary` > 50000
	ORDER BY `salary` 
    DESC;

# --- 12 ---
SELECT `first_name`, `last_name` 
	FROM `employees` 
    ORDER BY `salary` 
    DESC 
    LIMIT 5;

# --- 13 ---
SELECT `first_name`, `last_name`
	FROM `employees`
    WHERE `department_id` != 4;

# --- 14 ---
SELECT *
	FROM `employees`
    ORDER BY `salary` DESC,
		`first_name`,
		`last_name` DESC,
        `middle_name`;
        
# --- 15 ---
CREATE VIEW `v_employees_salaries`
	AS
	SELECT `first_name`, `last_name`, `salary`
	FROM `employees`;

# --- 16 ---
CREATE VIEW `v_employees_job_titles` 
	AS
	SELECT concat(`e`.`first_name`, ' ', 
		(CASE WHEN `e`.`middle_name` IS NULL THEN '' ELSE `e`.`middle_name` END), ' ', `e`.`last_name`)
	AS 'full_name', `e`.`job_title` 
	FROM `employees` AS `e`;
    
# --- 17 ---
SELECT DISTINCT `job_title`
	FROM `employees`
	ORDER BY `job_title` ASC;

# --- 18 ---
SELECT *
	FROM `projects`
    ORDER BY `start_date` ASC, `name` ASC
    LIMIT 10;

# --- 19 ---
SELECT `first_name`, `last_name`, `hire_date`
	FROM `employees`
    ORDER BY `hire_date` DESC
    LIMIT 7;

# --- 20 ---
UPDATE `employees`
	SET `salary` = `salary` * 1.12
    WHERE `department_id` IN
    (1, 2, 4, 11);
    
SELECT `salary` FROM `employees`;

/*
SELECT department_id
			FROM departments
            WHERE name
            IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')
*/

# --- USE geography ---
USE `geography`;

# --- 21 ---
SELECT `peak_name` 
	FROM `peaks` 
    ORDER BY `peak_name` ASC;

# --- 22 ---
SELECT `country_name`, `population`
	FROM `countries`
    WHERE `continent_code` IN ('EU')
    ORDER BY `population` DESC, `country_name`
    LIMIT 30;
    
# --- 23 ---
SELECT `country_name`, `country_code`, if(`c`.`currency_code` = 'EUR', 'Euro', 'Not Euro') AS `currency`
	FROM `countries` AS `c`
	ORDER BY `c`.`country_name`;


# --- USE `diablo` ---
USE `diablo`;

# --- 24 ---
SELECT `name` 
	FROM `characters` AS `c`
	ORDER BY `c`.`name`;







    


