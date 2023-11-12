-- Page: 4
-- Count the number of employees in the employees table.
SELECT COUNT(*)
FROM employees;

-- Page: 4
-- (Left) Calculate the total number of unique bands in the employees table, excluding any employees whose band_id is NULL.
SELECT COUNT(DISTINCT band_id)
FROM employees;

-- (Right) Calculate the total number of unique bands in the employees table, excluding any employees whose band_id is NULL.
SELECT COUNT(DISTINCT band_id)
FROM employees;

-- Page: 5
-- (Left) Display the preferred language IDs present in the employees table.
SELECT preferred_language_id
FROM employees;

-- (Right) Calculate the total number of preferred languages found in the employees table.
SELECT COUNT(preferred_language_id)
FROM employees;

-- Page: 6
-- (Left) Display the unique preferred language IDs present in the employees table.
SELECT DISTINCT preferred_language_id
FROM employees;
-- (Right) Calculate the total number of unique preferred languages found in the employees table.
SELECT COUNT(DISTINCT preferred_language_id)
FROM employees;

-- Page: 7
-- Calculate the sum of monthly salaries that the company is required to pay to its employees, as recorded in
-- the employees table.
SELECT SUM(salary) as monthly_salaries_total
FROM employees;

-- Page: 8
-- Select the minimum, maximum, and average age of employees from the employees table.
SELECT EXTRACT(YEAR FROM MIN(age(birth_date))) AS min_age,
       EXTRACT(YEAR FROM MAX(age(birth_date))) AS max_age,
       EXTRACT(YEAR FROM AVG(age(birth_date))) AS avg_age
FROM employees;

-- Page: 11
-- Show the lowest, highest, and mean salary for each band. Include the band name, label the average salary as avg_sal,
-- the highest salary as max_sal, and the lowest salary as min_sal. Omit employees who are not assigned to any band.
-- First step: focus on grouping
SELECT MAX(salary) as max_sal,
       MIN(salary) as min_sal,
       AVG(salary) as avg_sal
FROM employees
GROUP BY band_id;

-- Page: 12
-- Let's exclude the employees who haven't been assigned a band.
SELECT MAX(salary) as max_sal,
       MIN(salary) as min_sal,
       AVG(salary) as avg_sal
FROM employees
WHERE band_id IS NOT NULL
GROUP BY band_id;

-- Page: 13
-- Let's now display the band name by joining with the bands table.

SELECT e.band_id,
       b.name        as band_name,
       MAX(e.salary) as max_sal,
       MIN(e.salary) as min_sal,
       AVG(e.salary) as avg_sal
FROM employees e
         INNER JOIN bands b ON e.band_id = b.id
WHERE e.band_id IS NOT NULL
GROUP BY e.band_id, b.name;

-- Page: 14
-- Let's explore alternative solutions that might be more efficient in certain scenarios by utilizing ' ||
-- our understanding of derived tables and Common Table Expressions (CTEs).

-- Query, left column
SELECT bands.id,
       bands.name as band_name,
       stats.max_sal,
       stats.min_sal,
       stats.avg_sal
FROM (SELECT band_id,
             MAX(salary) as max_sal,
             MIN(salary) as min_sal,
             AVG(salary) as avg_sal
      FROM employees
      WHERE band_id IS NOT NULL
      GROUP BY band_id) AS stats
         INNER JOIN bands
                    ON stats.band_id = bands.id;

-- Query, right column
WITH stats AS (SELECT band_id,
                      MAX(salary) as max_sal,
                      MIN(salary) as min_sal,
                      AVG(salary) as avg_sal
               FROM employees
               WHERE band_id IS NOT NULL
               GROUP BY band_id)
SELECT bands.id,
       bands.name as band_name,
       stats.max_sal,
       stats.min_sal,
       stats.avg_sal
FROM stats
         INNER JOIN bands
                    ON stats.band_id = bands.id;


-- Page: 15
-- Let's assume we want to omit bands where the average salary is 3000 or lower.
-- Additionally, we'll present the average salary rounded to two decimal places.
WITH stats AS (SELECT band_id,
                      MAX(salary)           as max_sal,
                      MIN(salary)           as min_sal,
                      ROUND(AVG(salary), 2) as avg_sal
               FROM employees
               WHERE band_id IS NOT NULL
               GROUP BY band_id
               HAVING AVG(salary) > 3000)
SELECT bands.id,
       bands.name as band_name,
       stats.max_sal,
       stats.min_sal,
       stats.avg_sal
FROM stats
         INNER JOIN bands
                    ON stats.band_id = bands.id;

-- Page: 16
-- Determine the average age corresponding to each job title, displaying two columns: the Job Title and the Average Age.
-- Sort the results in ascending order based on the average age.

WITH age_stats
         AS (SELECT job_title_id,
                    EXTRACT(YEAR FROM AVG(age(birth_date)))
                        AS avg_age
             FROM employees
             WHERE job_title_id IS NOT NULL
             GROUP BY job_title_id)

SELECT name as job_title, age_stats.avg_age
FROM job_titles
         INNER JOIN age_stats
                    ON job_titles.id = age_stats.job_title_id
ORDER BY age_stats.avg_age ASC;

-- Page: 17
-- Obtain a list of countries where more than one language is spoken, along with the total number of different languages
-- spoken in each of these countries.
SELECT c.name as country, lang_stats.num_languages
FROM countries c
         INNER JOIN (SELECT code,
                            COUNT(*) as num_languages
                     FROM languages
                     GROUP BY code
                     HAVING COUNT(*) > 1) lang_stats
                    ON c.code = lang_stats.code
ORDER BY lang_stats.num_languages DESC;

-- Page: 18
-- Retrieve the full names, band designations, and salaries of employees who have the top salary within their
-- respective bands.

SELECT e.first_name || ' ' || e.last_name as full_name, b.name as band_name, e.salary
FROM employees e
         INNER JOIN bands b ON e.band_id = b.id
         INNER JOIN (SELECT band_id, MAX(salary) max_sal
                     FROM employees
                     WHERE band_id IS NOT NULL
                     GROUP BY band_id) AS top_salaries
                    ON e.band_id = top_salaries.band_id AND e.salary = top_salaries.max_sal;