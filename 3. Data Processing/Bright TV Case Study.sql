-- Databricks notebook source
--------------------------------------------------------------------------
select * from `exercise`.`bright_tv`.`bright_tv_dataset_user_profiles` limit 100;
---------------------------------------------------------------------------------
Select distinct Gender
from `exercise`.`bright_tv`.`bright_tv_dataset_user_profiles`;
---------------------------------------------------------------------------------
---Gender Checks
---------------------------------------------------------------------------------
SELECT DISTINCT
CASE
  WHEN gender = 'None' THEN 'Unknown'
  WHEN gender = '  ' THEN 'Unknown'
  WHEN gender IS NULL THEN 'Unknown'
  ELSE gender
END AS SEX
FROM exercise.bright_tv.bright_tv_dataset_user_profiles;
----------------------------------------------------------------------------------
---Race Checks
----------------------------------------------------------------------------------
Select distinct Race
from exercise.bright_tv.bright_tv_dataset_user_profiles;

SELECT COUNT (DISTINCT userid) AS Subs,
CASE
  WHEN Race = 'None' THEN 'Unknown'
  WHEN Race = 'other' THEN 'Unknown'
  WHEN Race = '    ' THEN 'Unknown'
  WHEN Race IS NULL THEN 'Unknown'
  ELSE Race
END AS enthnicity
FROM exercise.bright_tv.bright_tv_dataset_user_profiles
Group by enthnicity;
----------------------------------------------------------------------------------
---Province Checks
----------------------------------------------------------------------------------
SELECT DISTINCT
CASE
  WHEN Province = 'None' THEN 'Unknown'
  WHEN Province = 'other' THEN 'Unknown'
  WHEN Province = '    ' THEN 'Unknown'
  WHEN Province IS NULL THEN 'Unknown'
  ELSE Province
END AS Region
FROM exercise.bright_tv.bright_tv_dataset_user_profiles;
----------------------------------------------------------------------------------
---Age Checks
----------------------------------------------------------------------------------
SELECT MIN(AGE) AS min_age,
MAX(Age) AS max_age,
AVG (Age) AS avg_age
from exercise.bright_tv.bright_tv_dataset_user_profiles

SELECT
CASE
  WHEN AGE = 0 THEN 'Infant'
  WHEN AGE = BETWEEN 1 AND 12 THEN 'Kids'
  WHEN AGE = BETWEEN 13 AND 17 THEN 'Youth'
  WHEN AGE = BETWEEN 18 AND 35 THEN 'Young Adult'
  WHEN AGE = BETWEEN 36 AND 50 THEN 'Adults'
  WHEN AGE > 50 AND AGE<=60 THEN 'Elder'
  WHEN AGE > 60 THEN 'Pensioner'
END AS Age_Group
FROM exercise.bright_tv.bright_tv_dataset_user_profiles;
-----------------------------------------------------------------------------------------------------
Class Code 13/07/2026
-----------------------------------------------------------------------------------------------------
--------------------------------------------------
-- Checking all the columns in the table viewrship
--------------------------------------------------
SELECT *
FROM exercise.bright_tv.bright_tv_dataset_viewership;
--------------------------------------------------
-- Checking if there is any row where in the column userid0 is empty
--------------------------------------------------
SELECT *
FROM exercise.bright_tv.bright_tv_dataset_viewership
WHERE UserID0 IS NULL 
    OR userid4 IS NULL;
------------------------------------------------------
SELECT *
FROM exercise.bright_tv.bright_tv_dataset_viewership
WHERE userid0 <> userid4;

----------------------------------------------------------
-- Checking for duplicates
----------------------------------------------------------
SELECT COUNT(*),
       UserID0, RecordDate2
FROM exercise.bright_tv.bright_tv_dataset_viewership
GROUP BY UserID0, RecordDate2
HAVING COUNT(*)>1;

SELECT
    UserID0,
    RecordDate2,
    COUNT(*) AS duplicate_count
FROM exercise.bright_tv.bright_tv_dataset_viewership
GROUP BY
    UserID0,
    RecordDate2
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;
----------------------------------------
SELECT UserID0,
       TO_DATE(RecordDate2) AS watch_date,
       date_format(RecordDate2, 'HH:mm:ss') AS watch_time,
       date_format(Duration 2, 'HH:mm:ss') AS duration,
        Channel2
FROM exercise.bright_tv.bright_tv_dataset_viewership
WHERE userid0=810044;
