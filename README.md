# Retail Sales Analysis SQL Project

## Project Overview

**Project Title:** Retail Sales Analysis  
**Level:** Beginner  
**Tools Used:** SQL Server Management Studio (SSMS), SQL  
**Database:** RetailSalesDB  

This project demonstrates SQL skills and techniques commonly used by data analysts to explore, clean, and analyze retail sales data. The project includes database creation, data cleaning, exploratory data analysis (EDA), and business analysis using SQL queries.

The dataset contains retail transaction details such as customer information, product categories, quantity sold, pricing, cost of goods sold (COGS), and total sales amount.

This project is suitable for beginners who want to strengthen their SQL skills through practical business problems.

---

# Objectives

- Create and manage a retail sales database
- Perform data cleaning and validation
- Explore retail sales data using SQL
- Solve business problems using SQL queries
- Generate meaningful business insights

---

# Dataset Information

The dataset contains the following columns:

| Column Name | Description |
|---|---|
| Transactions_ID | Unique transaction ID |
| Sale_Date | Date of sale |
| Sale_Time | Time of sale |
| Customer_ID | Unique customer ID |
| Gender | Customer gender |
| Age | Customer age |
| Category | Product category |
| Quantiy | Quantity sold |
| Price_Per_Unit | Price per product |
| Cogs | Cost of goods sold |
| Total_Sale | Total sales amount |

---

# Database Setup

## Create Database

```sql
CREATE DATABASE RetailSalesDB;
GO
```

---

## Use Database

```sql
USE RetailSalesDB;
GO
```

---

## Create Table

```sql
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
```

---

# Data Exploration & Cleaning

## Total Number of Records

```sql
SELECT COUNT(*) AS TotalSales
FROM [SQL - Retail Sales Analysis_utf];
```

---

## Unique Customers Count

```sql
SELECT COUNT(DISTINCT Customer_ID) AS TotalCustomers
FROM [SQL - Retail Sales Analysis_utf];
```

---

## Unique Product Categories

```sql
SELECT DISTINCT Category
FROM [SQL - Retail Sales Analysis_utf];
```

---

## Check NULL Values

```sql
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
```

---

## Delete NULL Values

```sql
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
```

---

# Business Problems & SQL Analysis

## Q1. Retrieve all sales made on 2022-11-05

```sql
SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Sale_Date = '2022-11-05';
```

---

## Q2. Retrieve Clothing transactions with quantity greater than or equal to 4 in Nov-2022

```sql
SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Category = 'Clothing'
AND Quantiy >= 4
AND MONTH(Sale_Date) = 11
AND YEAR(Sale_Date) = 2022;
```

---

## Q3. Calculate total sales for each category

```sql
SELECT
    Category,
    SUM(Total_Sale) AS NetSale,
    COUNT(*) AS TotalOrders
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Category;
```

---

## Q4. Find average age of customers who purchased from Beauty category

```sql
SELECT
    AVG(Age) AS AverageAge
FROM [SQL - Retail Sales Analysis_utf]
WHERE Category = 'Beauty';
```

---

## Q5. Find transactions where total sale is greater than 1000

```sql
SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Total_Sale > 1000;
```

---

## Q6. Find total transactions by gender in each category

```sql
SELECT
    Category,
    Gender,
    COUNT(Transactions_ID) AS TotalTransactions
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Category, Gender
ORDER BY Category;
```

---

## Q7. Find best selling month in each year

```sql
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
```

---

## Q8. Find top 5 customers based on highest total sales

```sql
SELECT TOP 5
    Customer_ID,
    SUM(Total_Sale) AS TotalSales
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Customer_ID
ORDER BY TotalSales DESC;
```

---

## Q9. Find number of unique customers from each category

```sql
SELECT
    Category,
    COUNT(DISTINCT Customer_ID) AS UniqueCustomers
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Category;
```

---

## Q10. Create shifts and count number of orders

```sql
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
```

---

# Key Findings

## Customer Demographics
- Customers belong to different age groups.
- Sales are distributed across multiple product categories.

---

## High Value Transactions
- Several transactions generated sales greater than 1000.
- Indicates premium product purchases.

---

## Sales Trends
- Monthly analysis shows fluctuations in sales.
- Helps identify peak sales periods.

---

## Customer Insights
- Identified top-spending customers.
- Found most popular product categories.

---

## Shift Analysis
- Transactions are grouped into:
  - Morning
  - Afternoon
  - Evening

- Helps understand shopping behavior based on time.

---

# Reports Generated

## Sales Summary Report
- Total sales
- Total orders
- Category performance

---

## Customer Analysis Report
- Unique customer count
- Top customers
- Gender analysis

---

## Trend Analysis Report
- Monthly sales trends
- Peak sales months
- Shift-wise order distribution

---

# Conclusion

This project provides a strong foundation in SQL for aspiring data analysts. It covers:

- Database creation
- Data cleaning
- Exploratory Data Analysis (EDA)
- Business problem solving using SQL
- SQL querying techniques

The insights generated from this project help understand:

- Customer purchasing behavior
- Product performance
- Revenue trends
- Sales distribution patterns

This is an excellent beginner-level SQL portfolio project for Data Analyst roles.

---

# Author

**Sarubala V**  
Aspiring Data Analyst  
Chennai, India

---

# Tools & Technologies

- SQL Server Management Studio (SSMS)
- SQL
- GitHub

---

# GitHub Repository Structure

```text
Retail-Sales-Analysis-SQL
│
├── Dataset
├── SQL Queries
├── README.md
├── Screenshots
└── Insights
```
