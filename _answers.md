
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
  .select('COUNT(*) AS "count", "movies"."year" as "year"')
  .where(ratings: {stars: [4,5]})
  .group(:year)
  .order('count ASC')
  .as_json # for pretty printing the results and data
```

Which generates the following in `sql`:

```sql
SELECT COUNT(*) AS count, "movies"."year" as "year"
FROM "movies"
INNER JOIN "ratings" ON "ratings"."movie_id" = "movies"."id"
WHERE "ratings"."stars" IN (4, 5)
GROUP BY "movies"."year"
ORDER BY count ASC
```

and outputs:

```
[
  {"id"=>nil, "count"=>1, "movies_year"=>2009},
  {"id"=>nil, "count"=>1, "movies_year"=>1939},
  {"id"=>nil, "count"=>2, "movies_year"=>1981},
  {"id"=>nil, "count"=>2, "movies_year"=>1937}
]
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
