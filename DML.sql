--=====USE THE DATABASE=====

USE HospitalManagementSystem 

GO

--=================DML==============
--==INSERT Statements Per Table==

--=====TO INSERT DATA FOR Departments TABLE======

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Cardiology'), (2, 'Neurology'), (3, 'Orthopedics'), (4, 'Dermatology'), (5, 'Emergency'),
(6, 'Pediatrics'), (7, 'Radiology'), (8, 'Oncology'), (9, 'Psychiatry'), (10, 'Urology'),
(11, 'ENT'), (12, 'Gastroenterology'), (13, 'Nephrology'), (14, 'Ophthalmology'), (15, 'General Surgery'),
(16, 'Pathology'), (17, 'Rheumatology'), (18, 'Pulmonology'), (19, 'Endocrinology'), (20, 'Infectious Diseases'),
(21, 'Anesthesiology');

SELECT * FROM Departments

--=====TO INSERT DATA FOR Doctors THABLE=====

INSERT INTO Doctors (DoctorID, D_FirstName, D_LastName, Specialization,   D_PhoneNumber, D_Email, DeptID) VALUES
(1, 'Ahmed', 'Khalid', 'Cardiology', '900001', 'ahmed1@hms.com', 1),
(2, 'Fatima', 'Noor', 'Dermatology', '900002', 'fatima2@hms.com', 4),
(3, 'Omar', 'Hassan', 'Orthopedics', '900003', 'omar3@hms.com', 3),
(4, 'Layla', 'Saad', 'Neurology', '900004', 'layla4@hms.com', 2),
(5, 'Tariq', 'Zain', 'Emergency', '900005', 'tariq5@hms.com', 5),
(6, 'Rania', 'Ali', 'Pediatrics', '900006', 'rania6@hms.com', 6),
(7, 'Yousef', 'Majid', 'Radiology', '900007', 'yousef7@hms.com', 7),
(8, 'Nadia', 'Fahad', 'Oncology', '900008', 'nadia8@hms.com', 8),
(9, 'Hassan', 'Tamer', 'Psychiatry', '900009', 'hassan9@hms.com', 9),
(10, 'Zahra', 'Nabil', 'Urology', '900010', 'zahra10@hms.com', 10),
(11, 'Salim', 'Musa', 'ENT', '900011', 'salim11@hms.com', 11),
(12, 'Samira', 'Rami', 'Gastroenterology', '900012', 'samira12@hms.com', 12),
(13, 'Walid', 'Kamal', 'Nephrology', '900013', 'walid13@hms.com', 13),
(14, 'Jana', 'Adel', 'Ophthalmology', '900014', 'jana14@hms.com', 14),
(15, 'Hatem', 'Sami', 'General Surgery', '900015', 'hatem15@hms.com', 15),
(16, 'Nada', 'Yasir', 'Pathology', '900016', 'nada16@hms.com', 16),
(17, 'Anas', 'Tariq', 'Rheumatology', '900017', 'anas17@hms.com', 17),
(18, 'Dina', 'Omar', 'Pulmonology', '900018', 'dina18@hms.com', 18),
(19, 'Khaled', 'Zaki', 'Endocrinology', '900019', 'khaled19@hms.com', 19),
(20, 'Iman', 'Rashid', 'Infectious Diseases', '900020', 'iman20@hms.com', 20),
(21, 'Bassam', 'Amir', 'Anesthesiology', '900021', 'bassam21@hms.com', 21);

SELECT * FROM Doctors

--====TO INSERT DATA FOR  Rooms TABLE=======

INSERT INTO Rooms (RoomID, Type, Available) VALUES
(1,  'ICU', 'No'), (2, 'General', 'Yes'), (3,  'General', 'Yes'),
(4, 'ICU', 'Yes'), (5, 'General', 'No'), (6, 'ICU', 'Yes'),
(7, 'General', 'Yes'), (8,  'General', 'No'), (9,  'ICU', 'Yes'),
(10,  'General', 'Yes'), (11,  'ICU', 'Yes'), (12,  'General', 'Yes'),
(13,  'ICU', 'No'), (14,  'General', 'Yes'), (15, 'ICU', 'No'),
(16, 'General', 'Yes'), (17,  'ICU', 'Yes'), (18,  'General', 'Yes'),
(19,  'ICU', 'No'), (20,  'General', 'Yes'), (21,  'General', 'Yes');

