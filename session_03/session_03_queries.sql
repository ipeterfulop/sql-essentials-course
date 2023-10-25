-- Display the id, first name, last name, and business unit ids for every individual in the employees table.
-- Page: 6
SELECT id, first_name, last_name, business_unit_id
FROM practice_03.employees;

-- Show the id and name of all business units.
-- Page: 6
SELECT id, name
FROM practice3.business_units;

-- Display the id, first name, last name, and business unit name
-- for every employee.
-- Page: 7
SELECT first_name, last_name, name as business_unit
FROM employees
         INNER JOIN business_units
                    ON employees.business_unit_id = business_units.id;

-- Retrieve the first names, last names, business_unit, band, and position of all employees where the business unit,
-- band and position are not NULL.
-- page: 8

SET search_path TO practice_03;
SELECT emp.first_name,
       emp.last_name,
       bu.name as business_unit,
       jt.name    job_title,
       b.name  as band
FROM employees AS emp
         INNER JOIN business_units AS bu ON emp.business_unit_id = bu.id
         INNER JOIN job_titles AS jt ON emp.job_title_id = jt.id
         INNER JOIN bands AS b ON emp.band_id = b.id;

-- Retrieve the first names, last names, and business unit names of all employees. Ensure that employees
-- without an assigned business unit are also included in the list.
-- page: 11
SELECT emp.first_name, emp.last_name, bu.name as business_unit
FROM practice_03.employees AS emp
         LEFT OUTER JOIN practice_03.business_units AS bu ON emp.business_unit_id = bu.id;

-- Retrieve the first names, last names, and business unit names of all employees. Include business units
-- that have no employees assigned, but exclude employees who don't have a business unit assigned to them.
-- page: 12
SELECT emp.first_name, emp.last_name, bu.name as business_unit
FROM practice_03.employees AS emp
         RIGHT OUTER JOIN practice_03.business_units AS bu ON emp.business_unit_id = bu.id;

-- Retrieve the first names, last names, and business unit names for all employees. Ensure the list also includes
-- employees without an assigned business unit and business units that don't have any employees associated with them.
-- page: 14
SELECT emp.first_name,
       emp.last_name,
       bu.name as business_unit
FROM practice_03.employees AS emp
         FULL OUTER JOIN practice_03.business_units AS bu
                         ON emp.business_unit_id = bu.id;

-- Show the employee ID, full name of the employee, and the full name of their team lead.
-- page: 18
SELECT emp.id,
       emp.first_name || ' ' || emp.last_name AS full_name,
       tld.id                                 as team_lead_id,
       tld.first_name || ' ' || tld.last_name AS team_lead
FROM practice_03.employees AS emp
         INNER JOIN practice_03.employees AS tld
                    ON emp.lead_employee_id = tld.id
ORDER BY full_name ASC;


-- Display the employee ID, the employee's full name, and their team lead's full name. Ensure the list
-- also features employees without an assigned team lead (where lead_employee_id is NULL).
-- page: 20

SELECT emp.id,
       emp.first_name || ' ' || emp.last_name AS full_name,
       tld.id                                 as team_lead_id,
       tld.first_name || ' ' || tld.last_name AS team_lead
FROM practice_03.employees AS emp
         LEFT OUTER JOIN practice_03.employees AS tld
                         ON emp.lead_employee_id = tld.id
ORDER BY full_name ASC;

-- The company wants to assign team leads to those currently without one and needs a list of only those employees
-- who don't have a team lead assigned.
-- page: 22
SELECT emp.id,
       emp.first_name || ' ' || emp.last_name AS full_name,
       tld.id                                 as team_lead_id,
       tld.first_name || ' ' || tld.last_name AS team_lead
FROM practice_03.employees AS emp
         LEFT OUTER JOIN practice_03.employees AS tld
                         ON emp.lead_employee_id = tld.id
WHERE tld.id IS NULL
ORDER BY full_name ASC;

