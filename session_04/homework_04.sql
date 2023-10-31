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