SELECT * FROM Rooms

--=====TO INSERT DATA FOR Patients TABLE======

INSERT INTO Patients (PatientID, P_FirstName, P_LastName, DOB, Gender, P_PhoneNumber) VALUES
(1, 'John', 'Doe', '1990-05-22', 'Male', '99998801'),
(2, 'Jane', 'Smith', '1985-11-12', 'Female', '99998802'),
(3, 'Ali', 'Hassan', '1975-08-01', 'Male', '99998803'),
(4, 'Sara', 'Khan', '1993-03-30', 'Female', '99998804'),
(5, 'Omar', 'Fahad', '1982-09-17', 'Male', '99998805'),
(6, 'Laila', 'Zain', '1995-07-19', 'Female', '99998806'),
(7, 'Khalid', 'Adel', '1988-10-24', 'Male', '99998807'),
(8, 'Noor', 'Salim', '1991-12-01', 'Female', '99998808'),
(9, 'Mohamed', 'Rami', '1980-06-11', 'Male', '99998809'),
(10, 'Amira', 'Walid', '1996-02-28', 'Female', '99998810'),
(11, 'Huda', 'Tariq', '1978-04-14', 'Female', '99998811'),
(12, 'Yousef', 'Karim', '1992-01-07', 'Male', '99998812'),
(13, 'Rania', 'Zaki', '1994-09-13', 'Female', '99998813'),
(14, 'Salma', 'Hatem', '1983-05-10', 'Female', '99998814'),
(15, 'Fadi', 'Nabil', '1976-07-23', 'Male', '99998815'),
(16, 'Mona', 'Anas', '1989-11-05', 'Female', '99998816'),
(17, 'Bassam', 'Yasir', '1986-03-18', 'Male', '99998817'),
(18, 'Amina', 'Omar', '1997-08-30', 'Female', '99998818'),
(19, 'Nader', 'Zain', '1981-01-02', 'Male', '99998819'),
(20, 'Hana', 'Majid', '1990-10-26', 'Female', '99998820'),
(21, 'Ibrahim', 'Adel', '1983-01-09', 'Male', '99998821');

SELECT * FROM Patients

--====TO INSERT DATA FOR Appointments TABLE===== 

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 1, 1, '2025-06-24 09:00:00', 'Confirmed'), (2, 2, 2, '2025-06-24 09:30:00', 'Pending'),
(3, 3, 3, '2025-06-24 10:00:00', 'Confirmed'), (4, 4, 4, '2025-06-24 10:30:00', 'Cancelled'),
(5, 5, 5, '2025-06-24 11:00:00', 'Confirmed'), (6, 6, 6, '2025-06-24 11:30:00', 'Pending'),
(7, 7, 7, '2025-06-24 12:00:00', 'Confirmed'), (8, 8, 8, '2025-06-24 12:30:00', 'Confirmed'),
(9, 9, 9, '2025-06-24 13:00:00', 'Pending'), (10, 10, 10, '2025-06-24 13:30:00', 'Confirmed'),
(11, 11, 11, '2025-06-24 14:00:00', 'Confirmed'), (12, 12, 12, '2025-06-24 14:30:00', 'Pending'),
(13, 13, 13, '2025-06-24 15:00:00', 'Confirmed'), (14, 14, 14, '2025-06-24 15:30:00', 'Confirmed'),
(15, 15, 15, '2025-06-24 16:00:00', 'Cancelled'), (16, 16, 16, '2025-06-24 16:30:00', 'Pending'),
(17, 17, 17, '2025-06-24 17:00:00', 'Confirmed'), (18, 18, 18, '2025-06-24 17:30:00', 'Confirmed'),
(19, 19, 19, '2025-06-24 18:00:00', 'Confirmed'), (20, 20, 20, '2025-06-24 18:30:00', 'Pending'),
(21, 21, 21, '2025-06-24 19:00:00', 'Confirmed');

SELECT * FROM Appointments

--====TO INSERT DATA FOR Admissions TABLE=====

