# Learning session 3
<!-- TOC -->

  * [Topics](#topics)
  * [Additional information](#additional-information)
  * [Data setup](#data-setup)
<!-- TOC -->

## Topics
In the third learning session we will cover combining data from multiple tables. 
We will explore the different types of joins:
- INNER JOIN 
- OUTER JOINs (LEFT, RIGHT, FULL)
- SELF JOIN
- CROSS JOIN

and how to use them.

## Additional information
If you would like to discover what columns of the ```employees``` table are 
referencing columns from other tables, you can use the following query:

```postgresql
SELECT
    conname AS constraint_name,
    conrelid::regclass AS table_name,
    a.attname AS column_name,
    confrelid::regclass AS foreign_table_name,
    af.attname AS foreign_column_name
FROM
    pg_constraint c
JOIN
    pg_attribute a ON a.attnum = ANY(c.conkey) AND a.attrelid = c.conrelid
JOIN
    pg_attribute af ON af.attnum = ANY(c.confkey) AND af.attrelid = c.confrelid
WHERE
    conrelid = 'employees'::regclass;
```
You should get a result similar to the following:

|constraint_name|table_name|column_name|foreign_table_name|foreign_column_name|
|----------------------|----------------------|----------------------|----------------------|----------------------|
|employees_band_id_fkey|employees|band_id|bands|id|
|employees_job_title_id_fkey|employees|job_title_id|job_titles|id|
|employees_lead_employee_id_fkey|employees|lead_employee_id|employees|id|
|employees_native_language_id_fkey|employees|native_language_id|languages|id|
|employees_preferred_language_id_fkey|employees|preferred_language_id|languages|id|
|employees_residence_country_id_fkey|employees|residence_country_id|countries|code|

If you prefer using diagrams to discover how tables are related, you can use this one:
![](/Users/peterfulop.me/code/sql-essentials-course/session_03/db_diagram_practice_03.png)

## Data setup
The tables related to this learning session were created in the ```practice_03``` schema using the script
[`create_tables.sql`](data_setup/create_tables.sql).  
Tables were populated with data using the script 
[`populate_tables_practice_03.sql`](data_setup/populate_tables_practice_03.sql).
You can use these scripts to create the tables and populate them with data in your own local database.

