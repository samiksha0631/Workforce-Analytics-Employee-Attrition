/*==============================================================
                  WORKFORCE ANALYTICS PROJECT
===============================================================
Project : Workforce Analytics – Employee Attrition Analysis
Author  : Samiksha Borhade
Database: employee_analytics

Description:
This SQL project analyzes employee attrition, workforce
distribution, salary trends, experience levels, and employee
satisfaction using the IBM HR Employee Attrition dataset.
==============================================================*/

/*====================================================================
STEP 1 : CREATE DATABASE
====================================================================*/

CREATE DATABASE IF NOT EXISTS employee_analytics;

USE employee_analytics;


/*====================================================================
STEP 2 : CREATE TABLE
====================================================================*/

CREATE TABLE IF NOT EXISTS employee_attrition (

    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeCount INT,
    EmployeeNumber INT,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(100),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT

);


/*====================================================================
STEP 3 : VERIFY DATA
====================================================================*/

SHOW TABLES;

DESCRIBE employee_attrition;

SELECT COUNT(*) AS Total_Rows
FROM employee_attrition;


/*====================================================================
SECTION A : WORKFORCE OVERVIEW
====================================================================*/


-- Query 1
-- Total Employees

SELECT COUNT(*) AS Total_Employees
FROM employee_attrition;



-- Query 2
-- Attrition Rate

SELECT

ROUND(

COUNT(CASE WHEN Attrition='Yes' THEN 1 END)

*100.0/

COUNT(*)

,2) AS Attrition_Rate

FROM employee_attrition;



-- Query 3
-- Employees by Department

SELECT

Department,

COUNT(*) AS Total_Employees

FROM employee_attrition

GROUP BY Department

ORDER BY Total_Employees DESC;



-- Query 4
-- Employees by Job Role

SELECT

JobRole,

COUNT(*) AS Employees

FROM employee_attrition

GROUP BY JobRole

ORDER BY Employees DESC;



-- Query 5
-- Gender Distribution

SELECT

Gender,

COUNT(*) AS Employees

FROM employee_attrition

GROUP BY Gender;



-- Query 6
-- Marital Status Distribution

SELECT

MaritalStatus,

COUNT(*) AS Employees

FROM employee_attrition

GROUP BY MaritalStatus;



-- Query 7
-- Employees by Education Level

SELECT

Education,

COUNT(*) AS Employees

FROM employee_attrition

GROUP BY Education

ORDER BY Education;



-- Query 8
-- Employees by Business Travel

SELECT

BusinessTravel,

COUNT(*) AS Employees

FROM employee_attrition

GROUP BY BusinessTravel

ORDER BY Employees DESC;



-- Query 9
-- Employees by Department and Gender

SELECT

Department,

Gender,

COUNT(*) AS Employees

FROM employee_attrition

GROUP BY Department, Gender

ORDER BY Department;



-- Query 10
-- Average Employee Age

SELECT

ROUND(AVG(Age),2) AS Average_Age

FROM employee_attrition;

/*====================================================================
SECTION B : ATTRITION ANALYSIS
====================================================================*/


-- Query 11
-- Employees Who Left the Company

SELECT
COUNT(*) AS Employees_Left
FROM employee_attrition
WHERE Attrition = 'Yes';



-- Query 12
-- Employees Who Stayed

SELECT
COUNT(*) AS Employees_Stayed
FROM employee_attrition
WHERE Attrition = 'No';



-- Query 13
-- Attrition by Department

SELECT
Department,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY Department
ORDER BY Employees_Left DESC;



-- Query 14
-- Attrition by Job Role

SELECT
JobRole,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Count DESC;



-- Query 15
-- Attrition by Gender

SELECT
Gender,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY Gender;



-- Query 16
-- Attrition by Marital Status

SELECT
MaritalStatus,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY MaritalStatus
ORDER BY Employees_Left DESC;



-- Query 17
-- Attrition by Business Travel

SELECT
BusinessTravel,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY BusinessTravel
ORDER BY Employees_Left DESC;



-- Query 18
-- Attrition by Education Field

SELECT
EducationField,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY EducationField
ORDER BY Employees_Left DESC;



-- Query 19
-- Attrition by Overtime

SELECT
OverTime,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100.0 /
COUNT(*),2
) AS Attrition_Percentage
FROM employee_attrition
GROUP BY OverTime;



-- Query 20
-- Attrition by Job Level

SELECT
JobLevel,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY JobLevel
ORDER BY JobLevel;



-- Query 21
-- Attrition by Work Life Balance

SELECT
WorkLifeBalance,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;



-- Query 22
-- Attrition by Job Satisfaction

SELECT
JobSatisfaction,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;



-- Query 23
-- Attrition by Environment Satisfaction

SELECT
EnvironmentSatisfaction,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;



-- Query 24
-- Attrition by Relationship Satisfaction

SELECT
RelationshipSatisfaction,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY RelationshipSatisfaction
ORDER BY RelationshipSatisfaction;



-- Query 25
-- Attrition by Age Group

SELECT
CASE
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 45 THEN '36-45'
WHEN Age BETWEEN 46 AND 55 THEN '46-55'
ELSE '56+'
END AS Age_Group,

