# Homework assignment 06
<!-- TOC -->
* [Homework assignment 06](#homework-assignment-06)
  * [1. Objectives](#1-objectives)
  * [2. Dedicated schema](#2-dedicated-schema)
  * [3. Assignments](#3-assignments)
    * [Assignment 6.1](#assignment-61)
    * [Assignment 6.2](#assignment-62)
    * [Assignment 6.3](#assignment-63)
    * [Assignment 6.4](#assignment-64)
    * [Assignment 6.5](#assignment-65)
<!-- TOC -->

## 1. Objectives
The objective of this assignment is to develop an understanding of set operators 
and to practice grouping and aggregate functions.

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

### Assignment 6.4
Lately the company identified a CRITICAL error in the management of the leave days for the year 2023.
For each employee please check if the number of approved leave days is higher that the allowed
number of leave days (`employees.yearly_leave_days),

**Expected output:** 29 rows  

| id | last\_name | first\_name | yearly\_leave\_days | nr\_of\_days\_approved | leave\_days\_remaining |
| :--- | :--- | :--- |--------------------:|-----------------------:|-----------------------:|
| 23 | Kiss | Ferenc |                  22 |                     49 |                    -27 |
| 17 | Molnar | Tamas |                  23 |                     50 |                    -27 |
| 8 | Kovacs | Ferenc |                  22 |                     48 |                    -26 |
| 19 | Varga | Laszlo |                  24 |                     45 |                    -21 |
| 15 | Horvath | Istvan |                  20 |                     40 |                    -20 |
| 20 | Biro | Noemi |                  21 |                     40 |                    -19 |
| 24 | Varga | Katalin |                  26 |                     45 |                    -19 |
| 21 | Kovacs | Gabor |                  25 |                     42 |                    -17 |
| 7 | Molnar | Anita |                  27 |                     44 |                    -17 |
| 3 | Toth | Zoltan |                  20 |                     36 |                    -16 |
| 25 | Kovacs | Miklos |                  28 |                     43 |                    -15 |
| 6 | Kovacs | Andras |                  32 |                     46 |                    -14 |
| 9 | Toth | Lilla |                  33 |                     45 |                    -12 |
| 10 | Nagy | Laszlo |                  24 |                     35 |                    -11 |
| 12 | Toth | Balazs |                  30 |                     41 |                    -11 |
| 2 | Kiss | Istvan |                  30 |                     39 |                     -9 |
| 5 | Szabo | Katalin |                  35 |                     44 |                     -9 |
| 4 | Horvath | Eva |                  28 |                     37 |                     -9 |
| 13 | Nagy | Gabor |                  28 |                     35 |                     -7 |
| 16 | Kiss | Eva |                  22 |                     29 |                     -7 |
| 11 | Kovacs | Anna |                  25 |                     30 |                     -5 |
| 18 | Papp | Zsuzsa |                  33 |                     38 |                     -5 |
| 1 | Nagy | Gabor |                  25 |                     25 |                      0 |
| 22 | Nagy | Anna |                  30 |                     26 |                      4 |
| 14 | Szabo | Katalin |                  35 |                     26 |                      9 |
| 26 | Szabo | Eva |                  20 |                      0 |                     20 |
| 29 | Nagy | Bela |                  21 |                      0 |                     21 |
| 28 | Toth | Krisztina |                  24 |                      0 |                     24 |
| 27 | Farkas | Andras |                  33 |                      0 |                     33 |



### Assignment 6.5

After the company's management board identified an error in the leave management system, they have requested a detailed report on the leave requests for the year 2023.   
**Remark:** for the simplicity a leave period is considered to be in 2023 if the start_date is in 2023.  
**Hint:**   
- create 3 separate CTEs for statistics related to approved, rejected and pending leave requests.
- join the employees table with the 3 CTEs to get the required result. As some employees may not have any leave requests in 2023, you should use the LEFT OUTER JOIN.
- use the COALESCE function to replace the NULL values with 0.


**Expected output:** 29 rows  


| id | last\_name | first\_name | nr\_of\_approved\_requests | nr\_of\_approved\_leave\_days | nr\_of\_rejected\_requests | nr\_of\_rejected\_leave\_days | nr\_of\_pending\_requests | nr\_of\_pending\_leave\_days |
| :--- | :--- | :--- |---------------------------:|------------------------------:|---------------------------:|------------------------------:|--------------------------:|-----------------------------:|
| 17 | Molnar | Tamas |                         27 |                            50 |                         25 |                            29 |                         0 |                            0 |
| 23 | Kiss | Ferenc |                         29 |                            49 |                         23 |                            40 |                         0 |                            0 |
| 8 | Kovacs | Ferenc |                         35 |                            48 |                         17 |                            28 |                         0 |                            0 |
| 6 | Kovacs | Andras |                         31 |                            46 |                         21 |                            37 |                         0 |                            0 |
| 19 | Varga | Laszlo |                         30 |                            45 |                         22 |                            37 |                         0 |                            0 |
| 9 | Toth | Lilla |                         27 |                            45 |                         25 |                            33 |                         0 |                            0 |
| 24 | Varga | Katalin |                         32 |                            45 |                         20 |                            24 |                         0 |                            0 |
| 5 | Szabo | Katalin |                         30 |                            44 |                         18 |                            17 |                         0 |                            0 |
| 7 | Molnar | Anita |                         28 |                            44 |                         24 |                            50 |                         0 |                            0 |
| 25 | Kovacs | Miklos |                         27 |                            43 |                         25 |                            31 |                         0 |                            0 |
| 21 | Kovacs | Gabor |                         23 |                            42 |                         29 |                            54 |                         0 |                            0 |
| 12 | Toth | Balazs |                         22 |                            41 |                         30 |                            51 |                         0 |                            0 |
| 15 | Horvath | Istvan |                         27 |                            40 |                         25 |                            49 |                         0 |                            0 |
| 20 | Biro | Noemi |                         31 |                            40 |                         21 |                            30 |                         0 |                            0 |
| 2 | Kiss | Istvan |                         28 |                            39 |                         24 |                            40 |                         0 |                            0 |
| 18 | Papp | Zsuzsa |                         23 |                            38 |                         29 |                            42 |                         0 |                            0 |
| 4 | Horvath | Eva |                         24 |                            37 |                         23 |                            33 |                         0 |                            0 |
| 3 | Toth | Zoltan |                         26 |                            36 |                         23 |                            33 |                         0 |                            0 |
| 10 | Nagy | Laszlo |                         25 |                            35 |                         27 |                            41 |                         0 |                            0 |
| 13 | Nagy | Gabor |                         23 |                            35 |                         29 |                            43 |                         0 |                            0 |
| 11 | Kovacs | Anna |                         25 |                            30 |                         27 |                            43 |                         0 |                            0 |
| 16 | Kiss | Eva |                         20 |                            29 |                         32 |                            42 |                         0 |                            0 |
| 22 | Nagy | Anna |                         21 |                            26 |                         31 |                            40 |                         0 |                            0 |
| 14 | Szabo | Katalin |                         25 |                            26 |                         27 |                            48 |                         0 |                            0 |
| 1 | Nagy | Gabor |                         21 |                            25 |                         31 |                            53 |                         0 |                            0 |
| 26 | Szabo | Eva |                          0 |                             0 |                          0 |                             0 |                         0 |                            0 |
| 27 | Farkas | Andras |                          0 |                             0 |                          0 |                             0 |                         0 |                            0 |
| 28 | Toth | Krisztina |                          0 |                             0 |                          0 |                             0 |                         0 |                            0 |
| 29 | Nagy | Bela |                          0 |                             0 |                          0 |                             0 |                         0 |                            0 |



