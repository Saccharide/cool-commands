# SQL

## Table manipulation
* Creating a new databse table in `SQL`. `PRIMARY KEY` is something that is `NOT NULL` and `UNIQUE`
```sql
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20)
);
```
* Show table 
```sql
DESCRIBE student;
SELECT * FROM student;
```
* Remove table
```sql
DROP TABLE student;
```

* Add a column to table
```sql
ALTER TABLE student ADD gpa DECIMAL(3,2);
```

* Delete a column
```sql
ALTER TABLE student DROP COLUMN gpa;
```

* Get version of the backend database
```sql
@@version
```

* Get current database name
```sql
database()
```

* Combine/group multiple rows into one string, good for sql injection attacks.
```sql
select group_concat(schema_name) from INFORMATION_SCHEMA.schemata
```

* Getting all the database
```sql
select group_concat(schema_name) from INFORMATION_SCHEMA.schemata
```

* Getting all the tables from one database
```sql
select group_concat(table_name) from INFORMATION_SCHEMA.tables where table_schema = 'ASISCTF'
```

* Getting all columns from one table
```sql
select group_concat(column_name) from INFORMATION_SCHEMA.columns where table_name = 'books'
```
## Inserting / Deleting from table
* Insert an entry to table
```sql
INSERT INTO student VALUES(1, "John");
```

* Updating whole column with condition
```sql
UPDATE student
SET name = 'saccharide'
WHERE name = 'John';
```

* Delete every row in a table
```sql
DELTE FROM student
```

## Queries
* SELECT  column `*` (every column or wild card) FROM table
```sql
SELECT * FROM student;
```

* ORDER BY `ASC` (Ascending), `DESC` (Descending)
```sql
SELECT * FROM student
ORDER BY name DESC;
```

* `LIMIT`: number of output, if it has 2 arguments, it will use the first as offset to the first row, and the second argument as number of rows after that offset
```sql
SELECT * FROM student LIMIT 2;
SELECT * FROM student LIMIT [offset], num_rows; 
```

## Querying metadata about the tables
* Getting all existing tables from `INFORMATION_SCHEMA`
```sql
SELECT * FROM INFORMATION_SCHEMA.TABLES;
```
* Getting all column of a table
```sql
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = "student";
```
* Getting the constraints of a table
```sql
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = "student";
```