COUNT(*) AS Employees,

SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left

FROM employee_attrition

GROUP BY Age_Group

ORDER BY Age_Group;

/*====================================================================
SECTION C : SALARY ANALYSIS
====================================================================*/


-- Query 26
-- Overall Average Monthly Salary

SELECT
ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM employee_attrition;



-- Query 27
-- Average Salary by Department

SELECT
Department,
ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM employee_attrition
GROUP BY Department
ORDER BY Average_Salary DESC;



-- Query 28
-- Average Salary by Job Role

SELECT
JobRole,
ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM employee_attrition
GROUP BY JobRole
ORDER BY Average_Salary DESC;



-- Query 29
-- Average Salary by Gender

SELECT
Gender,
ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM employee_attrition
GROUP BY Gender;



-- Query 30
-- Highest Paid Employees

SELECT
EmployeeNumber,
Department,
JobRole,
MonthlyIncome
FROM employee_attrition
ORDER BY MonthlyIncome DESC
LIMIT 10;



-- Query 31
-- Lowest Paid Employees

SELECT
EmployeeNumber,
Department,
JobRole,
MonthlyIncome
FROM employee_attrition
ORDER BY MonthlyIncome ASC
LIMIT 10;



-- Query 32
-- Average Salary by Education Level

SELECT
Education,
ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM employee_attrition
GROUP BY Education
ORDER BY Education;



/*====================================================================
SECTION D : EXPERIENCE ANALYSIS
====================================================================*/


-- Query 33
-- Average Total Working Years

SELECT
ROUND(AVG(TotalWorkingYears),2) AS Avg_Total_Working_Years
FROM employee_attrition;



-- Query 34
-- Average Years at Company

SELECT
ROUND(AVG(YearsAtCompany),2) AS Avg_Years_At_Company
FROM employee_attrition;



-- Query 35
-- Average Years in Current Role

SELECT
ROUND(AVG(YearsInCurrentRole),2) AS Avg_Current_Role
FROM employee_attrition;



-- Query 36
-- Average Years Since Last Promotion

SELECT
ROUND(AVG(YearsSinceLastPromotion),2) AS Avg_Last_Promotion
FROM employee_attrition;



-- Query 37
-- Average Years with Current Manager

SELECT
ROUND(AVG(YearsWithCurrManager),2) AS Avg_Years_With_Manager
FROM employee_attrition;



-- Query 38
-- Top 10 Most Experienced Employees

SELECT
EmployeeNumber,
Department,
JobRole,
TotalWorkingYears
FROM employee_attrition
ORDER BY TotalWorkingYears DESC
LIMIT 10;



-- Query 39
-- Employees with More Than 20 Years Experience

SELECT
EmployeeNumber,
Department,
JobRole,
TotalWorkingYears
FROM employee_attrition
WHERE TotalWorkingYears > 20
ORDER BY TotalWorkingYears DESC;



/*====================================================================
SECTION E : EMPLOYEE SATISFACTION
====================================================================*/


-- Query 40
-- Average Job Satisfaction

SELECT
ROUND(AVG(JobSatisfaction),2) AS Average_Job_Satisfaction
FROM employee_attrition;



-- Query 41
-- Average Environment Satisfaction

SELECT
ROUND(AVG(EnvironmentSatisfaction),2) AS Average_Environment_Satisfaction
FROM employee_attrition;



-- Query 42
-- Average Relationship Satisfaction

SELECT
ROUND(AVG(RelationshipSatisfaction),2) AS Average_Relationship_Satisfaction
FROM employee_attrition;



-- Query 43
-- Average Work-Life Balance

SELECT
ROUND(AVG(WorkLifeBalance),2) AS Average_WorkLife_Balance
FROM employee_attrition;



-- Query 44
-- Average Performance Rating

SELECT
ROUND(AVG(PerformanceRating),2) AS Average_Performance_Rating
FROM employee_attrition;



-- Query 45
-- Job Satisfaction by Department

SELECT
Department,
ROUND(AVG(JobSatisfaction),2) AS Avg_Job_Satisfaction
FROM employee_attrition
GROUP BY Department
ORDER BY Avg_Job_Satisfaction DESC;



-- Query 46
-- Work-Life Balance by Department

SELECT
Department,
ROUND(AVG(WorkLifeBalance),2) AS Avg_WorkLife_Balance
FROM employee_attrition
GROUP BY Department
ORDER BY Avg_WorkLife_Balance DESC;



-- Query 47
-- Environment Satisfaction by Department

SELECT
Department,
ROUND(AVG(EnvironmentSatisfaction),2) AS Avg_Environment_Satisfaction
FROM employee_attrition
GROUP BY Department
ORDER BY Avg_Environment_Satisfaction DESC;


/*====================================================================
SECTION F : BUSINESS INSIGHTS
====================================================================*/


-- Query 48
-- Department with Highest Attrition

SELECT
Department,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM employee_attrition
GROUP BY Department
ORDER BY Employees_Left DESC;



-- Query 49
-- Average Salary of Employees Who Left

