# 1. The movies database assignments O2

<!-- TOC -->
* [1. The movies database assignments O2](#1-the-movies-database-assignments-o2)
* [2. Assignments](#2-assignments)
  * [Assigment O2.1](#assigment-o21)
  * [Assigment O2.2](#assigment-o22)
  * [Assigment O2.3](#assigment-o23)
  * [Assigment O2.4](#assigment-o24)
  * [Assigment O2.5](#assigment-o25)
  * [Assigment O2.6](#assigment-o26)
  * [Assignment O2.7](#assignment-o27)
<!-- TOC -->

# 2. Assignments
## Assigment O2.1
Show the number of movies per genre for each production company. 
You should only include (production_company, genre) pairs for which there are more than 50 movies.  
Sort the results by the name of the genre alphabetically and by the number of movies in descending order.   
**Hint:** You can start by creating a CTE that calculates the number of movies per genre 
for each production company. To effectuate this, you can join the ```movie_genres``` table with the ```movie``` and 
```movie_company``` tables.
As a final step, you can join the CTE with the ```genre``` and ```production_company``` tables to get the names of the genres

```sql
-- Your solution goes here.
```
**Expected output:** 35 rows

| company\_name |   genre\_name   | nr\_movies |
| :--- |:---------------:|-----------:|
| Warner Bros. |     Action      |        112 |
| Paramount Pictures |     Action      |         94 |
| Twentieth Century Fox Film Corporation |     Action      |         92 |
| Universal Pictures |     Action      |         86 |
| Columbia Pictures |     Action      |         65 |
| Paramount Pictures |    Adventure    |         82 |
| Warner Bros. |    Adventure    |         81 |
| Twentieth Century Fox Film Corporation |    Adventure    |         62 |
| Universal Pictures |    Adventure    |         61 |
| Universal Pictures |     Comedy      |        142 |
| Paramount Pictures |     Comedy      |        100 |
| Columbia Pictures |     Comedy      |         96 |
| Warner Bros. |     Comedy      |         93 |
| Twentieth Century Fox Film Corporation |     Comedy      |         85 |
| New Line Cinema |     Comedy      |         74 |
| Touchstone Pictures |     Comedy      |         56 |
| Walt Disney Pictures |     Comedy      |         55 |
| Warner Bros. |      Crime      |         69 |
| Warner Bros. |      Drama      |        151 |
| Universal Pictures |      Drama      |        118 |
| Paramount Pictures |      Drama      |        110 |
| Columbia Pictures |      Drama      |         86 |
| Twentieth Century Fox Film Corporation |      Drama      |         83 |
| Touchstone Pictures |      Drama      |         68 |
| Miramax Films |      Drama      |         61 |
| New Line Cinema |      Drama      |         55 |
| Metro-Goldwyn-Mayer \(MGM\) |      Drama      |         54 |
| Walt Disney Pictures |     Family      |         91 |
| Warner Bros. |     Fantasy     |         54 |
| Universal Pictures |     Romance     |         66 |
| Twentieth Century Fox Film Corporation | Science Fiction |         56 |
| Warner Bros. |    Thriller     |        105 |
| Paramount Pictures |    Thriller     |        102 |
| Universal Pictures |    Thriller     |         83 |
| Twentieth Century Fox Film Corporation |    Thriller     |         67 |

## Assigment O2.2
List the name of the person who played in more than one movie with Anthony Hopkins.  
Use the ```select person_id from person where person_name = 'Anthony Hopkins'``` query to get the ```person_id``` of Anthony Hopkins.  
**Hint:**
- You can start by creating a CTE that collects the ```movie_id```s of the movies in which Anthony Hopkins played. 
- Then, you can join the CTE with the ```movie_cast``` and ```person``` tables to get the names of the persons 
who played in the same movies as Anthony Hopkins.
- Finally, you can group the results by ```person_id``` and ```person_name``` and count the number of movies in which each person played.
- Do not forget to exclude Anthony Hopkins from the results.

```sql
-- Your solution goes here.
```

**Expected output:** 41 rows

| person\_name           | nr\_movies |
|:-----------------------|-----------:|
| Stellan Skarsgård      |          3 |
| Tim Pigott-Smith       |          3 |
| Ray Stevenson          |          2 |
| Natalie Portman        |          2 |
| Rene Russo             |          2 |
| Ray Winstone           |          2 |
| Antonio Banderas       |          2 |
| Pat McNamara           |          2 |
| Tadanobu Asano         |          2 |
| John Standing          |          2 |
| Jaimie Alexander       |          2 |
| Angelina Jolie         |          2 |
| Mary-Louise Parker     |          2 |
| John Malkovich         |          2 |
| Brad Pitt              |          2 |
| Laurence Olivier       |          2 |
| Tom Hiddleston         |          2 |
| Brooke Smith           |          2 |
| Benicio del Toro       |          2 |
| Emma Thompson          |          2 |
| Jake Weber             |          2 |
| Brendan Gleeson        |          2 |
| Lee Byung-hun          |          2 |
| L.Q. Jones             |          2 |
| Kat Dennings           |          2 |
| Catherine Zeta-Jones   |          2 |
| Neil Jackson           |          2 |
| Stan Lee               |          2 |
| Dexter Fletcher        |          2 |
| Garrick Hagon          |          2 |
| Roger Ashton-Griffiths |          2 |
| David Paymer           |          2 |
| Jeffrey Tambor         |          2 |
| Anthony Heald          |          2 |
| Chris Hemsworth        |          2 |
| Idris Elba             |          2 |
| Peter Firth            |          2 |
| Jo Kendall             |          2 |
| Tom Bower              |          2 |
| Frankie Faison         |          2 |
| Edward Fox             |          2 |

## Assigment O2.3
List the title of the movie, year of release and the production company in which 
Anthony Hopkins and Emma Thompson played together.
Use the ```INTERSECT``` set operator to solve this exercise.
If the movie was produced by more than one company, list all of them.

```sql
-- Your solution goes here.
```

**Expected output:** 4 rows

| title | release\_year |              company\_name |
| :--- |--------------:|---------------------------:|
| The Remains of the Day |          1993 | Merchant Ivory Productions |
| The Remains of the Day |          1993 |          Columbia Pictures |
| Howards End |          1992 |   The Criterion Collection |
| Howards End |          1992 | Merchant Ivory Productions |

## Assigment O2.4
Order the actors 'Morgan Freeman', 'Tom Hanks', 'Naomi Watts', 'Frances McDormand' and 'Michael Caine' by 
the number of movies in which they played.

```sql
-- Your solution goes here.
```

**Expected output:** 5 rows

| person\_name | nr\_movies |
| :--- |-----------:|
| Morgan Freeman |         46 |
| Tom Hanks |         32 |
| Michael Caine |         29 |
| Naomi Watts |         23 |
| Frances McDormand |         15 |


## Assigment O2.5
Order the actors 'Morgan Freeman', 'Tom Hanks', 'Naomi Watts', 'Frances McDormand' and 'Michael Caine' by 
the number of movies in which they played. Only count the movies with genre 'Drama'.

```sql
-- Your solution goes here.
```

**Expected output:** 5 rows

| person\_id | person\_name | nr\_movies |
| :--- | :--- |-----------:|
| 192 | Morgan Freeman |         22 |
| 31 | Tom Hanks |         19 |
| 3895 | Michael Caine |         18 |
| 3489 | Naomi Watts |         15 |
| 3910 | Frances McDormand |         11 |


## Assigment O2.6
List the titles and release dates of movies that were released after 2015 
and to which more than 3 languages are associated as 'Spoken' languages.  
**Hint:** 
- Use the ```(SELECT role_id from language_role WHERE language_role='Spoken')``` query to get the ```role_id``` of the 'Spoken' language role.
- You can start with the ```movie_languages``` table to count the number of `Spoken` languages associated with each movie 
and then join it with the ```movie``` table to get the titles and release dates of the movies.

```sql
-- Your solution goes here.
```

**Expected output**: 7 rows

| title | year\_of\_release | nr\_languages |
| :--- |------------------:|--------------:|
| Spectre |              2015 |             5 |
| The Man from U.N.C.L.E. |              2015 |             4 |
| Blackhat |              2015 |             4 |
| Captain America: Civil War |              2016 |             4 |
| シン・ゴジラ |              2016 |             4 |
| 葉問3 |              2015 |             4 |
| Baahubali: The Beginning |              2015 |             4 |
 
## Assignment O2.7
List the titles and release dates of movies that were released in 2010 or later
which have the genre 'Adventure' assigned to them but 
do not have the genre 'Animation' assigned to them.  
Order the list by year of release in ascending order and the titles in alphabetical order.

```sql
-- Your solution goes here.
```

Expected output: 177 rows

| title | year\_of\_release |
| :--- |------------------:|
| 127 Hours |              2010 |
| Alice in Wonderland |              2010 |
| Centurion |              2010 |
| Clash of the Titans |              2010 |
| Green Zone |              2010 |
| Hot Tub Time Machine |              2010 |
| Inception |              2010 |
| Iron Man 2 |              2010 |
| MacGruber |              2010 |
| Percy Jackson & the Olympians: The Lightning Thief |              2010 |
| ... |               ... |
| The 5th Wave |              2016 |
| The BFG |              2016 |
| The Huntsman: Winter's War |              2016 |
| The Jungle Book |              2016 |
| The Legend of Tarzan |              2016 |
| Warcraft |              2016 |
| シン・ゴジラ |              2016 |
| 西游记之孙悟空三打白骨精 |              2016 |

## Assignment O2.8
List the  titles and release dates of movies beetween 2005 and 2010 (both included)
and to which there is no genre assigned.
Order the list by year of release in ascending order.

```sql
-- Your solution goes here.
```

**Expected output:** 3 rows
 
| title                                                   | year\_of\_release |
|:--------------------------------------------------------|------------------:|
| The Blood of My Brother: A Story of Death in Iraq       |              2005 |
| Harrison Montgomery                                     |              2008 |
| Death Calls                                             |              2010 |




