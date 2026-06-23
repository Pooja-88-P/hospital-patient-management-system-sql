-- Doctor Workload Analysis

SELECT
    d.doctor_name,
    COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY total_appointments DESC;