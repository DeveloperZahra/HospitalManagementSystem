--=====USE THE DATABASE=====

USE HospitalManagementSystem 

--====Security (DCL)=======
--1• Create at least two user roles: DoctorUser, AdminUser.

CREATE ROLE DoctorUser;
CREATE ROLE AdminUser;

--2• GRANT SELECT for DoctorUser on Patients and Appointments only.

GRANT SELECT ON PatientsSchema.Patients TO DoctorUser;
GRANT SELECT ON DoctorsSchema.Appointments TO DoctorUser;


--3• GRANT INSERT, UPDATE for AdminUser on all tables.

--SystemSchema
GRANT INSERT, UPDATE ON SystemSchema.Staff TO AdminUser;
GRANT INSERT, UPDATE ON SystemSchema.Users TO AdminUser;
GRANT INSERT, UPDATE ON SystemSchema.Departments TO AdminUser;

-- DoctorsSchema
GRANT INSERT, UPDATE ON DoctorsSchema.Doctors TO AdminUser;
GRANT INSERT, UPDATE ON DoctorsSchema.Appointments TO AdminUser;
GRANT INSERT, UPDATE ON DoctorsSchema.MedicalRecords TO AdminUser;

--ReceptionistSchema
GRANT INSERT, UPDATE ON PatientsSchema.Patients TO AdminUser;
GRANT INSERT, UPDATE ON PatientsSchema.Billing TO AdminUser;


--PatientsSchema
GRANT INSERT, UPDATE ON ReceptionistSchema.Rooms TO AdminUser;
GRANT INSERT, UPDATE ON ReceptionistSchema.Admissions TO AdminUser;




--4• REVOKE DELETE for Doctors.

REVOKE DELETE ON DoctorsSchema.Doctors TO PUBLIC;
