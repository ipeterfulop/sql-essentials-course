# Homework assignment 05

<!-- TOC -->
* [Homework assignment 05](#homework-assignment-05)
  * [Objectives](#objectives)
  * [Dedicated schema](#dedicated-schema)
  * [Assignments](#assignments)
    * [Assignment 5.1](#assignment-51)
    * [Assignment 5.2](#assignment-52)
    * [Assignment 5.3](#assignment-53)
    * [Assignment 5.4](#assignment-54-)
    * [Assignment 5.5](#assignment-55)
    * [Assignment 5.6](#assignment-56)
    * [Assignment 5.7](#assignment-57)
    * [Assignment 5.8 (optional, 0.25 points)](#assignment-58-optional-025-points)
<!-- TOC -->

## Objectives
The objective of this assignment is to develop an understanding of grouping and aggregate functions.

## Dedicated schema

The `practice_05` schema has been created for you within your dedicated database.
Please set the search path accordingly:

```{postgresql}
SET search_path TO practice_05;
```

## Assignments
### Assignment 5.1
Create a SQL query to calculate the mean salary for each job title in the 'employees' table.  
The query should output the job title's name and its corresponding average salary, with the salary values rounded to two decimal places.  
Additionally, the results should be sorted in decreasing order based on the average salary.  
**Hints**: Use the `AVG()` aggregate function. Exclude the employees with `NULL` job titles.

**Expected output:** 5 rows    

| Job title              |  Average salary  |
|:-----------------------|-----------------:|
| Data Scientist         |             3780 |
| BI developer           |          3416.67 |
| BI Support specialist  |             3275 |
| Data engineer          |             2920 |
| Manager                |             2625 |

### Assignment 5.2
Show the minimum, maximum, and average age of employees in every business unit.  
Omit employees who are not assigned 
to any business unit, but include business units that do not have any employees.  
Order the results by the business unit's name in ascending order.

**Expected output:** 6 rows  

| **business_unit**   |  **min_age** |  **max_age** |  **avg_age** |
|---------------------|-------------:|-------------:|-------------:|
| Consulting 1        |           29 |           33 |           32 |
| Consulting 2        |           25 |           38 |           32 |
| Generative AI       |         NULL |         NULL |         NULL |
| Managed services    |           26 |           31 |           28 |
| Team augmentation 1 |           25 |           31 |           28 |
| Team Augmentation 2 |           25 |           38 |           30 |

### Assignment 5.3
Calculate the total number of employees in each business unit. For employees without a business 
unit, label them as 'No business unit assigned yet'. Additionally, include business units with 
no employees, indicating them with a count of 0.  
Sort the results by the name of the business unit in ascending order.  
**Hint**: Use the `COALESCE()` function to replace `NULL` values with a default value.  

**Expected output:** 7 rows  

| **business_unit**              |  **number_of_employees** |
|:-------------------------------|-------------------------:|
| Consulting 1                   |                        3 |
| Consulting 2                   |                        6 |
| Generative AI                  |                        0 |
| Managed services               |                        4 |
| Team augmentation 1            |                        5 |
| Team Augmentation 2            |                        5 |
| No business unit assigned yet  |                        6 |

### Assignment 5.4 
Identify the three most prevalent official languages based on the number of countries where 
they are recognized as official. Display each language's name along with the count of countries 
recognizing it as an official language.

**Expected output:** 3 rows

| **Language**  |  **Number of countries** |
|:--------------|-------------------------:|
| English       |                       53 |
| French        |                       31 |
| Arabic        |                       24 |

### Assignment 5.5
Display the names, capitals, and official languages of countries where the official 
language is among the top three most common official languages globally 
(collected in assingment 5.4). Order the results by the country's name in ascending order.    
Please note that some countries have more than one official language.  

**Expected output:** 108 rows  

| Country                  | Capital      | Official language |
|--------------------------|--------------|-------------------|
| Algeria                  | Algiers      | Arabic            |
| Antigua and Barbuda      | Saint John's | English           |
| Bahamas                  | Nassau       | English           |
| Bahrain                  | Manama       | Arabic            |
| Barbados                 | Bridgetown   | English           |
| Belgium                  | Brussels     | French            |
| Belize                   | Belmopan     | English           |
| Benin                    | Porto-Novo   | French            |
| Bermuda                  | Hamilton     | English           |
| Botswana                 | Gaborone     | English           |
| ...                      | ...          | ...               |
| Turks and Caicos Islands | Grand Turk   | English           |
| Tuvalu                   | Funafuti     | English           |
| Uganda                   | Kampala      | English           |
| United Arab Emirates     | Abu Dhabi    | Arabic            |
| Vanuatu                  | Port-Vila    | English           |
| Vanuatu                  | Port-Vila    | French            |
| Yemen                    | Sana'a       | Arabic            |
| Zambia                   | Lusaka       | English           |
| Zimbabwe                 | Harare       | English           |


### Assignment 5.6
Calculate the number of different job titles held by employees assigned to each project.    
Sort this list first by project name in ascending order, and then by the count of 
employees in descending order.  
**Hint**: Combine the `projects`, `project_assignments`, `employees` and `job_titles` tables. Group the results
by the project name and the job title name.

**Expected output:** 13 rows  

| project_name                                            | job_title             |  number_of_employees |
|---------------------------------------------------------|-----------------------|---------------------:|
| BIOasis: Business Intelligence Optimization & Analytics | BI developer          |                    1 |
| BIOasis: Business Intelligence Optimization & Analytics | Data engineer         |                    1 |
| BIOasis: Business Intelligence Optimization & Analytics | Manager               |                    1 |
| DataSculpt: Streamlined ETL Pipelines                   | BI Support specialist |                    1 |
| DataSculpt: Streamlined ETL Pipelines                   | Data engineer         |                    1 |
| NexaNode: Scalable Data Warehouse Solutions             | BI developer          |                    2 |
| NexaNode: Scalable Data Warehouse Solutions             | Data engineer         |                    1 |
| NexaNode: Scalable Data Warehouse Solutions             | BI Support specialist |                    1 |
| NexaNode: Scalable Data Warehouse Solutions             | Data Scientist        |                    1 |
| PivotPulse: Dynamic BI Query Engine                     | Data engineer         |                    2 |
| PivotPulse: Dynamic BI Query Engine                     | BI developer          |                    1 |
| PivotPulse: Dynamic BI Query Engine                     | BI Support specialist |                    1 |
| PivotPulse: Dynamic BI Query Engine                     | Data Scientist        |                    1 |


### Assignment 5.7
For each business unit, determine the count of distinct job titles held by its employees.  
Arrange this list initially by the name of the business unit, and then by the number of 
employees holding each job title. Exclude any employees who have either a NULL business unit ID or NULL job title ID.

**Expected output:** 11 rows  

| business_unit       | job_title             |  number_of_employees |
|---------------------|-----------------------|---------------------:|
| Consulting 1        | Data engineer         |                    2 |
| Consulting 1        | BI Support specialist |                    1 |
| Consulting 2        | BI developer          |                    5 |
| Consulting 2        | Data engineer         |                    1 |
| Managed services    | Manager               |                    3 |
| Managed services    | BI developer          |                    1 |
| Team augmentation 1 | Data Scientist        |                    2 |
| Team augmentation 1 | Data engineer         |                    2 |
| Team augmentation 1 | Manager               |                    1 |
| Team Augmentation 2 | BI Support specialist |                    3 |
| Team Augmentation 2 | Data Scientist        |                    2 |

### Assignment 5.8 (optional, 0.25 points)
Display a list of employees' full names, their associated business units, and salaries for those earning 
the second highest salary within their respective business units.  
Order the list by the business unit name in ascending order, and then by the employee's full name in ascending order.  

**Expected output:** 6 rows

| full_name     | business_unit       | salary |
|---------------|---------------------|--------|
| Katalin Varga | Consulting 1        | 2600   |
| Gabor Kovacs  | Consulting 2        | 3500   |
| Istvan Kiss   | Consulting 2        | 3500   |
| Miklos Kovacs | Managed services    | 3100   |
| Bela Nagy     | Team augmentation 1 | 3100   |
| Anna Nagy     | Team Augmentation 2 | 3800   |

