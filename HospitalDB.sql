CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
);

-- Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100)
);

-- Appointments Table
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Treatments Table
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    diagnosis VARCHAR(100),
    treatment_details VARCHAR(200),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Billing Table
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Insert Patients
INSERT INTO Patients VALUES
(1,'Pooja',21,'Female','9876543210'),
(2,'Rahul',25,'Male','9876543211'),
(3,'Sneha',22,'Female','9876543212'),
(4,'Arun',30,'Male','9876543213'),
(5,'Priya',28,'Female','9876543214'),
(6,'Karthik',35,'Male','9876543215'),
(7,'Divya',27,'Female','9876543216'),
(8,'Vignesh',29,'Male','9876543217');

-- Insert Doctors
INSERT INTO Doctors VALUES
(101,'Dr Kumar','Cardiology'),
(102,'Dr Priya','Dermatology'),
(103,'Dr Rajesh','Orthopedics'),
(104,'Dr Meena','Neurology'),
(105,'Dr Arvind','Pediatrics'),
(106,'Dr Kavitha','ENT'),
(107,'Dr Senthil','Ophthalmology');

-- Insert Appointments
INSERT INTO Appointments VALUES
(1001,1,101,'2025-06-01'),
(1002,2,101,'2025-06-02'),
(1003,3,102,'2025-06-03'),
(1004,4,103,'2025-06-04'),
(1005,5,104,'2025-06-05'),
(1006,6,105,'2025-06-06'),
(1007,7,106,'2025-06-07'),
(1008,8,107,'2025-06-08');

-- Insert Treatments
INSERT INTO Treatments VALUES
(201,1001,'High Blood Pressure','Medication'),
(202,1002,'Heart Checkup','Routine Examination'),
(203,1003,'Skin Allergy','Cream Prescription'),
(204,1004,'Knee Pain','Physiotherapy'),
(205,1005,'Migraine','Medication'),
(206,1006,'Child Fever','Paracetamol'),
(207,1007,'ENT Infection','Antibiotics'),
(208,1008,'Eye Irritation','Eye Drops');

-- Insert Billing
INSERT INTO Billing VALUES
(301,1,1500,'Paid'),
(302,2,2000,'Paid'),
(303,3,1200,'Pending'),
(304,4,2500,'Paid'),
(305,5,1800,'Pending'),
(306,6,1000,'Paid'),
(307,7,1400,'Paid'),
(308,8,1600,'Pending');
