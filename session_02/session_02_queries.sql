-- Simple examples of using the SELECT command
-- Page: 2
SELECT 1.23 * 4.56, 'Apple' <> 'apple', current_time;
SELECT 2 + 5 AS MyLuckyNumber, 'Apple' <> 'apple' AS string_comparison, current_time AS "The current time";

-- Using the * wildcard
-- Page: 4
SELECT *
FROM practice_02.employees;

-- Explicit selecting
-- Page: 5
SELECT first_name, last_name, birth_date
FROM practice_02.employees;

-- column operations, aliases
-- The company has decided to implement a 10% salary increase for all employees.
-- Provide a list of employee ids, first names, last names, current salaries, new salaries after the 10% increase,
-- and the actual numeric increase in salary.
-- Page: 6
SELECT id,
       first_name,
       last_name,
       salary       AS "Current salary",
       salary * 1.1    "New salary",
       0.1 * salary AS SalaryIncrease
FROM practice_02.employees;

-- SELECT DISTINCT values
-- Display the last names of all individuals in the employees table.
-- Page: 7
SELECT last_name
FROM practice_02.employees;

-- Display the DISTINCT last names of all individuals in the employees table.
-- Page: 8
SELECT DISTINCT last_name
FROM practice_02.employees;

-- Show a list of unique countries where the employees are currently working from
-- Page: 8
SELECT DISTINCT country_of_work
FROM practice_02.employees;

-- Display a list of unique combinations of places and countries  where the employees are currently working.
-- Page: 9
SELECT DISTINCT place_of_work, country_of_work
FROM practice_02.employees;


-- Employees are required to undergo a medical examination annually. The date for the next medical examination will
-- be set to one year after their last examination.
-- However, if an employee's "date_of_last_medical_analysis" is empty (NULL) for any reason, the next examination
-- will be scheduled for two weeks from the current date.
-- Page: 10
SELECT first_name,
       last_name,
       date_of_last_medical_analysis,
       date_of_last_medical_analysis + INTERVAL '1 year' AS next_medical_analysis
FROM practice_02.employees;

-- Display the first name, last name, and the most recent medical analysis date for every employee.
-- Examine whether employees possess a non-null value in the "date_of_last_medical_analysis" field.
-- Compute the "next_medical_analysis" date by adding one year to the last analysis date for employees
-- with non-null entries and by adding two weeks to the current date for those with missing last analysis dates.
-- Page: 12
SELECT first_name,
       last_name,
       date_of_last_medical_analysis             AS analysis_date,
       date_of_last_medical_analysis IS NULL     AS no_analysis_yet,
       date_of_last_medical_analysis IS NOT NULL AS has_previous_analysis,
       CAST(
               COALESCE(date_of_last_medical_analysis + INTERVAL '1 year', CURRENT_DATE + INTERVAL '2 weeks')
           AS DATE)                              AS next_medical_analysis
FROM practice_02.employees;

-- Page:13
-- the use of COALESCE can be replaced as below, however the use of COALESCE is more concise
SELECT first_name,
       last_name,
       date_of_last_medical_analysis             AS analysis_date,
       date_of_last_medical_analysis IS NULL     AS no_analysis_yet,
       date_of_last_medical_analysis IS NOT NULL AS has_previous_analysis,
       CASE
           WHEN date_of_last_medical_analysis IS NOT NULL THEN
               CAST(date_of_last_medical_analysis + INTERVAL '1 year' AS DATE)
           ELSE
               CAST(CURRENT_DATE + INTERVAL '2 weeks' AS DATE)
           END                                   AS next_medical_analysis
FROM practice_02.employees;

-- Furnish a list that includes the first names, last names, current salaries, new salaries, and the
-- corresponding salary increases for employees.
-- The salary adjustments adhere to the following guidelines: For Junior1, there is an 8% increase; for Junior2,
-- a 7% increase; for Medior, a 6% increase; and for Senior1 and above, there is a 5% increase if they were hired
-- before 2020-01-01 and a 3% increase otherwise.
-- Correct the query provided below:
-- Page: 15
SELECT first_name,
       last_name,
       band,
       hire_date,
       salary  as current_salary,
       CASE
           WHEN (SUBSTR(band, 1, 6) = 'Senior') AND (TO_DATE('2020-01-01', 'YYYY-MM-DD') > hire_date)
               THEN salary * 1.05
           WHEN (SUBSTR(band, 1, 6) = 'Senior') AND (TO_DATE('2020-01-01', 'YYYY-MM-DD') < hire_date)
               THEN salary * 1.03
           ELSE salary * 1.1
           END as new_salary,
       CASE
           WHEN (SUBSTR(band, 1, 6) = 'Senior') AND (TO_DATE('2020-01-01', 'YYYY-MM-DD') > hire_date)
               THEN salary * 0.05
           WHEN (SUBSTR(band, 1, 6) = 'Senior') AND (TO_DATE('2020-01-01', 'YYYY-MM-DD') < hire_date)
               THEN salary * 0.03
           ELSE salary * 1.1
           END as salary_increase
