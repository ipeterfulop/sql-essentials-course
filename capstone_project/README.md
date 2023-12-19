# Capstone project
## 1. Project description
The capstone project involves the widely recognized `employees` database, 
which has been updated with additional tables to facilitate the creation 
of more complex queries.  
While it bears resemblance to previous homework assignments, this project incorporates novel forms of assignment structures, enhancing both its difficulty and engagement factor. 

# 2. Dedicated schema
The capstone project will be conducted in a dedicated schema, named `capstone`.

# 3. Assignments

## 3.1 Warm-up

### 3.1.1 Working with a single table

Categories of expertise are stored in the `expertiseareas` table and are organised on two levels.  
List all the area of expertise that and their category of expertise  in alphabetical order of the category of expertise 
and then in alphabetical order of the area of expertise.

**Expected output**: 24 rows  

| category\_of\_expertise | area\_of\_expertise |
| :--- | :--- |
| Business Intelligence Tools | Power BI |
| Business Intelligence Tools | Tableau |
| Cloud Platforms | AWS |
| Cloud Platforms | Azure |
| Cloud Platforms | GCP |
| Data Governance | Data Quality |
| Data Governance | Data Security |
| Data Modeling | Dimensional Modeling |
| Data Modeling | ERD Design |
| Data Processing Frameworks | Apache Spark |
| Data Processing Frameworks | Hadoop |
| Data Visualization | Matplotlib |
| Data Visualization | Seaborn |
| Data Warehousing | Amazon Redshift |
| Data Warehousing | Google BigQuery |
| Data Warehousing | Snowflake |
| Machine Learning | Deep Learning |
| Machine Learning | Natural Language Processing |
| Machine Learning | Supervised Learning |
| Machine Learning | Unsupervised Learning |
| Programming Languages | Java |
| Programming Languages | Python |
| Programming Languages | R |
| Programming Languages | SQL |

```sql
-- Your solution goes here.
```

### 3.1.2 Building some statistics still working with a single table
List the categories of area of expertise 
and the number of area of expertise in each category in descending order of the number of area of expertise.
Do NOT exclude the categories of area of expertise without any area of expertise.   

**Expected output**: 10 rows  

| name | nr\_areas\_of\_expertise |
| :--- |-------------------------:|
| Machine Learning |                        4 |
| Programming Languages |                        4 |
| Data Warehousing |                        3 |
| Cloud Platforms |                        3 |
| Data Governance |                        2 |
| Data Visualization |                        2 |
| Data Processing Frameworks |                        2 |
| Business Intelligence Tools |                        2 |
| Data Modeling |                        2 |
| Data mining |                        0 |

### 3.1.3 Start working with multiple tables
Arrange in alphabetical order the ids, last names, and first names of employees 
who possess at least one area of expertise within the "Programming Languages" 
category, as assigned in the employee_expertisearea table.

### 3.1.4 Wrangling with data from multiple tables
Arrange in alphabetical order the ids, last_names and first_names of employees 
who have at least one or more expertise from the "Programming Languages" 
and "Cloud Platforms" area of expertise categories 
but do not have any expertise from the "Data Visualization" category.

## 3.2 Decode the query

## 3.3 Correct my mistakes

## 3.4 Fill in the blanks
**Goal**: the goal of this assignment section is 
reading and understanding the structure of a query, query written by someone else.

### 3.4.1 Guess more than one query section at a time
```sql
SELECT bu.name, COALESCE(__________, 0) as __________
FROM business_units bu
         LEFT OUTER JOIN (SELECT COUNT(*) nr_employees, business_unit_id
                          FROM employees
                          GROUP BY ___________) stats
         ON (bu.id = stats.business_unit_id)
WHERE __________ IS NULL;
```
If `_________` are filled in correctly, the output should be as follows:
**Expected output**: 1 row  

| name | number\_of\_employees |
| :--- |----------------------:|
| Generative AI |                     0 |

### 3.4.2 Are you ready to think about date manipulation?
```sql
SELECT to_____(current_date, '_________________________, YYYY') as spelled_out_date;
```
If `_________` are filled in correctly, the output should be as follows:
**Expected output**: 1 row

| spelled\_out\_date |
| :--- |
| Tuesday, 19th of December, 2023 |

Remark: the output of the query depends on the current date. Expect a different date when you write your own solution.






## 3.5 Manipulate the data
**Goal**: the goal of this assignment section is to practice DML statements.  

### 3.5.1 Add new rows to a table
1. Insert fifteen (3x5) entries into the `annual_employee_awards` table, 
distributed over the years 2021, 2022, and 2023, ensuring 
that at least one individual receives an award each year.   
2. Subsequently, compose a query to identify individuals who have been recipients of awards in each of the 
years 2021, 2022, and 2023.

```sql
-- (1) Your INSERT statements go here.
```

```sql
--- (2) Your SELECT statement goes here.
```

### 3.5.2 Update existing rows in a table
Use the ```UPDATE``` statement to set the award to "3 extra vacation days" to all the employees rewarded in 2023.

```sql
-- Your UPDATE statement goes here.
```

### 3.5.3 Delete existing rows from a table
Use the ```DELETE``` statement to delete all the employees rewarded in 2021.

```sql
-- Your DELETE statement goes here.
```  

## 3.6 Use the documentation
**Goal**: the goal of this assignment section is to get you familiar with 
the documentation of the RDBMS you are working with or use online
resources to use new features of the RDBMS. 

### 3.6.1 Random Number Generation
Write a query to generate 100 random numbers. 
Each number should be an integer. The range of these numbers should be between 1 and 100, inclusive.  
Display a list of the top 10 most frequently occurring random numbers from a set of 100 random numbers
in the descending order of their frequency.

** A possible output:** 10 rows  

| random\_number | nr\_occurrence |
|---------------:|---------------:|
|              6 |              5 |
|             48 |              5 |
|             92 |              4 |
|             60 |              4 |
|             83 |              4 |
|             81 |              4 |
|             19 |              3 |
|             65 |              3 |
|             98 |              3 |
|             93 |              2 |

### 3.6.2 Creating a table from a query result
Using `CREATE TABLE ... AS` command to create a new table named `random_number_occurrences`.  
**Important Notes:**  
 - Table Structure: The new table random_number_occurrences will have two columns: random_number and nr_occurrence.
 - Data Type: The data types of the columns in the new table will be inferred from the query.  
In this case, random_number will likely be an integer, and nr_occurrence will also be an integer (count).  
- Regeneration of Data: Each time you run this `CREATE TABLE AS` command, it will generate a new set of random numbers. 
If the table already exists, you'll get an error. To avoid this use `CREATE TABLE IF NOT EXISTS` 
- (which won't overwrite the existing table) then try running the command again.

## 3.7 Put your creativity to work
**Goal**: the goal of this assignment is to get you to think about problems 
in the context of the capstone schema that can be solved using specific elements of SQL.

### 3.7.1 Make proof of using the EXCEPT set operator
Formulate your own assignment and write the solver query using the EXCEPT set operator.

### 3.7.2 Make proof of using LEFT OUTER JOIN and RIGHT OUTER JOIN
Formulate your own assignment and write the solver query
1. using  LEFT OUTER JOIN
2. using RIGHT OUTER JOIN

### 3.7.3 Make proof of WITH and GROUP BY clauses
Formulate your own assignment and write the solver query that creates a CTE for intermediate results.  
Employ the GROUP BY clause within the CTE or the main query.

### 3.7.4 Make proof of using correlated subqueries
Formulate your own assignment that:
1. can be solved using a correlated subquery.  
2. If possible, write a second alternative query that does not use a correlated subquery.




