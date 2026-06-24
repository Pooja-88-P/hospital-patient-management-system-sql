-- 1. Doctor Workload Analysis
SELECT
    d.doctor_name,
    COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY total_appointments DESC;

-- 2. Patient Visit Tracking
SELECT
    p.patient_name,
    d.doctor_name,
    a.appointment_date
FROM Patients p
JOIN Appointments a
ON p.patient_id = a.patient_id
JOIN Doctors d
ON a.doctor_id = d.doctor_id;

-- 3. Treatment Details
SELECT
    p.patient_name,
    d.doctor_name,
    t.diagnosis
FROM Treatments t
JOIN Appointments a
ON t.appointment_id = a.appointment_id
JOIN Patients p
ON a.patient_id = p.patient_id
JOIN Doctors d
ON a.doctor_id = d.doctor_id;

-- 4. Billing Status Report
SELECT
    p.patient_name,
    b.amount,
    b.payment_status
FROM Patients p
JOIN Billing b
ON p.patient_id = b.patient_id;

-- 5. Total Revenue Generated
SELECT SUM(amount) AS total_revenue
FROM Billing
WHERE payment_status = 'Paid';

-- 6. Pending Payments
SELECT
    p.patient_name,
    b.amount
FROM Patients p
JOIN Billing b
ON p.patient_id = b.patient_id
WHERE b.payment_status = 'Pending';
