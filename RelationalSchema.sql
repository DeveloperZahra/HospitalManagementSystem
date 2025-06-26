--=====USE THE DATABASE=====

USE HospitalManagementSystem 


--====Relational Schema========

-- SCHEMA: SystemSchema

CREATE SCHEMA SystemSchema;
GO
ALTER SCHEMA SystemSchema TRANSFER HospitalSchema.Staff;
ALTER SCHEMA SystemSchema TRANSFER HospitalSchema.Users;
ALTER SCHEMA SystemSchema TRANSFER Departments;

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME IN ('Staff', 'Users', 'Departments');

DROP SCHEMA HospitalSchema;

-- SCHEMA: DoctorsSchema
CREATE SCHEMA DoctorsSchema;
GO
ALTER SCHEMA DoctorsSchema TRANSFER Doctors;
ALTER SCHEMA DoctorsSchema TRANSFER Appointments;
ALTER SCHEMA DoctorsSchema TRANSFER MedicalRecords;



-- SCHEMA: ReceptionistSchema
CREATE SCHEMA ReceptionistSchema;
GO
ALTER SCHEMA ReceptionistSchema TRANSFER Rooms;
ALTER SCHEMA ReceptionistSchema TRANSFER Admissions;


--PatientsSchema
CREATE SCHEMA PatientsSchema;
GO
ALTER SCHEMA PatientsSchema TRANSFER Patients;  
ALTER SCHEMA PatientsSchema TRANSFER Billing;
