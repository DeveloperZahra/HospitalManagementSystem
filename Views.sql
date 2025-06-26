--=====USE THE DATABASE=====

USE HospitalManagementSystem 

--==========Views==========
--1• vw_DoctorSchedule: Upcoming appointments per doctor.
CREATE VIEW vw_DoctorSchedule1 AS
SELECT 
    D.DoctorID,
    D.D_FirstName ,
	D.D_LastName,
    A.AppointmentDate,
    P.P_FirstName ,
	P.P_LastName
FROM DoctorsSchema.Doctors D
JOIN DoctorsSchema.Appointments A ON D.DoctorID = A.DoctorID
JOIN PatientsSchema.Patients P ON A.PatientID = P.PatientID
WHERE A.AppointmentDate >= CAST(GETDATE() AS DATE); --to show only upcoming appointments

--to call VIEW vw_DoctorSchedule
SELECT * FROM vw_DoctorSchedule1;
select * from DoctorsSchema.Appointments




--2• vw_PatientSummary: Patient info with their latest visit.


CREATE VIEW vw_PatientSummary AS
SELECT
P.PatientID,
P.P_FirstName,
P.P_LastName,
P.DOB,
P.Gender,
MAX(A.AppointmentDate) AS LastVisitDate
FROM PatientsSchema.Patients P
LEFT JOIN DoctorsSchema.Appointments A ON P.PatientID = A.PatientID
GROUP BY P.PatientID, P.P_FirstName, P.P_LastName, P.DOB, P.Gender;

SELECT * FROM vw_PatientSummary;


--3• vw_DepartmentStats: Number of doctors and patients per department.


CREATE VIEW vw_DepartmentStats AS
SELECT
D.DeptID,
DeptName,
COUNT(DISTINCT Doc.DoctorID) AS NumberOfDoctors,
COUNT(DISTINCT Pat.PatientID) AS NumberOfPatients
FROM SystemSchema.Departments D
LEFT JOIN DoctorsSchema.Doctors Doc ON D.DeptID = Doc.DeptID
LEFT JOIN SystemSchema.Staff S ON D.DeptID = S.DeptID AND S.Role = 'Doctor'
LEFT JOIN DoctorsSchema.Appointments A ON Doc.DoctorID = A.DoctorID
LEFT JOIN PatientsSchema.Patients Pat ON A.PatientID = Pat.PatientID
GROUP BY D.DeptID, DeptName;

SELECT * FROM vw_DepartmentStats;