INSERT INTO Admissions (AdmissionID, PatientID, RoomID, DateIn , DateOut) VALUES
(1, 1, 1, '2025-06-20', NULL), (2, 2, 2, '2025-06-19', '2025-06-22'),
(3, 3, 3, '2025-06-18', '2025-06-20'), (4, 4, 4, '2025-06-21', NULL),
(5, 5, 5, '2025-06-15', '2025-06-18'), (6, 6, 6, '2025-06-13', '2025-06-15'),
(7, 7, 7, '2025-06-12', '2025-06-14'), (8, 8, 8, '2025-06-11', '2025-06-13'),
(9, 9, 9, '2025-06-10', '2025-06-12'), (10, 10, 10, '2025-06-09', '2025-06-11'),
(11, 11, 11, '2025-06-08', '2025-06-10'), (12, 12, 12, '2025-06-07', '2025-06-09'),
(13, 13, 13, '2025-06-06', '2025-06-08'), (14, 14, 14, '2025-06-05', '2025-06-07'),
(15, 15, 15, '2025-06-04', '2025-06-06'), (16, 16, 16, '2025-06-03', '2025-06-05'),
(17, 17, 17, '2025-06-02', '2025-06-04'), (18, 18, 18, '2025-06-01', '2025-06-03'),
(19, 19, 19, '2025-05-31', '2025-06-02'), (20, 20, 20, '2025-05-30', '2025-06-01'),
(21, 21, 21, '2025-05-29', '2025-05-31');

SELECT * FROM Admissions
--===TO INSERT DATA FOR MedicalRecords TABLE===

INSERT INTO MedicalRecords (RecordID, PatientID,  Diagnosis,  TreatmentPlan, Date, Notes) VALUES
(1, 1,  'Hypertension', 'Medication', '2025-06-20', 'Monitor BP daily'),
(2, 2, 'Diabetes', 'Insulin therapy', '2025-06-19', 'Follow diet plan'),
(3, 3, 'Fracture', 'Cast', '2025-06-18', 'Recheck in 6 weeks'),
(4, 4, 'Migraine', 'Painkillers', '2025-06-21', 'Reduce screen time'),
(5, 5, 'Asthma', 'Inhalers', '2025-06-15', 'Avoid allergens'),
(6, 6, 'Flu', 'Rest and hydration', '2025-06-13', 'Normal flu symptoms'),
(7, 7, 'Skin allergy', 'Antihistamines', '2025-06-12', 'Topical ointment'),
(8, 8, 'Cancer screening', 'Lab tests', '2025-06-11', 'Follow-up next week'),
(9, 9, 'Anxiety', 'Therapy', '2025-06-10', 'Weekly sessions'),
(10, 10,  'Kidney stones', 'Medication', '2025-06-09', 'Ultrasound needed'),
(11, 11,  'Ear infection', 'Antibiotics', '2025-06-08', 'Pain reported'),
(12, 12,  'Ulcer', 'Antacids', '2025-06-07', 'No spicy food'),
(13, 13,  'Kidney failure', 'Dialysis', '2025-06-06', 'Check creatinine'),
(14, 14,  'Eye pain', 'Eye drops', '2025-06-05', 'Reduce screen exposure'),
(15, 15,  'Appendicitis', 'Surgery', '2025-06-04', 'Successful operation'),
(16, 16,   'Anemia', 'Iron supplements', '2025-06-03', 'Follow iron diet'),
(17, 17,   'Arthritis', 'Pain management', '2025-06-02', 'Regular exercise'),
(18, 18,  'Bronchitis', 'Antibiotics', '2025-06-01', 'Chest X-ray needed'),
(19, 19,  'Thyroid disorder', 'Hormone therapy', '2025-05-31', 'Follow dosage'),
(20, 20,  'COVID-19', 'Isolation', '2025-05-30', 'Negative after 10 days'),
(21, 21,  'Pre-surgery check', 'Blood tests', '2025-05-29', 'Ready for OR');

SELECT * FROM MedicalRecords


--===TO INSERT DATA FOR Billing TABLE===

