USE hospital;

# --- 1 ---
SELECT id, first_name, last_name, job_title 
FROM employees;

# --- 2 ---
SELECT id, CONCAT(`first_name`, ' ', `last_name`) AS 'full_name', job_title, salary 
FROM `employees` 
WHERE `salary` > 1000.00;

# --- 3 ---
SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET salary = salary * 1.1
WHERE job_title = 'Therapist';
    
SELECT salary FROM employees ORDER BY salary ASC;

# --- 4 ---
CREATE OR REPLACE VIEW v_top_paid_employee
AS 
	SELECT * FROM employees
	ORDER BY salary DESC LIMIT 1;

SELECT * FROM v_top_paid_employee;

# --- 5 ---
SELECT * FROM employees
	WHERE department_id = 4 AND salary >= 1600;

# --- 6 ---
DELETE FROM employees 
WHERE department_id = 1
OR department_id = 2;

SELECT * FROM employees;











