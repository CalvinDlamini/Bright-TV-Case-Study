-- Databricks notebook source
--------------------------------------------------------------------------
select * from `exercise`.`bright_tv`.`bright_tv_dataset_user_profiles` limit 100;
---------------------------------------------------------------------------------
Select distinct Gender
from `exercise`.`bright_tv`.`bright_tv_dataset_user_profiles`;
---------------------------------------------------------------------------------
Gender Checks
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
Race Checks
----------------------------------------------------------------------------------
Select distinct Race
from exercise.bright_tv.bright_tv_dataset_user_profiles;

SELECT DISTINCT
CASE
  WHEN Race = 'None' THEN 'Unknown'
  WHEN Race = 'other' THEN 'Unknown'
  WHEN Race = '    ' THEN 'Unknown'
  WHEN Race IS NULL THEN 'Unknown'
  ELSE Race
END AS enthnicity
FROM exercise.bright_tv.bright_tv_dataset_user_profiles
Group by enthnicity;

