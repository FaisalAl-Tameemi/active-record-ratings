/* Delete the tables if they already exist */
drop table if exists movies;
drop table if exists reviewers;
drop table if exists ratings;

/* Create the schema for our tables */
create table movies(
  id int NOT NULL,
  title text,
  year int,
  director text,
  PRIMARY KEY (id)
);

create table reviewers(
  id int NOT NULL,
  name text,
  PRIMARY KEY (id)
);

create table ratings(
  id int NOT NULL,
  reviewer_id int,
  movie_id int,
  stars int,
  rating_date date,
  PRIMARY KEY (id),
  FOREIGN KEY (reviewer_id) REFERENCES reviewers(id),
  FOREIGN KEY (movie_id) REFERENCES movies(id)
);

/* Populate the tables with our data */
insert into movies values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into movies values(102, 'Star Wars', 1977, 'George Lucas');
insert into movies values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into movies values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into movies values(105, 'Titanic', 1997, 'James Cameron');
insert into movies values(106, 'Snow White', 1937, null);
insert into movies values(107, 'Avatar', 2009, 'James Cameron');
insert into movies values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into reviewers values(201, 'Sarah Martinez');
insert into reviewers values(202, 'Daniel Lewis');
insert into reviewers values(203, 'Brittany Harris');
insert into reviewers values(204, 'Mike Anderson');
insert into reviewers values(205, 'Chris Jackson');
insert into reviewers values(206, 'Elizabeth Thomas');
insert into reviewers values(207, 'James Cameron');
insert into reviewers values(208, 'Ashley White');

insert into ratings values(1, 201, 101, 2, '2011-01-22');
insert into ratings values(2, 201, 101, 4, '2011-01-27');
insert into ratings values(3, 202, 106, 4, null);
insert into ratings values(4, 203, 103, 2, '2011-01-20');
insert into ratings values(5, 203, 108, 4, '2011-01-12');
insert into ratings values(6, 203, 108, 2, '2011-01-30');
insert into ratings values(7, 204, 101, 3, '2011-01-09');
insert into ratings values(8, 205, 103, 3, '2011-01-27');
insert into ratings values(9, 205, 104, 2, '2011-01-22');
insert into ratings values(10, 205, 108, 4, null);
insert into ratings values(11, 206, 107, 3, '2011-01-15');
insert into ratings values(12, 206, 106, 5, '2011-01-19');
insert into ratings values(13, 207, 107, 5, '2011-01-20');
insert into ratings values(14, 208, 104, 3, '2011-01-02');