INSERT INTO Billing (BillID, PatientID, TotalCost , Date, Services) VALUES
(1, 1, 150.00, '2025-06-20', 'Consultation'),
(2, 2, 320.00, '2025-06-19', 'Lab tests'),
(3, 3, 500.00, '2025-06-18', 'X-Ray, Cast'),
(4, 4, 100.00, '2025-06-21', 'Neurology review'),
(5, 5, 250.00, '2025-06-15', 'Asthma treatment'),
(6, 6, 80.00, '2025-06-13', 'Flu medicine'),
(7, 7, 120.00, '2025-06-12', 'Skin treatment'),
(8, 8, 600.00, '2025-06-11', 'CT Scan'),
(9, 9, 220.00, '2025-06-10', 'Psychiatric consult'),
(10, 10, 180.00, '2025-06-09', 'Urology review'),
(11, 11, 90.00, '2025-06-08', 'ENT check'),
(12, 12, 300.00, '2025-06-07', 'Endoscopy'),
(13, 13, 700.00, '2025-06-06', 'Dialysis'),
(14, 14, 110.00, '2025-06-05', 'Ophthalmology'),
(15, 15, 1000.00, '2025-06-04', 'Surgery'),
(16, 16, 85.00, '2025-06-03', 'Blood tests'),
(17, 17, 230.00, '2025-06-02', 'Rheumatology'),
(18, 18, 190.00, '2025-06-01', 'Pulmonology'),
(19, 19, 210.00, '2025-05-31', 'Endocrinology'),
(20, 20, 500.00, '2025-05-30', 'COVID-19 test & isolation'),
(21, 21, 350.00, '2025-05-29', 'Pre-surgery tests'); 

SELECT * FROM Billing
--===TO INSERT DATA FOR Users TABLE==== 

INSERT INTO Users (UserID, Username, Password) VALUES
(1, 'admin1', 'admin123'),
(2, 'doctor1', 'pass123'),
(3, 'nurse1', 'nurse123'),
(4, 'staff1', 'staff123'),
(5, 'reception1', 'recept123'),
(6, 'admin2', 'admin456'),
(7, 'doctor2', 'doc456'),
(8, 'nurse2', 'nurse456'),
(9, 'staff2', 'staff456'),
(10, 'reception2', 'recept456'),
(11, 'admin3', 'admin789'),
(12, 'doctor3', 'doc789'),
(13, 'nurse3', 'nurse789'),
(14, 'staff3', 'staff789'),
(15, 'reception3', 'recept789'),
(16, 'admin4', 'admin321'),
(17, 'doctor4', 'doc321'),
(18, 'nurse4', 'nurse321'),
(19, 'staff4', 'staff321'),
(20, 'reception4', 'recept321'),
(21, 'systemadmin', 'sysadmin');

SELECT * FROM Users
--===TO INSERT DATA FOR Staff TABLE======

INSERT INTO Staff (StaffID, S_FirstName, S_LastName, Role, Shift, DeptID) VALUES
(1, 'Aisha', 'Salem', 'Nurse', 'Morning', 1),
(2, 'Hassan', 'Ali', 'Admin', 'Evening', 2),
(3, 'Omar', 'Kareem', 'Technician', 'Night', 3),
(4, 'Mona', 'Zaki', 'Receptionist', 'Morning', 4),
(5, 'Tariq', 'Hani', 'Cleaner', 'Evening', 5),
(6, 'Lina', 'Fahd', 'Nurse', 'Night', 6),
(7, 'Majed', 'Rami', 'Security', 'Night', 7),
(8, 'Noor', 'Saif', 'Nurse', 'Morning', 8),
(9, 'Yasmine', 'Tamer', 'Admin', 'Evening', 9),
(10, 'Ahmed', 'Basel', 'Receptionist', 'Morning', 10),
(11, 'Salma', 'Nour', 'Technician', 'Evening', 11),
(12, 'Jamal', 'Younis', 'Cleaner', 'Night', 12),
(13, 'Layla', 'Faris', 'Nurse', 'Morning', 13),
(14, 'Hussein', 'Ziad', 'Admin', 'Evening', 14),
(15, 'Nada', 'Walid', 'Security', 'Night', 15),
(16, 'Ali', 'Samer', 'Receptionist', 'Morning', 16),
(17, 'Rana', 'Khaled', 'Technician', 'Evening', 17),
(18, 'Sami', 'Ragheb', 'Cleaner', 'Night', 18),
(19, 'Dina', 'Hesham', 'Nurse', 'Morning', 19),
(20, 'Ibrahim', 'Amin', 'Admin', 'Evening', 20),
(21, 'Waleed', 'Shaker', 'Security', 'Night', 21); 

SELECT * FROM Staff 



