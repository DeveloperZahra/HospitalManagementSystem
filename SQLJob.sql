--=====USE THE DATABASE=====

USE HospitalManagementSystem 

--===Option 2: Doctor Schedule Report 

--1• Job Name: Doctor_Daily_Schedule_Report

--2• Schedule: Every morning at 7:00 AM 

--3• Action:

-- A stored procedure that extracts the daily doctor schedule from Appointments and inserts it into a report table DoctorDailyScheduleLog.

--Step 1: Create the Report Table

CREATE TABLE DoctorsSchema.DoctorDailyScheduleLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    DoctorID INT,
    DoctorName VARCHAR(200),
    PatientName VARCHAR(200),
    AppointmentDate DATETIME,
    LoggedAt DATETIME DEFAULT GETDATE()
);

--Step 2: Create the Stored Procedure

CREATE PROCEDURE DoctorsSchema.usp_LogDoctorDailySchedule
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO DoctorsSchema.DoctorDailyScheduleLog (
        DoctorID,
        DoctorName,
        PatientName,
        AppointmentDate
    )
    SELECT 
        D.DoctorID,
        D.D_FirstName + ' ' + D.D_LastName AS DoctorName,
        P.P_FirstName + ' ' + P.P_LastName AS PatientName,
        A.AppointmentDate
    FROM DoctorsSchema.Doctors D
    JOIN DoctorsSchema.Appointments A ON D.DoctorID = A.DoctorID
    JOIN PatientsSchema.Patients P ON A.PatientID = P.PatientID
    WHERE CAST(A.AppointmentDate AS DATE) = CAST(GETDATE() AS DATE); -- Today's appointments only
END;

