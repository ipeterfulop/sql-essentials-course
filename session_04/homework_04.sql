SET search_path TO practice_04;

-- Assignment 4.1
-- Which languages are spoken in both Argentina and Chile?
-- Do not include generic terms such as 'indigenous', 'Other', or 'unspecified'. Provide the names of specific languages.
-- Use the <select code from countries where name = 'Argentina'> and <select code from countries where name = 'Chile'> subqueries
-- to get the key (code) of countries.
-- Hint: create two derived tables, one for Argentina and one for Chile, and then join them on language name.

-- Your solution goes here

-- Assignment 4.2
-- Obtain the names and capitals of countries whose official language is the same as Argentina's official language.
-- Ensure you incorporate the following subquery <SELECT code FROM countries WHERE name='Argentina';> in your solution
-- to fetch the key column value for Argentina.
-- Hint: find the official language of Argentina and then use it to find the country codes in the languages table
-- that have the same official language.
-- Use the country codes to find the names and capitals of those countries in the countries table.

-- Your solution goes here

-- Assignment 4.3
-- Retrieve the full names, band designations, and salaries of employees who have the top salary within their respective bands.
-- Hint: Use a multi-column subquery to find the top salary within the band of each employee.

-- Your solution goes here

-- Assignment 4.3
-- Retrieve the full names, band designations, and salaries of employees who have the top salary within their respective bands.
-- Hint: Use a correlated multi-column subquery to find the top salary within the band of each employee.

-- Your solution goes here

-- Assignment 4.4
-- Fetch the full names, band classifications, and salaries of employees whose earnings surpass the average salary
-- in their respective bands.
-- Hint: Utilize a correlated subquery to determine the average salary for each employee's band.

-- Your solution goes here

-- Assignment 4.5 (4.4+)
-- Fetch the full names, band classifications, and salaries of employees whose earnings surpass the average
-- salary in their respective bands.
-- Also show the difference between the employee's salary and the average salary for the band.
-- Hint: Utilize a correlated subquery to determine the average salary for each employee's band in the SELECT clause.

-- Your solution goes here

-- Assignment 4.6
-- Obtain the following information for employees who are allocated more annual leave days than their corresponding team leads:
-- employee ID, employee full name, team lead's ID, team lead's full name, and the difference in leave days between the employee and their team lead.
-- Do not use any subquery in the solution


-- Assignment 4.7
-- Same as 4.6, but use a subquery to obtain the team lead's yearly leave days.

-- Your solution goes here

-- Assignment 4.8
-- Retrieve a list of employees who have a number of yearly leave days greater than the average yearly leave days for
-- their respective band.
-- For each of these employees, display the following information:
-- employee ID (emp.id), Employee's first name (first_name), employee's last name (last_name), the number
-- of yearly leave days allocated to the employee (yearly_leave_days), the name of the band to which the employee
-- belongs (bands.name). Alongside the information for each employee, also calculate and display the average
-- number of yearly leave days for all employees within the same band as the employee. T
-- his average should be shown as a separate column (avg_leave_days).
-- Hint: Use, generalize the query below in your solution:
-- SELECT AVG(yearly_leave_days) FROM employees e WHERE e.band_id = 2;

-- Your solution goes here


-- Assignment 4.9
-- Display the employee ID, first name, last name, and the name of the customer they are currently assigned to for an active(ongoing) project.
-- Ensure the results do not contain any repeated rows.
-- Note: Avoid using subqueries for this task.

-- Your solution goes here


-- Assignment 4.10 (optional, for 0.25 extra points)
-- Display the employee ID, first name, last name, and the name of the on-going project they are currently assigned to (project_assignments.end_date is null)
-- for an active(ongoing) project where the number of employees assigned to the project is greater than 4.

-- Your solution goes here

