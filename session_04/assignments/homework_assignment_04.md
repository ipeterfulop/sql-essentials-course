# Homework assignment 04

## Purposes
The aim of this homework is to gain an understanding of both non-correlated and correlated subqueries.

## Dedicated schema

The `practice_04` schema has been created for you within your dedicated database.
Please set the search path accordingly:

```{postgresql}
SET search_path TO practice_04;
```

# Assignment 4.1

Which languages are spoken in both Argentina and Chile?  
Do not include generic terms such as `indigenous`, `Other`, or `unspecified`.   
Provide the names of specific languages.
Use the `SELECT code FROM countries WHERE name = 'Argentina';` and `SELECT code FROM countries WHERE name = 'Chile'`
subqueries to get the key (`code`) of countries.  
**Hint:** create two derived tables, one for Argentina and one for Chile, and then join them on language name.

**Expected output**: 2 rows

| name    |
|---------|
| Spanish |
| English |

```{postgresql}
-- Your solution goes here
```

## Assignment 4.2

Obtain the names and capitals of countries whose official language is the same as Argentina's official language.  
Ensure you incorporate the following subquery `SELECT code FROM countries WHERE name='Argentina';` in your solution
to fetch the key column value for Argentina.  
**Hint:** find the official language of Argentina and then use it to find the country codes in the languages table
that have the same official language. Use the country codes to find the names and capitals of those countries
in the `countries` table.

Expected results: 17 rows

| Name               | Capital        |
|:-------------------|:---------------|
| Bolivia            | La Paz         |
| Chile              | Santiago       |
| Costa Rica         | San Jose       |
| Dominican Republic | Santo Domingo  |
| Ecuador            | Quito          |
| El Salvador        | San Salvador   |
| Guatemala          | Guatemala City |
| Honduras           | Tegucigalpa    |
| Colombia           | Bogota         |
| Cuba               | Havana         |
| Nicaragua          | Managua        |
| Panama             | Panama City    |
| Paraguay           | Asuncion       |
| Peru               | Lima           |
| Equatorial Guinea  | Malabo         |
| Uruguay            | Montevideo     |
| Venezuela          | Caracas        |

```{postgresql}
-- Your solution goes here
```

## Assignment 4.3

Retrieve the full names, band designations, and salaries of employees who have the top salary within their respective
bands.  
**Hint:** Use a multi-column subquery to find the top salary within the band of each employee.

**Expected results:** 7 rows

| full_name      | band_name  | salary |
|----------------|------------|--------|
| Anna Kovacs    | Junior 1   | 3500   |
| Balazs Toth    | Junior 2   | 4000   |
| Istvan Horvath | Senior 2   | 4500   |
| Gabor Kovacs   | Mid-Senior | 3500   |
| Anna Nagy      | Senior 3   | 3800   |
| Eva Horvath    | Senior 1   | 4500   |
| Anita Molnar   | Senior 4   | 3800   |

```{postgresql}
-- Your solution goes here
```

## Assignment 4.4

Fetch the full names, band classifications, and salaries of employees whose earnings surpass the average salary
in their respective bands.  
**Hint:** Utilize a correlated subquery to determine the average salary for each employee's band.

**Expected results:** 14 rows

| full_name      | band_name  | salary |
|----------------|------------|--------|
| Anna Kovacs    | Junior 1   | 3500   |
| Zsuzsa Papp    | Junior 1   | 3200   |
| Balazs Toth    | Junior 2   | 4000   |
| Istvan Kiss    | Junior 2   | 3500   |
| Laszlo Varga   | Junior 2   | 3800   |
| Eva Szabo      | Mid-Senior | 2800   |
| Gabor Kovacs   | Mid-Senior | 3500   |
| Krisztina Toth | Mid-Senior | 2900   |
| Eva Horvath    | Senior 1   | 4500   |
| Lilla Toth     | Senior 2   | 4100   |
| Istvan Horvath | Senior 2   | 4500   |
| Andras Farkas  | Senior 3   | 3500   |
| Anna Nagy      | Senior 3   | 3800   |
| Anita Molnar   | Senior 4   | 3800   |

```{postgresql}
-- Your solution goes here
```

## Assignment 4.5 (4.4+)

Fetch the full names, band classifications, and salaries of employees whose earnings surpass the average
salary in their respective bands.  
Also show the difference between the employee's salary and the average salary for the band.  
**Hint:** Utilize a correlated subquery to determine the average salary for each employee's band in the SELECT clause.

**Expected results:** 14 rows

