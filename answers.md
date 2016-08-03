
## Answers

_A1._

Using the movie class method (inherited from AR::Base), we can pass a string that is our SQL query.

```ruby
Movie.where("director LIKE 'Steven Spielberg'")
```

or we can write something more Ruby-esque:

```Ruby
Movie.where(director: 'Steven Spielberg')
```

----

_A2._

```ruby
Movie
  .joins(:ratings)
  .where(ratings: {stars: [4,5]})
  .group(:year)
  .count()
```

Which generates:

```sql
SELECT COUNT(*) AS count_all, "movies"."year" AS movies_year
FROM "movies"
INNER JOIN "ratings" ON "ratings"."movie_id" = "movies"."id"
WHERE "ratings"."stars" IN (4, 5) GROUP BY "movies"."year"
```

----

_A3._

----

_A4._

----

_A5._

----

_A6._

----

_A7._

----

_A8._

----

_A9._

----

_A10._

----
