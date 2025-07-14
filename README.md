### Practical Exercise:  
Manage a Student Information System Database
Greenfield Academy, a growing educational institution, has decided to modernise its student information system. The IT department is tasked with creating a new database called 'student_management' to store and manage information about students and teachers. As part of this initiative, they need to set up appropriate access controls to ensure data security and privacy.
The database administrator will be working on:
1. Creating the necessary database structure
2. Setting up user accounts with varying levels of access
3. Implementing and managing database privileges
4. Creating and assigning roles for different types of users

These tasks will help Greenfield Academy maintain the confidentiality and integrity of their student and teacher data while allowing appropriate access to authorised personnel.  \
The lessons will guide the database administrator through the process of granting privileges, revoking them when necessary, and using roles to manage user permissions efficiently.

Lesson 1: GRANT Statement
1. Create a new database called student_management.
2. Create two tables in the database:
•	Students table: Stores information about students (id, name, age, grade).USE student_management;
•	Teachers table: Stores information about teachers (id, name, subject).
3. Create a user named teacher_user without any initial privileges.
4. Write a query to grant SELECT and INSERT privileges to teacher_user on the students table.
5. Verify that teacher_user can now select and insert records in the students table but cannot delete or update any records.

Lesson 2: REVOKE Statement
1. Use the same database student_management.
2. Create another user called admin_user.
3. Grant all privileges (SELECT, INSERT, UPDATE, DELETE) on both tables (students and teachers) to admin_user.
4. Verify that admin_user can perform all operations.
5. Write a query to revoke the DELETE privilege from admin_user on the students table.
6. Verify that admin_user can no longer delete records from the students table but can still insert, update, and select records. SELECT * FROM students;

Lesson 3: Roles and Privileges
1. Create a new role called student_role and assign it SELECT privileges on the students table.
2. Create a new user student_user and assign them the student_role.
3. Verify that student_user can only view the records in the students table but cannot make any changes.
4. Modify the student_role to also include INSERT privileges on the students table.
5. Verify that student_user can now insert new records but still cannot delete or update them.

