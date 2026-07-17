# ALU Database - SQL Basics Activity

A relational database for a school system, built as part of the "Play with
SQL Basics (RDBMS)" peer group activity. The database models five entities:
Students, Classroom, Faculty, Courses, and Extra_Curricular_Activities, with
relationships built using primary and foreign keys, including two junction
tables for the many-to-many relationships (Student_Courses,
Student_Activities).

## How to run

Import the full schema and data into MySQL:
mysql -u your_username -p < schema.sql
This will create the `alu_db` database, all tables in dependency order,
insert sample data, and include each member's individual queries as well as
the group's join and aggregate queries.

## Team members and table ownership

| Member | Table |
|---|---|
| Olga Igabe | Students, Classroom |
| [Member B] | Classroom |
| [Member C] | Faculty |
| [Member D] | Courses |
| [Member E] | Extra_Curricular_Activities + junction tables (Student_Courses, Student_Activities) |

## Normalization notes

See the comment block at the bottom of `schema.sql` for the group's
normalization discussion.