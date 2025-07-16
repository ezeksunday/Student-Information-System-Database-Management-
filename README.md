
## Introduction
This document outlines a comprehensive project for modernising Greenfield Academy's student information system through the implementation of a new database named student_management.  
The project focuses on establishing a robust and secure database infrastructure capable of storing and managing critical information about students and teachers.  
A key emphasis is placed on implementing stringent access controls, including user account creation, privilege management, and role-based access control, to ensure the confidentiality, integrity, and availability of sensitive educational data.

## Aims
- To develop a secure and structured student management database.
- To implement access control measures that safeguard sensitive educational data.

## Objectives:
1. Design and create a database structure for students and teachers.
2. Establish user accounts with controlled access to database operations.
3. Implement detailed permission controls with SQL GRANT and REVOKE.
4. Develop and assign roles for streamlined privilege management.
5. To simplify data access for non-technical staff through the use of views.
6. To automate student registration processes with stored procedures.

## Problem Statement
Greenfield Academy, a rapidly expanding educational institution, currently lacks a modern, centralised, and securely managed student information system.  
The absence of a robust database infrastructure poses significant challenges in maintaining data confidentiality, integrity, and efficient access for authorised personnel. Specifically, there is a need to:  
- Create a structured database to store student and teacher records.
- Define and enforce granular access controls to protect sensitive information.
- Provide different levels of access for various user types (e.g., teachers, administrators, students) to perform their respective tasks without compromising data security.
- Establish a flexible and scalable mechanism for managing user permissions that can adapt to future organisational needs.
- Streamline data retrieval for administrative reporting.
- Automate repetitive data entry tasks.
- Provide custom calculation capabilities within the database for business logic.

## Solution: Database Implementation and Access Control
This section outlines the SQL commands and steps necessary to implement the student_management database, set up user accounts, manage privileges using GRANT, REVOKE, and ROLES, and introduce advanced functionalities like Views, Stored Procedures, and User-Defined Functions.  
- **Uploaded as the source code "Codes.sql"**