SELECT
ROUND(AVG(MonthlyIncome),2) AS Average_Salary_Left
FROM employee_attrition
WHERE Attrition='Yes';



-- Query 50
-- Average Age of Employees Who Left

SELECT
ROUND(AVG(Age),2) AS Average_Age_Left
FROM employee_attrition
WHERE Attrition='Yes';



-- Query 51
-- Attrition Percentage by Overtime

SELECT
OverTime,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2) AS Attrition_Percentage
FROM employee_attrition
GROUP BY OverTime;



-- Query 52
-- Highest Paying Department

SELECT
Department,
ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM employee_attrition
GROUP BY Department
ORDER BY Average_Salary DESC
LIMIT 1;



-- Query 53
-- Highest Paying Job Role

SELECT
JobRole,
ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM employee_attrition
GROUP BY JobRole
ORDER BY Average_Salary DESC
LIMIT 1;



-- Query 54
-- Employees Working Overtime

SELECT
COUNT(*) AS Overtime_Employees
FROM employee_attrition
WHERE OverTime='Yes';



-- Query 55
-- Employees with More than 10 Years at Company

SELECT
EmployeeNumber,
Department,
YearsAtCompany
FROM employee_attrition
WHERE YearsAtCompany > 10
ORDER BY YearsAtCompany DESC;



/*====================================================================
SECTION G : WINDOW FUNCTIONS
====================================================================*/


-- Query 56
-- Rank Employees by Salary

SELECT
EmployeeNumber,
Department,
JobRole,
MonthlyIncome,
RANK() OVER(ORDER BY MonthlyIncome DESC) AS Salary_Rank
FROM employee_attrition;



-- Query 57
-- Dense Rank by Salary

SELECT
EmployeeNumber,
MonthlyIncome,
DENSE_RANK() OVER(ORDER BY MonthlyIncome DESC) AS Dense_Rank
FROM employee_attrition;



-- Query 58
-- Rank Salary within Department

SELECT
Department,
EmployeeNumber,
MonthlyIncome,
RANK() OVER(
PARTITION BY Department
ORDER BY MonthlyIncome DESC
) AS Department_Rank
FROM employee_attrition;



/*====================================================================
SECTION H : COMMON TABLE EXPRESSIONS (CTE)
====================================================================*/


-- Query 59
-- Employees earning above average salary

WITH AvgSalary AS
(
SELECT AVG(MonthlyIncome) AS Avg_Salary
FROM employee_attrition
)

SELECT
EmployeeNumber,
Department,
MonthlyIncome
FROM employee_attrition, AvgSalary
WHERE MonthlyIncome > AvgSalary.Avg_Salary
ORDER BY MonthlyIncome DESC;



-- Query 60
-- Employees with High Experience

WITH ExperiencedEmployees AS
(
SELECT
EmployeeNumber,
Department,
TotalWorkingYears
FROM employee_attrition
WHERE TotalWorkingYears > 15
)

SELECT *
FROM ExperiencedEmployees;



/*====================================================================
SECTION I : SQL VIEW
====================================================================*/


CREATE OR REPLACE VIEW Attrition_View AS

SELECT

EmployeeNumber,

Department,

JobRole,

MonthlyIncome,

Attrition

FROM employee_attrition;



-- View Result

SELECT * FROM Attrition_View;



/*====================================================================
SECTION J : STORED PROCEDURE
====================================================================*/

DELIMITER $$

CREATE PROCEDURE GetDepartmentEmployees()

BEGIN

SELECT

Department,

COUNT(*) AS Employees

FROM employee_attrition

GROUP BY Department;

END $$

DELIMITER ;



CALL GetDepartmentEmployees();



/*====================================================================
SECTION K : INDEX
====================================================================*/


CREATE INDEX idx_department

ON employee_attrition(Department);



CREATE INDEX idx_jobrole

ON employee_attrition(JobRole);



CREATE INDEX idx_attrition

ON employee_attrition(Attrition);



/*====================================================================
SECTION L : BONUS QUERIES
====================================================================*/


-- Query 61
-- Average Salary by Gender and Department

SELECT

Department,

Gender,

ROUND(AVG(MonthlyIncome),2) AS Average_Salary

FROM employee_attrition

GROUP BY Department, Gender

ORDER BY Department;



-- Query 62
-- Average Experience by Department

SELECT

Department,

ROUND(AVG(TotalWorkingYears),2) AS Experience

FROM employee_attrition

GROUP BY Department

ORDER BY Experience DESC;



-- Query 63
-- Department with Maximum Average Experience

SELECT

Department,

ROUND(AVG(TotalWorkingYears),2) AS Avg_Experience

FROM employee_attrition

GROUP BY Department

ORDER BY Avg_Experience DESC

LIMIT 1;



-- Query 64
-- Employees with Highest Job Satisfaction

SELECT

EmployeeNumber,

Department,

JobRole,

JobSatisfaction

FROM employee_attrition

WHERE JobSatisfaction=4;



-- Query 65
-- Employees with Best Work-Life Balance

SELECT

EmployeeNumber,

Department,

JobRole,

WorkLifeBalance

FROM employee_attrition

WHERE WorkLifeBalance=4;

