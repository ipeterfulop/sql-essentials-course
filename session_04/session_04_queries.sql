set search_path to practice_04;

-- Retrieve all employees whose country of residence matches that of the employee with ID 10.
-- page 2
SELECT id, first_name, last_name, residence_country_id
FROM employees
WHERE residence_country_id = (SELECT residence_country_id
                              FROM employees
                              WHERE id = 10)
  AND id <> 10;

-- Retrieve the ID, last_name, first_name, and salary of employees whose salary matches
-- one of the three highest salaries among junior employees. Arrange the results alphabetically.

-- The top three salaries of employees in the Junior band.
-- page 3
SELECT DISTINCT salary
FROM employees
WHERE band_id IN (SELECT id from bands WHERE lower(name) LIKE 'junior%')
ORDER BY salary DESC
LIMIT 3;

-- Replacing the subquery with a join in the query above.
-- page 4
SELECT DISTINCT e.salary
FROM employees e
         INNER JOIN bands b ON (e.band_id = b.id) AND (lower(b.name) LIKE 'junior%')
ORDER BY salary DESC
LIMIT 3;

-- Having constructed the subquery to retrieve the top three salaries for Junior positions,
-- we can now move forward with building the main/outer query.
-- page 5

SELECT id, first_name, last_name, salary
FROM employees
WHERE salary IN (SELECT DISTINCT e.salary
                 FROM employees e
                          INNER JOIN bands b ON (e.band_id = b.id)
                     AND (lower(b.name) LIKE 'junior%')
                 ORDER BY salary DESC
                 LIMIT 3)
ORDER BY last_name, first_name;

-- Rewriting the solution above using a derived table.
-- page 7
SELECT e.id, e.first_name, e.last_name, e.salary
FROM employees e,
     (SELECT DISTINCT e.salary
      FROM employees e
               INNER JOIN bands b ON (e.band_id = b.id)
          AND (lower(b.name) LIKE 'junior%')
      ORDER BY salary DESC
      LIMIT 3) top_salaries
WHERE e.salary = top_salaries.salary
ORDER BY e.last_name, e.first_name;

-- Rewriting the solution above using an INNER JOIN
-- page 8
SELECT e.id, e.first_name, e.last_name, e.salary
FROM employees e
         INNER JOIN (SELECT DISTINCT e.salary
                     FROM employees e
                              INNER JOIN bands b ON (e.band_id = b.id)
                         AND (lower(b.name) LIKE 'junior%')
                     ORDER BY salary DESC
                     LIMIT 3) top_salaries
                    ON e.salary = top_salaries.salary
ORDER BY last_name, first_name;

-- A quick look at using CTEs
-- page 10
WITH top_salaries AS (SELECT DISTINCT e.salary
                      FROM employees e
                               INNER JOIN bands b ON e.band_id = b.id
                      WHERE lower(b.name) LIKE 'junior%'
                      ORDER BY e.salary DESC
                      LIMIT 3)

SELECT e.id, e.first_name, e.last_name, e.salary
FROM employees e
         JOIN top_salaries ON e.salary = top_salaries.salary
ORDER BY e.last_name, e.first_name;

-- Retrieve the id, first_name, and last_name of employees who are currently assigned to one or more active projects.
-- page 12
SELECT *
FROM projects p
         INNER JOIN project_assignments pa ON pa.project_id = p.id
WHERE COALESCE(p.start_date, current_date) <= current_date
  AND p.cancellation_date IS NULL
  AND p.completion_date IS NULL
  AND pa.employee_id = 1;

-- Example of using correlated subqueries
-- page 13
SELECT id, first_name, last_name
FROM employees emp
WHERE (SELECT COUNT(*)
       FROM projects p
                INNER JOIN project_assignments pa ON pa.project_id = p.id
       WHERE COALESCE(p.start_date, current_date) <= current_date
         AND p.cancellation_date IS NULL
         AND p.completion_date IS NULL
         AND pa.employee_id = emp.id) > 0;

-- Using EXISTS to determine if a subquery returns any results
-- page 14
SELECT id, first_name, last_name
FROM employees emp
WHERE EXISTS (SELECT p.id
              FROM projects p
                       INNER JOIN project_assignments pa ON pa.project_id = p.id
              WHERE COALESCE(p.start_date, current_date) <= current_date
                AND p.cancellation_date IS NULL
                AND p.completion_date IS NULL
                AND pa.employee_id = emp.id);

-- Fetch the `id`, `first_name`, and `last_name`, along with the count of active projects, for employees
-- who are assigned to one or more ongoing projects.
SELECT *
FROM (SELECT id,
             first_name,
             last_name,
             (SELECT COUNT(*)
              FROM projects p
                       INNER JOIN project_assignments pa ON pa.project_id = p.id
              WHERE COALESCE(p.start_date, current_date) <= current_date
                AND p.cancellation_date IS NULL
                AND p.completion_date IS NULL
                AND pa.employee_id = emp.id) as nr_active_projects
      FROM employees emp) AS tmp
WHERE tmp.nr_active_projects > 0;

-- Fetch a list of employees for whom there is another employee with the same team lead and band,
-- both of which must not be null.
-- page 16

SELECT emp.id, emp.first_name, emp.last_name, tld.id, tld.first_name, tld.last_name, b.name as band
FROM employees emp
         INNER JOIN employees tld on emp.lead_employee_id = tld.id
         INNER JOIN bands b on emp.band_id = b.id
WHERE (emp.band_id, emp.lead_employee_id) IN (SELECT band_id, emp.lead_employee_id
                                              FROM employees e
                                              WHERE e.band_id = emp.band_id
                                                AND e.lead_employee_id = emp.lead_employee_id
                                                AND e.id <> emp.id);