| full_name      | band_name  | salary | difference |
|----------------|------------|--------|------------|
| Anna Kovacs    | Junior 1   | 3500   | 434        |
| Balazs Toth    | Junior 2   | 4000   | 540        |
| Istvan Horvath | Senior 2   | 4500   | 1000       |
| Zsuzsa Papp    | Junior 1   | 3200   | 134        |
| Laszlo Varga   | Junior 2   | 3800   | 340        |
| Gabor Kovacs   | Mid-Senior | 3500   | 767        |
| Anna Nagy      | Senior 3   | 3800   | 625        |
| Eva Szabo      | Mid-Senior | 2800   | 67         |
| Andras Farkas  | Senior 3   | 3500   | 325        |
| Krisztina Toth | Mid-Senior | 2900   | 167        |
| Istvan Kiss    | Junior 2   | 3500   | 40         |
| Eva Horvath    | Senior 1   | 4500   | 967        |
| Anita Molnar   | Senior 4   | 3800   | 900        |
| Lilla Toth     | Senior 2   | 4100   | 600        |


```{postgresql}
-- Your solution goes here
```


## Assignment 4.6

Obtain the following information for employees who are allocated more annual leave days than their corresponding team
leads:  
employee ID, employee full name, team lead's ID, team lead's full name,
and the difference in leave days between the employee and their team lead.  
**Attention**: Do not use any subquery in the solution

**Expected results:** 12 rows

| id | full_name     | band_name | team_lead_id  | employee_leave_days | leave_days_difference | 
|----|---------------|-----------|---------------|---------------------|-----------------------|
| 13 | Gabor Nagy    | 3         | Zoltan Toth   | 28                  | 8                     |
| 14 | Katalin Szabo | 4         | Eva Horvath   | 35                  | 7                     | 
| 22 | Anna Nagy     | 1         | Gabor Nagy    | 30                  | 5                     | 
| 24 | Katalin Varga | 8         | Ferenc Kovacs | 26                  | 4                     | 
| 27 | Andras Farkas | 1         | Gabor Nagy    | 33                  | 8                     | 
| 1  | Gabor Nagy    | 10        | Laszlo Nagy   | 25                  | 1                     |     
| 2  | Istvan Kiss   | 10        | Laszlo Nagy   | 30                  | 6                     | 
| 4  | Eva Horvath   | 10        | Laszlo Nagy   | 28                  | 4                     | 
| 5  | Katalin Szabo | 10        | Laszlo Nagy   | 35                  | 11                    | 
| 6  | Andras Kovacs | 10        | Laszlo Nagy   | 32                  | 8                     | 
| 7  | Anita Molnar  | 10        | Laszlo Nagy   | 27                  | 3                     | 
| 9  | Lilla Toth    | 10        | Laszlo Nagy   | 33                  | 9                     | 



```{postgresql}
-- Your solution goes here
```

## Assignment 4.7
Same as 4.6, but use a subquery to obtain the team lead's yearly leave days.

**Expected results:** 12 rows

| id | full_name     | band_name | team_lead_id  | employee_leave_days | leave_days_difference | 
|----|---------------|-----------|---------------|---------------------|-----------------------|
| 13 | Gabor Nagy    | 3         | Zoltan Toth   | 28                  | 8                     |
| 14 | Katalin Szabo | 4         | Eva Horvath   | 35                  | 7                     | 
| 22 | Anna Nagy     | 1         | Gabor Nagy    | 30                  | 5                     | 
| 24 | Katalin Varga | 8         | Ferenc Kovacs | 26                  | 4                     | 
| 27 | Andras Farkas | 1         | Gabor Nagy    | 33                  | 8                     | 
| 1  | Gabor Nagy    | 10        | Laszlo Nagy   | 25                  | 1                     |     
| 2  | Istvan Kiss   | 10        | Laszlo Nagy   | 30                  | 6                     | 
| 4  | Eva Horvath   | 10        | Laszlo Nagy   | 28                  | 4                     | 
| 5  | Katalin Szabo | 10        | Laszlo Nagy   | 35                  | 11                    | 
| 6  | Andras Kovacs | 10        | Laszlo Nagy   | 32                  | 8                     | 
| 7  | Anita Molnar  | 10        | Laszlo Nagy   | 27                  | 3                     | 
| 9  | Lilla Toth    | 10        | Laszlo Nagy   | 33                  | 9                     | 


```{postgresql}
-- Your solution goes here
```

## Assignment 4.8

