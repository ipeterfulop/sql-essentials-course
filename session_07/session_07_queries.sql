--Page 3
--Show all rows in the job_titles table
SELECT *
FROM job_titles;

-- Page 4
-- Display column information such as column names, data types, and nullability
-- for the job_titles table in the practice_07 schema.
SELECT ordinal_position,
       column_name,
       data_type,
       is_nullable,
       column_default
FROM information_schema.columns
WHERE table_schema = 'practice_07'
  AND table_name = 'job_titles';


-- Page 5
-- Insert "Data Analyst" and "Data Visualization Specialist" into the job_titles table,
-- assigning them the IDs 6 and 7, respectively.
set search_path to practice_07;
INSERT INTO job_titles(id, name)
VALUES (6, 'Data Analyst');
INSERT INTO job_titles(id, name)
VALUES (7, 'Data Visualization Expert');
SELECT *
FROM job_titles;

-- Page 6
-- Show all rows in the business_units table.
SELECT *
FROM business_units;

-- Page 7
-- Add "Finance" and “Marketing” to the business_units table
-- without specifying a particular id.
INSERT INTO business_units (name, activity_start_date)
VALUES ('Finance', TO_DATE('2013-01-01', 'YYYY-MM-DD')),
       ('Marketing', TO_DATE('2013-03-01', 'YYYY-MM-DD'));

-- Page 9
-- As a first step let us collect id, first_name, middle_name, birth_date, and email address
-- of the employees with ID 1, 5, 7 and 10.
SELECT id   AS employee_id,
       first_name,
       middle_name,
       last_name,
       birth_date,
       email_address,
       2023 as year,
       ''   as award
FROM employees
WHERE id IN (1, 5, 7, 10);

-- Page 10
-- Let us insert the results of the SELECT statement  into the annual_employee_awards table.
INSERT INTO annual_employee_awards
SELECT id   as employee_id,
       first_name,
       middle_name,
       last_name,
       birth_date,
       email_address,
       2023 as year,
       ''   as award
FROM employees
WHERE id IN (1, 5, 7, 10);

-- Page 10
-- Let us check the result of the INSERT command
SELECT *
FROM annual_employee_awards
WHERE year = 2023;

-- Page 15
SELECT id, first_name, last_name, salary, last_salary_review_date
FROM employees
WHERE id = 5
   OR id = 9;

-- Page 16
-- On December 1st, 2023, employees bearing IDs 5 and 9 underwent a salary revision. Each of these employees received a
-- 10% increase in their salary. Accordingly, update the columns for salary and last_salary_review_date.
UPDATE employees
SET salary=ROUND(salary * 1.1, 0),
    last_salary_review_date = TO_DATE('2023-12-01', 'YYYY-MM-DD')
WHERE id = 5
   OR id = 9;

-- Page 17
-- Modify all email addresses in the annual_employee_awards table for the employees receiving awards in 2023,
-- ensuring they match the email addresses listed in the employees table.
UPDATE annual_employee_awards
SET email_address=employees.email_address
FROM employees
WHERE employees.id = annual_employee_awards.employee_id
  AND annual_employee_awards.year = 2023;

-- Page 20
-- before executing the DELETEcommand, let us identify the row(s) to be deleted
SELECT *
FROM annual_employee_awards
WHERE id = 7
  AND year = 2023;
-- delete the requested entry
DELETE
FROM annual_employee_awards
WHERE id = 7
  AND year = 2023;
-- Run the SELECT * FROM annual_employee_awards; to test the results
