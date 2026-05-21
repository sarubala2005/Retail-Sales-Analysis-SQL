Retail Sales Analysis SQL Project
Project Overview

Project Title: Retail Sales Analysis
Level: Beginner
Tools Used: SQL Server Management Studio (SSMS), SQL
Database: RetailSalesDB

This project demonstrates beginner-to-intermediate SQL skills used in real-world retail sales analysis. The project covers database creation, data cleaning, exploratory data analysis (EDA), and business analysis using SQL queries.

The dataset contains retail transaction details including customer information, product categories, quantity sold, pricing, and total sales.

This project is useful for aspiring Data Analysts who want hands-on SQL practice using a business-oriented dataset.

Objectives
Create and manage a retail sales database
Perform data cleaning and validation
Explore sales data using SQL
Solve business problems through SQL queries
Generate meaningful business insights
Project Structure
1. Database Setup
Create Database
CREATE DATABASE RetailSalesDB;
GO
Use Database
USE RetailSalesDB;
GO
Create Table
CREATE TABLE RetailSales
(
    Transactions_ID INT PRIMARY KEY,
    Sale_Date DATE,
    Sale_Time TIME,
    Customer_ID INT,
    Gender VARCHAR(20),
    Age INT,
    Category VARCHAR(50),
    Quantiy INT,
    Price_Per_Unit FLOAT,
    Cogs FLOAT,
    Total_Sale FLOAT
);
2. Data Exploration & Cleaning
Total Number of Records
SELECT COUNT(*) AS TotalSales
FROM [SQL - Retail Sales Analysis_utf];
Unique Customers Count
SELECT COUNT(DISTINCT Customer_ID) AS TotalCustomers
FROM [SQL - Retail Sales Analysis_utf];
Unique Product Categories
SELECT DISTINCT Category
FROM [SQL - Retail Sales Analysis_utf];
Check NULL Values
SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE
    Transactions_ID IS NULL
    OR Sale_Date IS NULL
    OR Sale_Time IS NULL
    OR Customer_ID IS NULL
    OR Gender IS NULL
    OR Age IS NULL
    OR Category IS NULL
    OR Quantiy IS NULL
    OR Price_Per_Unit IS NULL
    OR Cogs IS NULL
    OR Total_Sale IS NULL;
Delete NULL Records
DELETE FROM [SQL - Retail Sales Analysis_utf]
WHERE
    Transactions_ID IS NULL
    OR Sale_Date IS NULL
    OR Sale_Time IS NULL
    OR Customer_ID IS NULL
    OR Gender IS NULL
    OR Age IS NULL
    OR Category IS NULL
    OR Quantiy IS NULL
    OR Price_Per_Unit IS NULL
    OR Cogs IS NULL
    OR Total_Sale IS NULL;
3. Data Analysis & Business Problems
Q1. Sales Made on 2022-11-05
SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Sale_Date = '2022-11-05';
Q2. Clothing Transactions with Quantity Greater than 4 in Nov-2022
SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Category = 'Clothing'
AND Quantiy >= 4
AND MONTH(Sale_Date) = 11
AND YEAR(Sale_Date) = 2022;
Q3. Total Sales for Each Category
SELECT
    Category,
    SUM(Total_Sale) AS NetSale,
    COUNT(*) AS TotalOrders
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Category;
Q4. Average Age of Customers from Beauty Category
SELECT
    AVG(Age) AS AverageAge
FROM [SQL - Retail Sales Analysis_utf]
WHERE Category = 'Beauty';
Q5. Transactions Where Total Sale > 1000
SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Total_Sale > 1000;
Q6. Total Transactions by Gender in Each Category
SELECT
    Category,
    Gender,
    COUNT(Transactions_ID) AS TotalTransactions
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Category, Gender
ORDER BY Category;
Q7. Average Monthly Sales & Best Selling Month
SELECT *
FROM
(
    SELECT
        YEAR(Sale_Date) AS Year,
        MONTH(Sale_Date) AS Month,
        AVG(Total_Sale) AS AverageSale,

        RANK() OVER
        (
            PARTITION BY YEAR(Sale_Date)
            ORDER BY AVG(Total_Sale) DESC
        ) AS RankNo

    FROM [SQL - Retail Sales Analysis_utf]

    GROUP BY YEAR(Sale_Date), MONTH(Sale_Date)

) AS RankedSales

WHERE RankNo = 1;
Q8. Top 5 Customers by Total Sales
SELECT TOP 5
    Customer_ID,
    SUM(Total_Sale) AS TotalSales
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Customer_ID
ORDER BY TotalSales DESC;
Q9. Unique Customers by Category
SELECT
    Category,
    COUNT(DISTINCT Customer_ID) AS UniqueCustomers
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Category;
Q10. Orders by Shift
SELECT

CASE

    WHEN DATEPART(HOUR, Sale_Time) < 12
    THEN 'Morning'

    WHEN DATEPART(HOUR, Sale_Time) BETWEEN 12 AND 17
    THEN 'Afternoon'

    ELSE 'Evening'

END AS Shift,

COUNT(*) AS NumberOfOrders

FROM [SQL - Retail Sales Analysis_utf]

GROUP BY

CASE

    WHEN DATEPART(HOUR, Sale_Time) < 12
    THEN 'Morning'

    WHEN DATEPART(HOUR, Sale_Time) BETWEEN 12 AND 17
    THEN 'Afternoon'

    ELSE 'Evening'

END;
Findings
Customer Demographics
Customers belong to different age groups.
Sales are distributed across categories like Clothing, Beauty, and Electronics.
High Value Transactions
Several orders generated sales greater than 1000.
Indicates premium customer purchases.
Sales Trends
Monthly sales analysis helps identify peak sales periods.
Some months generated significantly higher revenue.
Customer Insights
Identified top-spending customers.
Found most popular product categories.
Shift Analysis
Sales transactions are grouped into:
Morning
Afternoon
Evening
Helps understand customer shopping behavior by time.
Reports Generated
Sales Summary Report
Total sales
Total orders
Category performance
Customer Analysis Report
Unique customer count
Top customers
Gender-based analysis
Trend Analysis Report
Monthly sales trends
Peak sales months
Shift-wise order distribution
Conclusion

This project provides a strong foundation in SQL for aspiring data analysts. It covers:

Database creation
Data cleaning
Data exploration
Business analysis
SQL querying techniques

The insights generated from this project help understand:

Customer purchasing behavior
Product performance
Revenue trends
Sales distribution patterns

This project is an excellent beginner portfolio project for Data Analyst roles.