FROM practice_02.employees;

-- Page:16
SELECT CONCAT(first_name, ' ', middle_name, ' ', last_name) AS full_name,
       email_address,
       unit_of_work
FROM practice_02.employees;

-- Page: 17
-- Solution 1
SELECT CASE
           WHEN middle_name IS NULL
               THEN CONCAT(first_name, ' ', last_name)
           ELSE CONCAT(first_name, ' ', middle_name, ' ', last_name)
           END as full_name,
       email_address,
       unit_of_work
FROM practice_02.employees;

-- Page: 17
-- Solution 2
SELECT REPLACE(CONCAT(first_name, ' ', middle_name, ' ', last_name), '  ', ' ',) AS full_name,
       email_address,
       unit_of_work
FROM practice_02.employees;

-- Page: 20
-- Task: Retrieve employees who are currently stationed at the 'Budapest' office.
SELECT first_name,
       last_name,
       place_of_work
FROM practice_02.employees
WHERE place_of_work = 'Budapest';

-- Page: 21
-- Employees must complete an annual medical examination.
-- Provide a list of employees' first names, last names, and email addresses.
-- This list should include employees with empty date_of_last_medical_analysis fields or those
-- whose date_of_last_medical_analysis is more than one year old.
SELECT first_name, last_name, (current_date - date_of_last_medical_analysis) AS days_diff
FROM practice_02.employees;

-- Page: 22
SELECT first_name,
       last_name,
       email_address
FROM practice_02.employees
WHERE (date_of_last_medical_analysis IS NULL)
   OR (CURRENT_DATE - COALESCE(date_of_last_medical_analysis, CURRENT_DATE) > 365)

-- Page: 24
-- Retrieve the first names, last names, salaries, and hire dates of employees who were employed between January 1, 2022,
-- and March 31, 2023, and whose salaries fall within the range of 2800 to 4000.
SELECT first_name, last_name, salary, hire_date
FROM practice_02.employees
WHERE (hire_date BETWEEN to_date('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-03-31', 'YYYY-MM-DD'))
  AND salary BETWEEN 2800 AND 4000;

-- Please provide a list of employees' first names, last names, and hire dates, ordered by their date of joining the
-- company. In case multiple employees joined on the same day, prioritize sorting them based on their last names and
-- then their first names.
-- Page: 27
SELECT first_name, last_name, hire_date
FROM practice_02.employees
ORDER BY hire_date ASC, last_name ASC, first_name ASC;

-- Display the first name, last name, work unit, and salary of the employees. Sort the list by the employees' work
-- units, with those in the same unit arranged in descending order of their salaries. In case of employees within the
-- same unit having the same salary, further sort them in ascending order based on their last names and then their
-- first names.
SELECT CASE
           WHEN middle_name IS NULL THEN CONCAT(first_name, ' ', last_name)
           ELSE CONCAT(first_name, ' ', middle_name, ' ', last_name)
           END as full_name,
       hire_date,
       unit_of_work,
       salary
FROM practice_02.employees
WHERE hire_date < TO_DATE('2023-01-01', 'YYYY-MM-DD')
ORDER BY full_name ASC;

-- Obtain the information for the top 5 employees who have the highest salaries, which should include their first name,
-- last name, and salary.
-- Page: 32
SELECT first_name, last_name, salary
FROM practice_02.employees
WHERE unit_of_work = 'Consulting 1'
ORDER BY salary DESC
LIMIT 5;

-- Page: 35
-- display the current date
SELECT CURRENT_DATE;
-- display the current datestyle
SHOW DATESTYLE;

-- display the first name, last name, hire date, and the number of years
-- elapsed since the hire date for each employee.
SELECT first_name, last_name, hire_date, AGE(current_date, hire_date)
FROM practice_02.employees;

-- Show the first name, last name, hire date, and the number of years that have passed since the hire date for every
-- employee, both in a readable format and as an integer.
-- Page: 37
SELECT first_name,
       last_name,
       hire_date,
       AGE(current_date, hire_date) AS years_readable,
       EXTRACT(YEAR FROM AGE(current_date, hire_date)),
       EXTRACT(YEAR FROM current_date, hire_date)
FROM practice_02.employees;

-- Using the EXTRACT() function
-- Page:38
-- day of week based on ISO 8601 Monday (1) to Sunday (7)
SELECT EXTRACT(ISODOW FROM current_date);

-- extracting hour from a timestamp
SELECT EXTRACT(HOUR FROM TIMESTAMP '2016-12-31 13:30:15');

-- extracting the quarter from an interval
SELECT EXTRACT(QUARTER FROM INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second');

-- Using the TO_DATE() function
-- Page:39

-- example using the 'YYYY Mon DD' format
SELECT TO_DATE('2023 Oct 20','YYYY Mon DD');

-- example using the 'MM-DD-YYYY' format
SELECT TO_DATE('03-02-2001','MM-DD-YYYY');

-- example using the 'YYYY-MM-DD'  format
SELECT TO_DATE('2023-09-25','YYYY-MM-DD');