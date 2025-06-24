# ═════ ✦Hospital Management System ✦ ═════  

✨ <ins>**Project Objective:**</ins>  

Design and implement a SQL database for a hospital system that supports managing patients, doctors,
appointments, departments, admissions, billing, and staff, to apply all SQL categories (DDL, DML, DQL, DCL, TCL),
normalization, and advanced features like views, functions, stored procedures, and triggers.

✨ <ins>**Database Design Requirements:**</ins>

 **1. Entity Relationship Diagram (ERD):** 

An Entity Relationship (ER) Diagram is a type of flowchart that illustrates how “entities” such as people, objects or concepts relate to each other within a system.

![](image/ERD.png)  

**2. Database Mapping:** 

Convert entities, relationships, and attributes into a working relational schema

![](image/Mapping.png)   

**3. Normalization:**

Normalization is the process of organizing data in a database to:

Reduce redundancy (replication)

Avoid anomalies (renewal, deletion, and deletion issues)

Improve data integrity

1. First Normal Form (1NF): 

★ Each table has a primary key.

★ Each column contains atomic (indivisible) values (no repeating groups or arrays).

★ Each field contains only one value.

2.  Second Normal Form (2NF): 

★ Must be in 1NF.

★ No partial dependency: Each non-key column must be completely dependent on the primary key (not just partially).

3. Third Normal Form (3NF):

★ Must be in 2NF.

★ No transitive dependency: This means that each non-key column depends only on the primary key, and not on any other non-key column.

![](image/Normalization.png)  