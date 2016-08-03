
# Active Record Ratings

## The Overview

You've started a new movie-rating website, and you've been collecting data on reviewers' ratings of various movies. There's not much data yet, but you can still try out some interesting queries. Here's the schema:

### We'll start with the movies

```
Movie ( id, title, year, director )
```
English: There is a movie with `id` number, a `title`, a release `year`, and a `director`.

_Below is an example of entries in this table:_

| id | title | year  | director |
|----|-------|-------|----------|
| 101 | Gone with the Wind | 1939  | Victor Fleming |
| 102 | Star Wars | 1977  | George Lucas |
| ... | ... | ...  | ... |


### Now, the reviewers


```
Reviewer ( id, name )
```
English: The reviewer with `id` number and has a certain `name`.

_Below is an example of entries in this table:_

| id  | name            |
|-----|-----------------|
| 101 | Sarah Martinez  |
| 102 | Daniel Lewis    |
| ... | ...             |


### And finally, the ratings


```
Rating ( rating_id, movie_id, stars, rating_date )
```
English: The `reviewer_id` gave the `movie_id` a number of `stars` rating (1-5) on a certain `rating_date`.

_Below is an example of entries in this table:_

| rating_id | movie_id | stars | rating_date |
|-----------|----------|-------|-------------|
|   201     | 101      |  2    |  2011-01-22 |
|   204     | 106      |  4    |  2011-03-17 |
|   ...     | ...      |  ...  |  ...        |



**Note:** The database script to load your postgres database is found in `data.sql`. To import this into postgres, use `psql MY_DB_NAME < data.sql`.


**Instructions:** Each problem asks you to write an active record query (and raw SQL query if you're into that).

To run this code, we will be using **pry**. However, we also have to load the `setup.rb` file in order to connect to the database and load the models.

Run the following in your terminal to start pry with the setup:
```
pry -r './setup'
```

Your goal is to answer all questions found in the `questions.md` file


----


### Resources

- [Active Record w. Sqlite3](http://www.integralist.co.uk/posts/active-record.html)
- [Data Modeling](http://sql.learncodethehardway.org/book/ex15.html)
- [Social Network Exercise](https://lagunita.stanford.edu/courses/DB/SQL/SelfPaced/courseware/ch-sql/seq-exercise-sql_social_query_core/)
