--=====USE THE DATABASE=====

USE HospitalManagementSystem 

--======Functions & Stored Procedures=====
--1. Scalar function to calculate patient age from DOB

CREATE FUNCTION dbo.fn_CalculateAge (@DOB DATE)
RETURNS INT
AS
BEGIN
RETURN DATEDIFF(YEAR, @DOB, GETDATE()) -
CASE WHEN MONTH(@DOB) > MONTH(GETDATE())
OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
THEN 1 ELSE 0 END;
END;
GO

SELECT dbo.fn_CalculateAge(DOB) AS Age
FROM PatientsSchema.Patients;


-- 2. Procedure to admit a patient: insert admission + update room availability

CREATE PROCEDURE sp_AdmitPatient (
@PatientID INT,
@RoomID INT,
@DateIn DATE,
@DateOut DATE)
AS
BEGIN
INSERT INTO ReceptionistSchema.Admissions (PatientID, RoomID, DateIn,DateOut)
VALUES (@PatientID, @RoomID, @DateIn,@DateOut)

UPDATE ReceptionistSchema.Rooms
SET Available = 'No'
WHERE RoomID = @RoomID;

END;
GO

SELECT * FROM ReceptionistSchema.Rooms WHERE RoomID = 1;
SELECT * FROM ReceptionistSchema.Admissions WHERE PatientID = 1;

--3. Procedure to generate invoice based on treatment

CREATE PROCEDURE sp_GenerateInvoice
@PatientID INT,
@Service VARCHAR(200),
@TotalCost DECIMAL(10,2),
@Date DATE
AS
BEGIN
INSERT INTO PatientsSchema.Billing (PatientID, Services, TotalCost, Date)
VALUES (@PatientID, @Service, @TotalCost, @Date);
END;
GO

SELECT * FROM PatientsSchema.Billing WHERE PatientID = 1;

-- 4. Procedure to assign doctor to department and set shift (via Staff table)

CREATE PROCEDURE sp_AssignDoctorToDept

@D_FirstName VARCHAR(50),
@D_LastName VARCHAR(50),
@DeptID INT,
@Shift VARCHAR(20),
@StaffID int
AS
BEGIN
--DECLARE @StaffID INT;

--SELECT @StaffID = StaffID
--FROM SystemSchema.Staff
--WHERE S_FirstName = @D_FirstName AND S_LastName = @D_LastName AND Role = 'Doctor';

IF @StaffID IS NOT NULL
BEGIN
    UPDATE SystemSchema.Staff
    SET DeptID = @DeptID,
        Shift = @Shift
    WHERE StaffID = @StaffID;
END;

END;
GO


exec sp_AssignDoctorToDept
@D_FirstName = 'Aisha',
@D_LastName = 'Salem',
@DeptID  = 1,
@Shift = 'Night',
@StaffID = 1

--drop procedure sp_AssignDoctorToDept


SELECT * FROM SystemSchema.Staff
