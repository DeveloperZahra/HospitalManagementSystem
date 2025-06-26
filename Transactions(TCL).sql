--=====USE THE DATABASE=====

USE HospitalManagementSystem 


--========Transactions (TCL)============
--1• Simulate a transaction: admit a patient → insert record, update room, create billing → commit.
--2• Add rollback logic in case of failure.

BEGIN TRANSACTION;

BEGIN TRY
-- Step 1: Insert into Admissions
INSERT INTO ReceptionistSchema.Admissions (AdmissionID, PatientID, RoomID, DateIn,DateOut )
VALUES (3001, 5, 2, '2025-06-19', '2025-06-22');

-- Step 2: Update Room availability
UPDATE ReceptionistSchema.Rooms
SET Available = 'No'
WHERE RoomID = 2;

-- Step 3: Insert into Billing
INSERT INTO PatientsSchema.Billing (BillID, PatientID, TotalCost, Date, Services)
VALUES (2001, 5, 350.00, GETDATE(), 'Admission Charges');

--commit the transaction if all succeed
    COMMIT TRANSACTION;

    PRINT 'Transaction completed successfully.';

END TRY
BEGIN CATCH
    -- rollback in case of any error
    ROLLBACK TRANSACTION;--it show where it is stoped

    PRINT 'Transaction failed. Rolling back...';
    PRINT ERROR_MESSAGE();
END CATCH