Retrieve a list of employees who have a number of yearly leave days greater than the average yearly leave days for
their respective band.  
For each of these employees, display the following information:  
employee ID (emp.id), Employee's first name (first_name), employee's last name (last_name), the number
of yearly leave days allocated to the employee (yearly_leave_days), the name of the band to which the employee
belongs (bands.name). Alongside the information for each employee, also calculate and display the average
number of yearly leave days for all employees within the same band as the employee.  
This average should be shown as a separate column (avg_leave_days).  
**Hint:** Use, generalize the query below in your solution:  
`SELECT AVG(yearly_leave_days) FROM employees e WHERE e.band_id = 2;`

**Expected results:** 13 rows

| id | first_name | last_name | yearly_leave_days | band_name  |      avg_leave_days |
|---:|------------|-----------|------------------:|------------|--------------------:|
| 12 | Balazs     | Toth      |                30 | Junior 2   |                25.4 |
| 13 | Gabor      | Nagy      |                28 | Mid-Senior |                  23 |
| 14 | Katalin    | Szabo     |                35 | Senior 1   | 30.3333333333333333 |
| 18 | Zsuzsa     | Papp      |                33 | Junior 1   | 27.6666666666666667 |
| 21 | Gabor      | Kovacs    |                25 | Mid-Senior |                  23 |
| 22 | Anna       | Nagy      |                30 | Senior 3   |               29.25 |
| 27 | Andras     | Farkas    |                33 | Senior 3   |               29.25 |
| 28 | Krisztina  | Toth      |                24 | Mid-Senior |                  23 |
|  2 | Istvan     | Kiss      |                30 | Junior 2   |                25.4 |
|  5 | Katalin    | Szabo     |                35 | Senior 2   |                28.5 |
|  6 | Andras     | Kovacs    |                32 | Senior 3   |               29.25 |
|  7 | Anita      | Molnar    |                27 | Senior 4   |                  24 |
|  9 | Lilla      | Toth      |                33 | Senior 2   |                28.5 |

```{postgresql}
-- Your solution goes here
```

## Assignment 4.9

Display the employee ID, first name, last name, and the name of the customer they are currently
assigned to for an active(ongoing) project.  
Ensure the results do not contain any repeated rows.  
**Note:** Avoid using subqueries for this task.

**Expected results:** 13 rows

| id | first_name | last_name | customer        |
|----|------------|-----------|-----------------|
| 1  | Gabor      | Nagy      | GE              |
| 1  | Gabor      | Nagy      | WizzAir         |
| 2  | Istvan     | Kiss      | GE              |
| 2  | Istvan     | Kiss      | Johnson&Johnson |
| 3  | Zoltan     | Toth      | GE              |
| 4  | Eva        | Horvath   | Johnson&Johnson |
| 6  | Andras     | Kovacs    | WizzAir         |
| 7  | Anita      | Molnar    | WizzAir         |
| 9  | Lilla      | Toth      | WizzAir         |
| 10 | Laszlo     | Nagy      | Johnson&Johnson |
| 10 | Laszlo     | Nagy      | WizzAir         |
| 11 | Anna       | Kovacs    | Johnson&Johnson |
| 12 | Balazs     | Toth      | Johnson&Johnson |

```{postgresql}
-- Your solution goes here
```

## Assignment 4.10 (optional, for 0.25 extra points)

Display the employee ID, first name, last name, and the name of the on-going project they are currently
assigned to (project_assignments.end_date is null) for an active(ongoing) project where the number of employees
assigned to the project is greater than 4.

**Expected results:** 10 rows

| id | first_name | last_name | project_name                                | nr_assigned_employees |
|----|------------|-----------|---------------------------------------------|-----------------------|
| 1  | Gabor      | Nagy      | PivotPulse: Dynamic BI Query Engine         | 5                     |
| 2  | Istvan     | Kiss      | NexaNode: Scalable Data Warehouse Solutions | 5                     |
| 4  | Eva        | Horvath   | NexaNode: Scalable Data Warehouse Solutions | 5                     |
| 6  | Andras     | Kovacs    | PivotPulse: Dynamic BI Query Engine         | 5                     |
| 7  | Anita      | Molnar    | PivotPulse: Dynamic BI Query Engine         | 5                     |
| 9  | Lilla      | Toth      | PivotPulse: Dynamic BI Query Engine         | 5                     |
| 10 | Laszlo     | Nagy      | NexaNode: Scalable Data Warehouse Solutions | 5                     |
| 10 | Laszlo     | Nagy      | PivotPulse: Dynamic BI Query Engine         | 5                     |
| 11 | Anna       | Kovacs    | NexaNode: Scalable Data Warehouse Solutions | 5                     |
| 12 | Balazs     | Toth      | NexaNode: Scalable Data Warehouse Solutions | 5                     |

```{postgresql}
-- Your solution goes here
```

