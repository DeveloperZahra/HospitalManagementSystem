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

------------------------------------------------------
✨ Tables (DDL):

Each table must have appropriate constraints:

★ PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK, DEFAULT

======CREATE THE DATABASE WITH NAME======

            CREATE DATABASE HospitalManagementSystem 

========USE THE DATABASE========

             USE HospitalManagementSystem 

======DDL (CREATION OF ALL TABLES)======

====tO CREATE Patients TABLE====

     CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
     P_FirstName VARCHAR(50),
    P_LastName VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    P_PhoneNumber VARCHAR(20),
    
     );

====TO CREATE DOCTORS TABLE====

    CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    D_FirstName VARCHAR(50),
    D_LastName VARCHAR(50),
    Specialization VARCHAR(100),
    D_PhoneNumber VARCHAR(20),
    D_Email VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
     );

======TO CREATE DEPARTMENT TABLE======

    CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL
     );

======TO CREATE Appointments TABLE======

    CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    AppointmentDate DATETIME,
    Status VARCHAR(50),
    PatientID INT,
    DoctorID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
    );

====TO CREATE Admissions TABLE====

    CREATE TABLE Admissions (
    AdmissionID INT PRIMARY KEY,
    DateIn DATE,
    DateOut DATE,
    PatientID INT,
    RoomID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
    );

======TO CREATE Rooms TABLE======

    CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
	Type VARCHAR(20),
    Available VARCHAR(5)
    );

======TO CREATE MedicalRecords TABLE======

    CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    Diagnosis VARCHAR(255),
    TreatmentPlan VARCHAR(255),
    Date DATE,
    Notes TEXT,
    PatientID INT,
    DoctorID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
    );

======TO CREATE Users TABLE======

    CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(255),
    StaffID INT NULL,
    DoctorID INT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
    );

 ========TO CREATE Staff TABLE========

    CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    S_FirstName VARCHAR(50),
    S_LastName VARCHAR(50),
    Role VARCHAR(50),
    Shift VARCHAR(20),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
    );

====TO CREATE Billing====

    CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    TotalCost DECIMAL(10, 2),
    Services TEXT,
    Date DATE,
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
    );

============CREATE ALTER (UNIQUE, CHECK, DEFAULT) FOR TABALS============

======ALTER  Patients TABLE======

     ALTER TABLE Patients
     ADD CONSTRAINT CHK_Patient_Gender CHECK (Gender IN ('Male', 'Female'));


========ALTER DOCTORS TABLES========

    ALTER TABLE Doctors
    ADD CONSTRAINT UQ_Doctor_Email UNIQUE (D_Email);

    ALTER TABLE Doctors
    ADD CONSTRAINT CHK_Doctor_Specialization CHECK (Specialization IS NOT NULL);

========ALTER ROOMS TABLE========

    ALTER TABLE Rooms
    ADD CONSTRAINT CHK_Room_Type CHECK (Type IN ('ICU', 'General'))


    ALTER TABLE Rooms
    ADD CONSTRAINT DF_IsAvailable DEFAULT 'Yes' FOR Available;

======ALTER Appointments TABLE======

ALTER TABLE Appointments
ADD CONSTRAINT CHK_Appointment_Status CHECK (Status IN ('Confirmed', 'Pending', 'Cancelled'));

ALTER TABLE Appointments
ADD CONSTRAINT DF_Appointment_Status DEFAULT 'Pending' FOR Status;


========ALTER Billing TABLE========

     ALTER TABLE Billing
     ADD CONSTRAINT CHK_Bill_TotalCost CHECK (TotalCost >= 0);

     ALTER TABLE Billing
    ADD CONSTRAINT DF_Bill_TotalCost DEFAULT 0.00 FOR TotalCost;

==ALTER Users TABLE==

    ALTER TABLE Users
    ADD CONSTRAINT UQ_Username UNIQUE (Username);


======ALTER Staff TABLE======

    ALTER TABLE Staff
    ADD CONSTRAINT CHK_Staff_Shift CHECK (Shift IN ('Morning', 'Evening', 'Night'));

    ALTER TABLE Staff
    ADD CONSTRAINT DF_Staff_Shift DEFAULT 'Morning' FOR Shift;

     ALTER TABLE Staff
    ADD CONSTRAINT DF_Staff_Role DEFAULT 'Staff' FOR Role;

======ALTER MedicalRecords TABLE======

    ALTER TABLE MedicalRecords
    ADD CONSTRAINT CHK_Record_Date CHECK (Date <= GETDATE());