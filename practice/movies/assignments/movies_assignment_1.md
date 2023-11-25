# 1. The movies database assignments O1

<!-- TOC -->
* [1. The movies database assignments O1](#1-the-movies-database-assignments-o1)
* [2. Assignments](#2-assignments)
  * [Assigment O1.1](#assigment-o11)
  * [Assigment O1.2](#assigment-o12)
  * [Assigment O1.3](#assigment-o13)
  * [Assigment O1.4](#assigment-o14)
  * [Assignment O1.5](#assignment-o15)
  * [Assignment O1.6](#assignment-o16)
  * [Assignment O1.7](#assignment-o17)
  * [Assignment O1.8](#assignment-o18)
  * [Assignment O1.9 - O1.12](#assignment-o19---o112)
<!-- TOC -->

# 2. Assignments
## Assigment O1.1
Calculate the number of movies present in the movie table.   


**Expected output**: 1 row

| total\_number\_of\_movies |
| :--- |
| 4803 |

```postgresql
Your solution goes here.
```

## Assigment O1.2
Calculate the number of movies released in 2005?

**Expected output**: 1 row

| number\_of\_movies\_released\_in\_2005 |
| :--- |
| 217 |
```postgresql
Your solution goes here.
```

## Assigment O1.3
Display how movies are distributed across different years, using the `movie.release_date` field.  
Arrange the list in descending order by year. Do not include movies with missing 

**Expected output**: 90 rows

| year\_of\_release | nr\_movies\_released |
|:------------------|---------------------:|
| 2017              |                    1 |
| 2016              |                  104 |
| 2015              |                  216 |
| 2014              |                  238 |
| 2013              |                  231 |
| 2012              |                  208 |
| 2011              |                  223 |
| 2010              |                  225 |
| 2009              |                  247 |
| ...               |                  ... |

```postgresql
Your solution goes here.
```

## Assigment O1.4
List the titles and release dates of movies that were released before 1950, ordered in ascending order by their 
release date.

**Expected output**: 45 rows

| title                  | release\_date |
|:-----------------------|--------------:|
| Intolerance            |    1916-09-04 |
| The Big Parade         |    1925-11-05 |
| Metropolis             |    1927-01-10 |
| Die Büchse der Pandora |    1929-01-30 |
| The Broadway Melody    |    1929-02-08 |
| Hell's Angels          |    1930-11-15 |
| A Farewell to Arms     |    1932-12-08 |
| 42nd Street            |    1933-02-02 |
| She Done Him Wrong     |    1933-02-09 |
| It Happened One Night  |    1934-02-22 |
| ...                    |           ... |


```postgresql
Your solution goes here.
```

## Assignment O1.5
Display the titles and popularity of movies that were the most popular in their respective release years, focusing on 
films released in 1995 and onwards. Arrange this list in ascending order based on the year of release.

**Expected output**: 23 rows

| title | popularity | year\_of\_release |
| :--- |-----------:|------------------:|
| Se7en |  79.579532 |              1995 |
| Mission: Impossible |  75.290998 |              1996 |
| The Fifth Element | 109.528572 |              1997 |
| A Bug's Life |  87.350802 |              1998 |
| Fight Club | 146.757391 |              1999 |
| Gladiator |  95.301296 |              2000 |
| The Lord of the Rings: The Fellowship of the Ring | 138.049577 |              2001 |
| Harry Potter and the Chamber of Secrets | 132.397737 |              2002 |
| Pirates of the Caribbean: The Curse of the Black Pearl | 271.972889 |              2003 |
| I, Robot |  95.914473 |              2004 |
| Batman Begins | 115.040024 |              2005 |
| Pirates of the Caribbean: Dead Man's Chest | 145.847379 |              2006 |
| Pirates of the Caribbean: At World's End | 139.082615 |              2007 |
| The Dark Knight | 187.322927 |              2008 |
| Avatar | 150.437577 |              2009 |
| Inception | 167.583710 |              2010 |
| Rise of the Planet of the Apes | 138.433168 |              2011 |
| The Avengers | 144.448633 |              2012 |
| Frozen | 165.125366 |              2013 |
| Interstellar | 724.247784 |              2014 |
| Minions | 875.581305 |              2015 |
| Deadpool | 514.569956 |              2016 |
| Growing Up Smith |   0.710870 |              2017 |

## Assignment O1.6
Count the number of movie pairs (m1, m2) where the release date of m1 is before the release date of m2, 
and the popularity of m1 is greater than the popularity of m2.

**Expected output**: 1 row

| nr\_movie\_pairs |
|-----------------:|
|          5330993 |

```postgresql,
Your solution goes here.
```

## Assignment O1.7
Display the distribution of movies across different genres.
Remark: Some movies have multiple genres. For each (movie,genre) pair, we count it as one movie for each genre.  
Order the list by the name of the genre in alfabetical order.

**Expected output**: 20 rows


| genre\_name | nr\_movies |
| :--- |-----------:|
| Action |       1154 |
| Adventure |        790 |
| Animation |        234 |
| Comedy |       1722 |
| Crime |        696 |
| Documentary |        110 |
| Drama |       2297 |
| Family |        513 |
| Fantasy |        424 |
| Foreign |         34 |
| History |        197 |
| Horror |        519 |
| Music |        185 |
| Mystery |        348 |
| Romance |        894 |
| Science Fiction |        535 |
| Thriller |       1274 |
| TV Movie |          8 |
| War |        144 |
| Western |         82 |

## Assignment O1.8
Show how movies are distributed among different production companies, omitting those companies with 9 or fewer movies. 
Present the highest, lowest, and average revenue generated by movies from each company. Note: In cases where a movie 
is associated with multiple production companies, it is counted as one movie for each company. Arrange the list so that 
companies with the highest average revenues are at the top and limit the display to the first 10 records.

**Expected output**: 10 rows


| company\_name | nr\_movies | avg\_revenue | max\_revenue | min\_revenue |
| :--- |-----------:|-------------:|-------------:|-------------:|
| Marvel Studios |         13 |    779876975 |   1519557910 |    163712074 |
| WingNut Films |         11 |    643763864 |   1118888979 |      3049135 |
| Pixar Animation Studios |         16 |    613112049 |   1066969703 |    331926147 |
| Revolution Sun Studios |         16 |    517989606 |   1405403694 |     85167639 |
| Dentsu |         12 |    444760118 |   1513528810 |     18409891 |
| Twentieth Century Fox Animation |         11 |    442413826 |    886686817 |     97437106 |
| Lucasfilm |         15 |    440449113 |    924317558 |            0 |
| DC Entertainment |         12 |    421800374 |   1084939099 |            0 |
| DreamWorks Animation |         31 |    411322963 |    919838758 |     26288320 |
| Marvel Enterprises |         16 |    376760293 |    890871626 |     54700105 |

## Assignment O1.9 - O1.12
Please devise three unique assignments.  
In each query, try to incorporate at least one of the following terms if feasible: JOIN, GROUP BY, HAVING, 
aggregate function or subquery.

For instance, you could ask: "What is the highest revenue generated by a movie featuring Anthony Hopkins?"
