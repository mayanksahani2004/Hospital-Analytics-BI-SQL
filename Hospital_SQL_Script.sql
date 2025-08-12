-- CREATE DATABASE hospital;
-- USE hospital;

-- CREATE TABLE hospital (
--     patient_id VARCHAR(50),
--     patient_admission_date DATETIME,
--     patient_first_inital CHAR(1),
--     patient_last_name VARCHAR(50),
--     patient_gender VARCHAR(10),
--     patient_age INT,
--     patient_race VARCHAR(50),
--     department_referral VARCHAR(100),
--     patient_admission_flag BOOLEAN,
--     patient_satisfaction_score varchar(20),
--     patient_waittime INT,
--     patients_cm INT
-- );


-- 1. Total No. of Patients.
SELECT COUNT(patient_id) AS patient_count 
FROM hospital;


-- 2. Average Age of Patients.
SELECT ROUND(AVG(patient_age)) AS avg_age
FROM hospital;


-- 3.  Average Satisfaction Score by Patients.
SELECT ROUND(AVG(patient_satisfaction_score),2) AS avg_score
FROM hospital;


-- 4. Average Waiting Time spent by Patients
SELECT AVG(patient_waittime) AS avg_waittime
FROM hospital;


-- 5. Patient Count by Gender
SELECT patient_gender AS gender,COUNT(patient_id) AS patient_count
FROM hospital
GROUP BY gender
ORDER BY patient_count DESC;


-- 6. Patient Count by Age-Group 
SELECT CASE WHEN patient_age < 10 THEN "0-10" WHEN patient_age < 20 THEN "10-20" WHEN patient_age < 30 THEN "20-30" WHEN patient_age < 40 THEN "30-40" 
			WHEN patient_age < 50 THEN "40-50" WHEN patient_age < 60 THEN "50-60" WHEN patient_age < 70 THEN "60-70" ELSE "70-80" END AS Age_Group,
COUNT(patient_id) AS patient_count
FROM hospital
GROUP BY Age_Group
ORDER BY Age_Group;


-- 7. Patient Count by Race
SELECT patient_race AS race,COUNT(patient_id) AS patient_count
FROM hospital
GROUP BY race
ORDER BY patient_count DESC;


-- 8. Patient Count by Department Referral
SELECT department_referral AS department,COUNT(patient_id) AS patient_count
FROM hospital
GROUP BY department_referral
ORDER BY patient_count DESC;	


-- 9.1 Patient Count by WeekDays
SELECT DATE_FORMAT(patient_admission_date,"%W") AS WeekDays, COUNT(patient_id) AS patient_count
FROM hospital
GROUP BY DATE_FORMAT(patient_admission_date,"%W"),DATE_FORMAT(patient_admission_date,"%w")
ORDER BY DATE_FORMAT(patient_admission_date,"%w");


-- 9.2 Weekend/Weekday Distribution
SELECT CASE WHEN DATE_FORMAT(patient_admission_date,"%W") IN ("Sunday","Saturday") THEN "Weekend" ELSE "Weekday" END AS Weekend_Weekday,COUNT(patient_id) AS patient_count
FROM hospital
GROUP BY Weekend_Weekday;


-- 10. Patient Count by Month Name
SELECT DATE_FORMAT(patient_admission_date,"%M") AS MonthName, COUNT(patient_id) AS patient_count
FROM hospital
GROUP BY DATE_FORMAT(patient_admission_date,"%M"),DATE_FORMAT(patient_admission_date,"%m")
ORDER BY DATE_FORMAT(patient_admission_date,"%m");


-- 11. Patient Count by Hours
SELECT DATE_FORMAT(patient_admission_date,"%H") AS Hours, COUNT(patient_id) AS patient_count
FROM hospital
GROUP BY DATE_FORMAT(patient_admission_date,"%H"), DATE_FORMAT(patient_admission_date,"%h")
ORDER BY DATE_FORMAT(patient_admission_date,"%H");


-- 12. Patient Count by Admission Flag
SELECT patient_admission_flag, COUNT(patient_id) AS patient_count
FROM hospital
GROUP BY patient_admission_flag;
