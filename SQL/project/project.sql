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
 
  -- insights
-- Total Organizations = 10000
-- Employee Distribution by Industry = investment banking have 486439 employees than others
-- Average Employees per Industry = gov.administration have bigger companies on  5298 average employees 
-- New Organizations Per Year =  in 1970 there are 179 organization and in 2022 there are only 78 organization founded
-- Organizations by Country = highest  90 organization in congo country
-- Average Employees per Country = (6276)
-- Top 5 Industries by Organization Count =(staffing,investment banking,environmental services,semiconductors,health care)
-- Top 5 Industries by Employee Count = (investment banking,defense,gov.administration,airlines,semiconductors)
-- Biggest and Smallest Organizations = biggest Organizations is (costa-finley) and smallest Organizations is (ramsey-weaver)
