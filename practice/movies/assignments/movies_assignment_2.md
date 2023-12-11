# 1. The movies database assignments O1

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
| Stellan Skarsgård |          3 |
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

