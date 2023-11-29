# Homework assignment 06


## 1. Objectives
The objective of this assignment is to develop an understanding of grouping and aggregate functions.

## 2. Dedicated schema

The `practice_06` schema has been created for you within your dedicated database.
Please set the search path accordingly:

```{postgresql}
SET search_path TO practice_06;
```

## 3. Assignments
### Assignment 6.1
List the id, last name, first name of employees who do not have any leave requests in the `leave_days` table for 2023.  
**Remark 1:** for the simplicity a leave period is considered to be in  2023 if the 
start_date is in 2023.


### Assignment 6.2
Write a query that returns the employees that have no rejected leave requests in July 2023.  
The result should contain the following columns: id, first_name, last_name and should be ordered 
by the last_name and first_name of the employees.  

**Remark 1:** for the simplicity a leave period is considered to be in July 2023 if the 
start_date is in July.  
**Remark 2:** you should count those employees that have no leave requests in July 2023
or have only approved pr pending leave requests in July 2023.

**Expected output:** 8 rows    

| id | first\_name | last\_name |
| :--- | :--- | :--- |
| 27 | Andras | Farkas |
| 4 | Eva | Horvath |
| 29 | Bela | Nagy |
| 26 | Eva | Szabo |
| 5 | Katalin | Szabo |
| 28 | Krisztina | Toth |
| 3 | Zoltan | Toth |
| 19 | Laszlo | Varga |

For this assignment you should provide **two different solutions**.  
**Solution 6.2.A**: use the EXCEPT set operator, and do not use the DISTINCT operator.  
**Hint:** First, you should collect the id of those employees that have rejected leave requests in July 2023.  
Second, you should collect the id of all employees and then use the EXCEPT set operator to remove the ids of
those employees that have rejected leave requests in July 2023.  
Take the remaining ids and join them with the employees table to get the required result.


```{postgresql}
-- Your solution for assignment 6.1.A goes here
```
**Solution 6.2.B:** Do not use the EXCEPT set operator, use LEFT OUTER JOIN instead.
**Hint:** First, you should collect the id of those employees that have rejected leave requests in July 2023
using the GROUP BY clause on the `leave_days` table.  
Use the `employees` table to left outer join the derived table obtained in the previous step.

```{postgresql}
-- Your solution for assignment 6.1.B goes here
```

### Assignment 6.3
Provide a concatenated list containing the distribution of employees by their bands and business units.  
The result should contain the following columns: `subject`, `nr_employees`, `is_band`, `is_business_unit`.  
**Hint 1:**  
- create two separate CTEs with the band and business unit distribution/statistics
- As a firts query join the band statistics with bands table and add a new column `is_band` with value `true`, 
`business_unit` with value `false`
- As second query join the business unit statistics with business_units table and add a new column `is_band` with value `false`, 
`business_unit` with value `true`
- As final step combine the results of the two queries using the `UNION` set operator
**Hint :** use the `UNION` set operator to combine the results of two queries.

**Expected output:** 14 rows

| subject | nr\_employees | is\_band | is\_business\_unit |
| :--- |--------------:|---------:|-------------------:|
| Mid-Senior |             6 |     true |              false |
| Junior 2 |             5 |     true |              false |
| Senior 3 |             4 |     true |              false |
| Senior 2 |             4 |     true |              false |
| Junior 1 |             3 |     true |              false |
| Senior 1 |             3 |     true |              false |
| Senior 4 |             3 |     true |              false |
| Band not assigned yet |             1 |     true |              false |
| Business unit not assigned yet |             6 |    false |               true |
| Consulting 2 |             6 |    false |               true |
| Team Augmentation 2 |             5 |    false |               true |
| Team augmentation 1 |             5 |    false |               true |
| Managed services |             4 |    false |               true |
| Consulting 1 |             3 |    false |               true |
