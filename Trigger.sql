--=====USE THE DATABASE=====

USE HospitalManagementSystem 

--==========================Triggers=====
--==============Implement:==========
--1. After insert on Appointments → auto log in MedicalRecords

CREATE TRIGGER trg_AfterInsertAppointment
ON DoctorsSchema.Appointments
AFTER INSERT
AS
BEGIN
INSERT INTO DoctorsSchema.MedicalRecords (PatientID, Diagnosis, TreatmentPlan, Date, Notes)
SELECT PatientID, 'To be diagnosed', 'To be decided', GETDATE(), 'Auto-generated after appointment'
FROM inserted;
END;
GO

SELECT * FROM DoctorsSchema.MedicalRecords
WHERE PatientID = 1
ORDER BY Date DESC;

-- 2. Before delete on Patients → prevent deletion if pending bills exist
CREATE TRIGGER trg_PreventDeletePatientWithBill
ON PatientsSchema.Patients
INSTEAD OF DELETE
AS
BEGIN
IF EXISTS (
SELECT 1 FROM PatientsSchema.Billing B
WHERE B.PatientID IN (SELECT PatientID FROM deleted)
)
BEGIN
RAISERROR ('Cannot delete patient with existing billing records.', 16, 1);
ROLLBACK;
END
ELSE
BEGIN
DELETE FROM PatientsSchema.Patients
WHERE PatientID IN (SELECT PatientID FROM deleted);
END
END;
GO


SELECT DISTINCT P.PatientID, P.P_FirstName, P.P_LastName
FROM PatientsSchema.Patients P
JOIN PatientsSchema.Billing B ON P.PatientID = B.PatientID;

--Patient deletion 
DELETE FROM PatientsSchema.Patients
WHERE PatientID = 1;


-- Admitting a new patient without bill
INSERT INTO PatientsSchema.Patients (PatientID, P_FirstName, P_LastName, DOB, Gender, P_PhoneNumber)
VALUES (999, 'Test', 'Patient', '1990-01-01', 'Male', '1234567890');

--Delete the patient 
DELETE FROM PatientsSchema.Patients
WHERE PatientID = 999;

-- 3. After update on Rooms → ensure no two patients occupy same room  
CREATE TRIGGER trg_CheckRoomOccupancy4
ON ReceptionistSchema.Admissions
AFTER  UPDATE
AS
BEGIN
IF EXISTS (
SELECT RoomID
FROM ReceptionistSchema.Rooms
WHERE Available= 'No' 
GROUP BY RoomID
--HAVING COUNT(*) > 1
)
BEGIN 
RAISERROR ('A room cannot be assigned to more than one patient at a time.', 16, 1);
ROLLBACK TRANSACTION ;
END
END;


UPDATE ReceptionistSchema.Admissions
SET RoomID = 8
WHERE PatientID = 1;

select * from  ReceptionistSchema.Rooms
select * from ReceptionistSchema.Admissions
