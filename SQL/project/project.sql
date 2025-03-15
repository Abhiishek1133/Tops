create database project;
use project;
CREATE TABLE Organizations (
    Index_ID INT PRIMARY KEY AUTO_INCREMENT,
    Organization_ID VARCHAR(50) UNIQUE NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Website VARCHAR(255),
    Country VARCHAR(100),
    Description TEXT,
    Founded YEAR,
    Industry VARCHAR(100),
    Number_of_Employees INT
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/organizations.csv"
INTO TABLE Organizations
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


show variables like 'secure_file_priv';

SELECT * FROM Organizations;

--  Count Total Organizations
SELECT COUNT(*) FROM Organizations;


-- Industry-wise Employee Distribution
 
SELECT Industry, SUM(Number_of_Employees) AS Total_Employees
FROM Organizations
GROUP BY Industry
ORDER BY Total_Employees DESC;

-- Average Employees per Industry

SELECT Industry, AVG(Number_of_Employees) AS Avg_Employees
FROM Organizations
GROUP BY Industry;

--  Number of Organizations Founded Per Year
SELECT Founded, COUNT(*) AS Total_Organizations
FROM Organizations
GROUP BY Founded
ORDER BY Founded ASC;

-- Organizations Distribution by Country
SELECT Country, COUNT(*) AS Organization_Count
FROM Organizations
GROUP BY Country
ORDER BY Organization_Count DESC;

-- Average Employees per Country

SELECT Country, AVG(Number_of_Employees) AS Avg_Employees
FROM Organizations
GROUP BY Country
ORDER BY Avg_Employees DESC;

-- Top  5 Industries by Organization Count
SELECT Industry, COUNT(*) AS Organization_Count
FROM Organizations
GROUP BY Industry
ORDER BY Organization_Count DESC
LIMIT 5;

-- Total 5 Employees per Industry
SELECT Industry, SUM(Number_of_Employees) AS Total_Employees
FROM Organizations
GROUP BY Industry
ORDER BY Total_Employees DESC
LIMIT 5;

-- Largest  Organizations  by Employees
SELECT * FROM Organizations ORDER BY Number_of_Employees DESC LIMIT 1; 

 -- Smallest Organizations  by Employees
 SELECT * FROM Organizations ORDER BY Number_of_Employees ASC LIMIT 1; 
 
 
-- insight--
--- Total Organizations Count
#The total number of organizations in the dataset provides an overview of the dataset's size.
--- Industry-wise Employee Distribution
#Some industries employ significantly more people than others. The industries at the top have a major economic impact.
--- Average Employees per Industry
#Shows how workforce distribution varies by industry, highlighting which industries tend to have larger or smaller organizations on average.
--- Number of Organizations Founded Per Year
#Trends in the establishment of new organizations, revealing peaks or declines in company formations.
--- Organizations Distribution by Country
#Identifies which countries have the highest concentration of organizations, possibly indicating economic hubs.
--- Average Employees per Country
#Some countries have organizations with a higher average workforce, possibly due to economic conditions, business scale, or labor market structures.
--- Top 5 Industries by Organization Count
#Indicates the most popular industries where organizations are concentrated.
--- Top 5 Industries by Employee Count
#Highlights industries with the largest workforce, emphasizing employment-heavy sectors.
--- Largest and Smallest Organizations by Employees
#Identifies the largest and smallest organizations in the dataset, showing extremes in workforce size.

-- Certain industries dominate in terms of total employees and the number of organizations.
-- Business formation has varied over time, potentially influenced by economic conditions.
-- Some countries host more businesses and have larger workforces in organizations.
-- The largest organizations may have a significant impact on their industries and economies.