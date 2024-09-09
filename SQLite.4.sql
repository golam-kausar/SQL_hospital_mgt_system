SELECT * from healthcare;

SELECT gender, avg(age) as average_age
from healthcare
group by gender;

SELECT date_of_admission, count(*) as patient_count
from healthcare
GROUP by date_of_admission;

SELECT doctor, count(*) as patient_count
from healthcare
GROUP by doctor
order by patient_count DESC;

SELECT hospital, sum(billing_amount) as total_billing
from healthcare
GROUP by hospital
ORDER by total_billing DESC;

SELECT hospital, COUNT(*) AS admission_count, SUM(billing_amount) AS total_billing
FROM healthcare
GROUP BY hospital
ORDER BY total_billing DESC;

SELECT insurance_provider, sum(billing_amount) as total_billing
from healthcare
GROUP by insurance_provider;

SELECT AVG(billing_amount) AS average_billing
FROM healthcare;

SELECT medical_condition, COUNT (*) as patient_count
FROM healthcare
GROUP by medical_condition;

SELECT blood_type, medical_condition, COUNT(*) as count_ptn
from healthcare
GROUP by blood_type, medical_condition;

SELECT name, discharge_date - date_of_admission as stay_duration
from healthcare;

SELECT hospital, avg(discharge_date - date_of_admission) as avg_stay_duration
from healthcare
GROUP by hospital;

SELECT medication, count(*) as patient_count
from healthcare
GROUP by medication;

SELECT test_results, medical_condition, count (*) as count_patient
from healthcare
GROUP by test_results, medical_condition;

SELECT room_number, count(*) as patient_count
from healthcare
GROUP by room_number;

SELECT insurance_provider, COUNT(*) AS patient_count
FROM healthcare
GROUP BY insurance_provider
ORDER BY patient_count DESC;

SELECT insurance_provider, AVG(billing_amount) AS average_billing
FROM healthcare
GROUP BY insurance_provider
ORDER BY average_billing DESC;

SELECT strftime ('%m', date_of_admission) as month, count(*) as patient_count
from healthcare
GROUP by month
order by month;

SELECT CASE
        when strftime ('%w', date_of_admission) in ('0', '6') then 'Weekend'
        ELSE 'Weekday'
       End as day_type, COUNT (*) as admission_count
from healthcare
GROUP by day_type;

SELECT name, COUNT(*) as admission_count
from healthcare
GROUP by name
HAVING admission_count > 1;

SELECT COUNT (*) as total_readmissions
from healthcare
WHERE (julianday(discharge_date) - julianday(date_of_admission)) <= 30;

SELECT medical_condition, avg(discharge_date - date_of_admission) as avg_stay_duration
from healthcare
GROUP by medical_condition;

SELECT medical_condition, SUM(billing_amount) AS total_billing, AVG(discharge_date - date_of_admission) AS avg_stay
FROM healthcare
GROUP BY medical_condition
ORDER BY total_billing DESC;

SELECT case 
         when age BETWEEN 0 and 18 then '0-18'
         when age BETWEEN 19 and 35 then '19-35'
         when age BETWEEN 36 and 60 then '36-60'
         else '60+'
       End as age_group, count (*) as patient_count
from healthcare
GROUP by age_group; 

SELECT CASE
         WHEN age BETWEEN 0 AND 18 THEN '0-18'
         WHEN age BETWEEN 19 AND 35 THEN '19-35'
         WHEN age BETWEEN 36 AND 60 THEN '36-60'
         ELSE '60+'
       END AS age_group, AVG(billing_amount) AS avg_billing
FROM healthcare
GROUP BY age_group;

SELECT gender, medical_condition, COUNT(*) AS patient_count
FROM healthcare
GROUP BY gender, medical_condition;

SELECT gender, AVG(discharge_date - date_of_admission) AS avg_stay_duration, AVG(billing_amount) AS avg_billing
FROM healthcare
GROUP BY gender;

SELECT room_number, COUNT(*) AS patient_count
FROM healthcare
GROUP BY room_number
ORDER BY patient_count DESC;

SELECT room_number, avg(billing_amount) as avg_billing
from healthcare
GROUP by room_number
order by avg_billing DESC;

SELECT doctor, avg(discharge_date - date_of_admission) as avg_recovery_time
from healthcare
group by doctor
ORDER by avg_recovery_time;

SELECT medication, avg(discharge_date - date_of_admission) as avg_recovery_time
from healthcare
GROUP by medication; 

SELECT admission_type, avg (billing_amount) as avg_billing, avg(discharge_date - date_of_admission) as avg_stay_duration
from healthcare
GROUP by admission_type;
