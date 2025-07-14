-- ---------------------------------------------------
-- 1. GRANT Statement
-- ---------------------------------------------------

-- Q1. Create a new database called student_management
CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

-- Q2. Create two tables in the database: Students and Teachers
CREATE TABLE IF NOT EXISTS Students (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR (100) NOT  NULL, 
    age INT NOT NULL, 
    grade VARCHAR (20)
);
    
CREATE TABLE IF NOT EXISTS Teachers (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR (100) NOT NULL, 
	subject VARCHAR (100)
);

-- Optional: Populate some initial data into Students and Teachers tables
INSERT INTO Students (name, age, grade)
VALUES  ('Benson Gill', 10, '5th Grade'),
		('Alex Kingdon', 9, '4th Grade'),
        ('Yvonne Brown', 11, '6th Grade');

INSERT INTO Teachers (name, subject)
VALUES  ('Mr. Joseph', 'Basic Science'),
		('Ms. Abdulahi', 'Mathematics');
select * from Students;
select * from Teachers;


-- Q3. Create a user named teacher_user without any initial privileges.
-- Note: 'localhost' specifies that the user can only connect from the local machine.
CREATE USER 'teacher_user'@'localhost' IDENTIFIED BY 'teacher_password';
		
-- Q4. Write a query to grant SELECT and INSERT privileges to teacher_user on the students table.
GRANT SELECT, INSERT ON student_management.Students TO 'teacher_user'@'localhost';

-- Q5. Verify that teacher_user can now select and insert records in the students table
--     but cannot delete or update any records.

-- Verification Steps Manually (as teacher_user):
SELECT * FROM Students;			-- This SELECT statement should work

INSERT INTO Students (name, age, grade)
VALUES ('Constance Odogwu', 8, '3rd Grade');	-- This INSERT statement (adding a new student via Teacher) should work:

UPDATE Students
SET age = 12
WHERE id = 1;			-- This UPDATE statement should FAIL with an access denied error:
-- Alternatively:
UPDATE students
SET name = 'Johnson Gill'
WHERE id = 1;			-- This UPDATE statement should FAIL with an access denied error:

DELETE FROM Students
WHERE id = 1;			-- This DELETE statement should FAIL with an access denied error:

-- Also:
SELECT * FROM Teachers;	-- This SELECT statement on Teachers should FAIL with an access denied error:

-- ---------------------------------------------------
-- 2. REVOKE Statement
-- ---------------------------------------------------

-- Q1. Use the same database student_management.
USE student_management;

-- Q2. Create another user called admin_user.
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';

-- Q3. Grant all privileges (SELECT, INSERT, UPDATE, DELETE) on both tables (students and teachers) to admin_user.
GRANT ALL PRIVILEGES ON student_management.*TO 'admin_user'@'localhost';

-- Alternatively:
GRANT SELECT, INSERT, UPDATE, DELETE ON Students TO 'admin_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Teachers TO 'admin_user'@'localhost';

-- Q4. Verify that admin_user can perform all operations.
-- Verification (as admin_user):
-- The following operations on Students table should work:
SELECT * FROM Students;	
	
INSERT INTO Students (name, age, grade)
VALUES ('Emmanuel Obi', 13, '8th Grade');   -- Admin added a new student

UPDATE Students
SET age = 14
WHERE id = 1;

DELETE FROM Students
WHERE id = 2;		-- Deletes 'Alex Kingdom' if still exists

-- The following operations on Teachers table should also work:
SELECT * FROM Teachers;

INSERT INTO Teachers (name, subject)
VALUES ('Mr. Obi', 'Physics');

UPDATE Teachers
SET subject = 'Basic Arithmetics'
WHERE id = 2;

DELETE FROM Teachers
WHERE id = 2;		-- Deletes 'Ms. Abdulahi' if still exists

-- Q5. Write a query to revoke the DELETE privilege from admin_user on the students table.
REVOKE DELETE ON student_managemet.Students FROM 'admin_user'@'localhost'; -- Explicitly specifies both the database (or schema) and the table 
-- Alternatively:
REVOKE DELETE ON Students FROM 'admin_user'@'localhost';  -- Explicitly specifies only the table name

-- 6. Verify that admin_user can no longer delete records from the students table but can still insert, update, 
-- 	  and select records.
DELETE FROM Students
WHERE id = 1;		-- The Verification (as admin_user, after REVOCATION) fails with access denied error.

-- However, these other operation should work successfully after REVOKE
SELECT * FROM Students;

INSERT INTO Students (name, age, grade)
VALUES ('Post Revoke', 10, '5th Grade');

UPDATE Students
SET age = 11
WHERE id = 1;

-- Operations on Teachers table should still work as DELETE was only revoked on Students:
DELETE FROM Teachers WHERE id = 1;

 -- ---------------------------------------------------
-- 3. Roles and Privileges
-- ---------------------------------------------------
-- Q1. Create a new role called student_role and assign it SELECT privileges on the students table.
CREATE ROLE student_role;

-- Assign SELECT privileges on the students table to student_role
GRANT SELECT ON Student TO student_role;
GRANT SELECT ON student_management.Students TO student_role; 	-- as alternative

-- Q2. Create a new user student_user and assign them the student_role.
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'student_password';
GRANT student_role TO 'student_user'@'localhost';

-- Q3. Verify that student_user can only view the records in the students table but cannot make any changes.
-- The Varification as 'student_user', SELECT should work; INSERT/DELETE/UPDATE should fail with access denied error.
SELECT * FROM Students;

-- These operations should FAIL with an access denied error:
INSERT INTO Students (name, age, grade) 
VALUES ('Mercy Jonah', 9, '4th Grade');

UPDATE Students SET age = 10 WHERE id = 1;

DELETE FROM Students WHERE id = 1;

-- Q4. Modify the student_role to also include INSERT privileges on the students table.
GRANT INSERT ON Students TO student_role;
-- Alternatively
GRANT INSERT ON student_management.Students TO student_role;

-- Q5. Verify that student_user can now insert new records but still cannot delete or update them.
-- Verification (as student_user, after role modification):

INSERT INTO Students (name, age, grade) 
VALUES ('Ben Bruce', 8, '3rd Grade');  -- This INSERT statement should now work:

SELECT * FROM Students;  -- This SELECT statement should still work:

-- But, these operations bellow should still FAIL with an access denied error:
 UPDATE Students 
 SET age = 9 WHERE id = 1;
 
DELETE FROM Students WHERE id = 1;










