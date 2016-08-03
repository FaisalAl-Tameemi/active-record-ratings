### Creating Records

`create!` inserts a record in the database. If the validations fail, an exception is raised ex: `ActiveRecord::RecordInvalid: Validation failed: Last name can't be blank`

```ruby
Patient.create!(first_name: "Daffy", last_name: "Duck", patient_since: 6.years.ago)
```

```ruby
patient = Patient.create(first_name: "Daffy", last_name: "Duck", patient_since: 6.years.ago)
patient.persisted?
# returns false if patient was not saved
patient.errors
# returns an array of activerecord error objects if the validations failed
patient.errors.full_messages
# returns an array of strings with error messages
```

If you have an association you can create records using a short hand version

```ruby
joe = Patient.find(1)
joe.appointments.create(appointment_date: 1.day.from_now, procedure_type: "cleaning")
# line above is the same as
Appointment.create(patient_id: joe.id, appointment_date: 1.day.from_now, procedure_type: "cleaning")
```

All of the activerecord statements above generate a query that looks like this:

```sql
INSERT INTO "patients" ("first_name", "last_name", "patient_since", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Daffy"], ["last_name", "Duck"], ["patient_since", "2010-06-08"], ["created_at", "2016-06-08 16:42:18.512545"], ["updated_at", "2016-06-08 16:42:18.512545"]]
```

### Query Methods


Retrieve a record by ID. Will throw an exception if the id was not found.

```ruby
Patient.find(1)
# #<Patient:0x00000103c53268
#  id: 1,
#  first_name: "Daffy",
#  last_name: "Duck",
#  patient_since: Tue, 08 Jun 2010,
#  created_at: 2016-06-08 16:42:18 UTC,
#  updated_at: 2016-06-08 16:42:18 UTC>

# SQL generated: SELECT  "patients".* FROM "patients" WHERE "patients"."id" = $1 LIMIT 1  [["id", 1]]

```

You can also use where to do this, but where always returns an array of records, even if only one record was found. `where` will return an empty array if no records were found. Does not throw exception.

```ruby
Patient.where(id: 1)
# [#<Patient:0x00000103c53268
#  id: 1,
#  first_name: "Daffy",
#  last_name: "Duck",
#  patient_since: Tue, 08 Jun 2010,
#  created_at: 2016-06-08 16:42:18 UTC,
#  updated_at: 2016-06-08 16:42:18 UTC>]

# SQL generated: SELECT  "patients".* FROM "patients" WHERE "patients"."id" = $1 [["id", 1]]
```

You can make where use a SQL fragment for complex queries. For example, the query below will search for all patients whose last name starts with the letter D.

```ruby
Patient.where("last_name ILIKE 'D%'")
```

When using SQL fragments that take parameters that come from an untrusted source (ex. user input fields in a web application) make sure you escape the parameters before passing them in. Here's how:

```ruby
letter = "D"  # let's say this input came from a user

# Antipattern - vulnerable to SQL injection attack. No type casting.
Patient.where("last_name ILIKE '#{letter}%'")

# The better way. ActiveRecord substitutes the ? for the string provided inside where
Patient.where("last_name ILIKE ?", "#{letter}%")

# You can use as many ?s as you like. Just provide more strings at the end of where
Patient.where("last_name ILIKE ? AND first_name = ?", "#{letter}%", "Daisy")
```

Another concept is the concept of chaining. You can call a bunch of query methods on an ActiveRecord class and that will generate a single SQL query. For example,

```ruby
letter = "D"
Patient.where("last_name ILIKE ?", "#{letter}%").where(first_name: "Daisy").order("created_at DESC").limit(2)
# SQL generated: SELECT "patients".* FROM "patients" WHERE (last_name ILIKE 'D%') AND "patients"."first_name" = $1  ORDER BY created_at ASC LIMIT 2 [["first_name", "Daisy"]]
```

### Validations

Sometimes you want to enforce certain rules about the kind of data that ends up in the database. You can use Validations to do that.

List of validations that come with activerecord: http://guides.rubyonrails.org/active_record_validations.html#validation-helpers

If you need to validate something that is more complex, use a custom validation: http://guides.rubyonrails.org/active_record_validations.html#custom-methods

### Associations

You can use associations to create an easier way to access records across multiple tables that are related to eachother.

```ruby
Patient.first.appointments   # get all appointments for the first patient
```

See the in-class code for an example of the `has_many` and `belongs_to` statements we need to make the query above work.

There are three types of associations:

- one to many (see 'patient has many appointments example')
- many to many (see 'patient has many doctors through appointments example')
- one to one (rarely used)

Read more here: http://guides.rubyonrails.org/association_basics.html
