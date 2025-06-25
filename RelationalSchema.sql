--=====USE THE DATABASE=====

USE HospitalManagementSystem 


--====Relational Schema========

-- SCHEMA: SystemSchema

CREATE SCHEMA SystemSchema;
GO
ALTER SCHEMA SystemSchema TRANSFER Staff;
ALTER SCHEMA SystemSchema TRANSFER Users;
ALTER SCHEMA SystemSchema TRANSFER Departments;


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
