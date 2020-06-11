# SQL

## Table manipulation
* Creating a new databse table in `SQL`. `PRIMARY KEY` is something that is `NOT NULL` and `UNIQUE`
```
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20)
);
```
* Show table 
```
DESCRIBE student;
SELECT * FROM student;
```
* Remove table
```
DROP TABLE student;
```

* Add a column to table
```
ALTER TABLE student ADD gpa DECIMAL(3,2);
```

* Delete a column
```
ALTER TABLE student DROP COLUMN gpa;
```
## Inserting / Deleting from table
* Insert an entry to table
```
INSERT INTO student VALUES(1, "John");
```

* Updating whole column with condition
```
UPDATE student
SET name = 'saccharide'
WHERE name = 'John';
```

* Delete every row in a table
```
DELTE FROM student
```

## Queries
* SELECT  column `*` (every column or wild card) FROM table
```
SELECT * FROM student;
```

* ORDER BY `ASC` (Ascending), `DESC` (Descending)
```
SELECT * FROM student
ORDER BY name DESC;
```

* `LIMIT`: number of output, if it has 2 arguments, it will use the first as offset to the first row, and the second argument as number of rows after that offset
```
SELECT * FROM student LIMIT 2;
SELECT * FROM student LIMIT [offset], num_rows; 
```

## Querying metadata about the tables
* Getting all existing tables from `INFORMATION_SCHEMA`
```
SELECT * FROM INFORMATION_SCHEMA.TABLES;
```
* Getting all column of a table
```
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = "student";
```
* Getting the constraints of a table
```
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = "student";
