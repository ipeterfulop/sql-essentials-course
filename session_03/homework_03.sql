set search_path to practice_03;

-- Assignment 3.1
-- List all the ongoing projects
-- Hints: a project is started/ongoing if start_date is not null (and completion_date, cancellation_date is NULL) and start_date is on or before the current date
-- A project is considered completed if completion_date is not null (start_date is not null, cancellation_date is null)

-- Your solution should go here

-- Assignment 3.2
-- List all the projects that have been completed in the last 3 months.
-- Your solution should go here

-- Assignment 3.3
-- Retrieve the id, first name, last name, project name, project assignment start date for employees who are actively assigned
-- (where the project_assignments.start_date is defined, end_date is undefined, and the start_date is on or before the current date)
-- to an ongoing project (see Assignment 3.1)
-- order the results by project assignment start date (ascending)

-- Your solution should go here

-- Assignment 3.4
-- Retrieve the IDs, first names, and last names of employees, along with the name of the country
-- where they reside (based on employees.residence_country_id) and the official language of that country.

-- Your solution should go here

-- Assignment 3.5
-- Retrieve the ids, names of projects with no employees assigned to them.
-- Your solution should go here

-- Assignment 3.6
-- Retrieve the ids, names of projects with at least one employees assigned to them 100%. Each project name should only appear once.
-- Your solution should go here

-- Assignment 3.7
-- Obtain the country and language pairs where the language is spoken by at least 30% of the country's population and the language is not official.
-- Your solution should go here

--Assignment 3.8
-- Retrieve the names of countries where there are no resident employees.
-- Order the results by country name ascending.
-- Hint: use a right outer join
-- Your solution should go here

-- Assignment 3.9
-- Retrieve the country names and official languages for which the percentage of people who speak the language is NULL
-- Your solution should go here

-- Assignment 3.10
-- Retrieve senior employees preferred language of communication. Each language should only appear once.
-- Your solution should go here

-- Assignment 3.11(optional)
-- List the employees id, full name, their team lead full name, their band level, and their potentially next band level.
-- The list should also include employees who dont have a team lead.
-- The list should also include employees who are at the highest band level.