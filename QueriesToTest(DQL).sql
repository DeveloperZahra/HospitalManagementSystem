--=====USE THE DATABASE=====

USE HospitalManagementSystem 

--==Queries to Test (DQL)==

-- 1. List all patients who visited a certain doctor (e.g., DoctorID = 1)

SELECT P.P_FirstName, P.P_LastName, A.AppointmentDate

FROM PatientsSchema.Patients P

JOIN DoctorsSchema.Appointments A ON P.PatientID = A.PatientID

WHERE A.DoctorID = 1;

--2. Count of appointments per department.SELECT D.DeptName, COUNT(A.AppointmentID) AS AppointmentCount

FROM DoctorsSchema.Appointments A

JOIN DoctorsSchema.Doctors Doc ON A.DoctorID = Doc.DoctorID

JOIN SystemSchema.Departments D ON Doc.DeptID = D.DeptID

GROUP BY D.DeptName;-- 3. Retrieve doctors who have more than 5 appointments in a month (e.g., June 2025)

SELECT Doc.D_FirstName, Doc.D_LastName, COUNT(A.AppointmentID) AS TotalAppointments

FROM DoctorsSchema.Doctors Doc

JOIN DoctorsSchema.Appointments A ON Doc.DoctorID = A.DoctorID

WHERE MONTH(A.AppointmentDate) = 6 AND YEAR(A.AppointmentDate) = 2025

GROUP BY Doc.D_FirstName, Doc.D_LastName

HAVING COUNT(A.AppointmentID) >= 1;



-- 4. Use JOINs across 3–4 tables

SELECT P.P_FirstName AS PatientFirst, Doc.D_FirstName AS DoctorFirst, Dept.DeptName, A.AppointmentDate

FROM PatientsSchema.Patients P

JOIN DoctorsSchema.Appointments A ON P.PatientID = A.PatientID

JOIN DoctorsSchema.Doctors Doc ON A.DoctorID = Doc.DoctorID

JOIN SystemSchema.Departments Dept ON Doc.DeptID = Dept.DeptID;

-- 5. Use GROUP BY, HAVING, and aggregate functions

SELECT D.DeptName, COUNT(Doc.DoctorID) AS TotalDoctors

FROM SystemSchema.Departments D

JOIN DoctorsSchema.Doctors Doc ON D.DeptID = Doc.DeptID

GROUP BY D.DeptName

HAVING COUNT(Doc.DoctorID) >= 1;



-- 6. Use SUBQUERIES and EXISTS 


--select all doctors who treat 1  patients


SELECT Doc.DoctorID as 'Doctor ID', Doc.D_FirstName, Doc.D_LastName AS 'Doctor Name' 

FROM DoctorsSchema.Doctors Doc INNER JOIN DoctorsSchema.Appointments A ON Doc.DoctorID = A.DoctorID
WHERE EXISTS (
SELECT Doc.DoctorID  
FROM DoctorsSchema.Doctors Doc
)
GROUP BY  Doc.DoctorID, Doc.D_FirstName,Doc.D_LastName
HAVING COUNT(A.PatientID) >=1;