
## Questions


_Q1._ **Find the titles of all movies directed by Steven Spielberg.**


_Q2._ **Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order.**


_Q3._ **Find the titles of all movies that have no ratings.**


_Q4._ **Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date.**


_Q5._ **Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars.**


_Q6._ **For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer's name and the title of the movie.**


_Q7._ **For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title.**


_Q8._ **For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title.**


_Q9._ **Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980. (Make sure to calculate the average rating for each movie, then the average of those averages for movies before 1980 and movies after. Don't just calculate the overall average rating before and after 1980.)**

----

## Extras


_Q1._ **Find the names of all reviewers who rated Gone with the Wind.**


_Q2._ **For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars.**


_Q3._ **Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".)**


_Q4._ **Find the titles of all movies not reviewed by Chris Jackson.**


_Q5._ **For all pairs of reviewers such that both reviewers gave a rating to the same movie, return the names of both reviewers. Eliminate duplicates, don't pair reviewers with themselves, and include each pair only once. For each pair, return the names in the pair in alphabetical order.**


_Q6._ **For each rating that is the lowest (fewest stars) currently in the database, return the reviewer name, movie title, and number of stars.**


_Q7._ **List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order.**


_Q8._ **Find the names of all reviewers who have contributed three or more ratings. (As an extra challenge, try writing the query without HAVING or without COUNT.)**


_Q9._ **Some directors directed more than one movie. For all such directors, return the titles of all movies directed by them, along with the director name. Sort by director name, then movie title. (As an extra challenge, try writing the query both with and without COUNT.)**


_Q10._ **Find the movie(s) with the highest average rating. Return the movie title(s) and average rating. (Hint: This query is more difficult to write in SQLite than other systems; you might think of it as finding the highest average rating and then choosing the movie(s) with that average rating.)**


_Q11._ **Find the movie(s) with the lowest average rating. Return the movie title(s) and average rating. (Hint: This query may be more difficult to write in SQLite than other systems; you might think of it as finding the lowest average rating and then choosing the movie(s) with that average rating.)**


_Q12._ **For each director, return the director's name together with the title(s) of the movie(s) they directed that received the highest rating among all of their movies, and the value of that rating. Ignore movies whose director is NULL.**

----
