## 1. Introduction  
This document details an exciting project aimed at modernising Greenfield Academy's student information system through the implementation of a new database named student_management.  
The project focuses on establishing a robust and secure database infrastructure capable of storing and managing critical information about students and teachers.  
A key emphasis is placed on implementing stringent access controls, including user account creation, privilege management, and role-based access control, to ensure the confidentiality, integrity, and availability of sensitive educational data.  
## 2. Aims
- The primary aim of this project is to develop a secure and efficient database system for Greenfield Academy that supports the management of student and teacher information.  
- To implement access control measures that safeguard sensitive educational data.


## 3. Objectives
The specific objectives of this project are:

- To design and create the necessary database schema for student and teacher data.

- To establish distinct user accounts with varying levels of access permissions.

- To implement and manage database privileges effectively, granting and revoking access as required. 

- To leverage database roles for streamlined management of user permissions.

- To ensure that only authorised personnel can access and manipulate sensitive student and teacher data.  


## 4. Problem Statement
As Greenfield Academy expands, the risk of unauthorised access to student and teacher records increases. There is a need for a centralised, secure database system that supports different access levels for staff while ensuring confidentiality, integrity, and availability of the data.  
The absence of a robust database infrastructure poses significant challenges in maintaining data confidentiality, integrity, and efficient access for authorised personnel. Specifically, there is a need to:  
- Create a structured database to store student and teacher records. 
- Define and enforce granular access controls to protect sensitive information.  
- Provide different levels of access for various user types (e.g., teachers, administrators, students) to perform their respective tasks without compromising data security.  
- Establish a flexible and scalable mechanism for managing user permissions that can adapt to future organisational needs.  
- This project addresses these challenges by providing a structured approach to database creation, user management, and privilege control, thereby enhancing the overall security and operational efficiency of Greenfield Academy's information system. 

## 5. Solution: Database Implementation and Access Control
This section details the SQL commands and steps required to implement the student_management database, set up user accounts, and manage privileges using GRANT, REVOKE, and ROLES.  
