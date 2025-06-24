--======CREATE THE DATABASE WITH NAME======
CREATE DATABASE HospitalManagementSystem 

--=========USE THE DATABASE=============
USE HospitalManagementSystem 

--=======DDL (CREATION OF ALL TABLES)========

--====tO CREATE Patients TABLE===========

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
   P_FirstName VARCHAR(50),
    P_LastName VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    P_PhoneNumber VARCHAR(20),
    
);

--=====TO CREATE DOCTORS TABLE========
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

--=======TO CREATE DEPARTMENT TABLE=======

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL
);

--======TO CREATE Appointments TABLE=========
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    AppointmentDate DATETIME,
    Status VARCHAR(50),
    PatientID INT,
    DoctorID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

--====TO CREATE Admissions TABLE=======
CREATE TABLE Admissions (
    AdmissionID INT PRIMARY KEY,
    DateIn DATE,
    DateOut DATE,
    PatientID INT,
    RoomID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

--======TO CREATE Rooms TABLE=========
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
	Type VARCHAR(20),
    Available VARCHAR(5)
);

--=======TO CREATE MedicalRecords TABLE============
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

--=======TO CREATE Users TABLE==========
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(255),
    StaffID INT NULL,
    DoctorID INT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

--========TO CREATE Staff TABLE=========
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    S_FirstName VARCHAR(50),
    S_LastName VARCHAR(50),
    Role VARCHAR(50),
    Shift VARCHAR(20),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

--====TO CREATE Billing============

CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    TotalCost DECIMAL(10, 2),
    Services TEXT,
    Date DATE,
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);