CREATE DATABASE RetailSalesDB;

CREATE TABLE RetailSales(
    transactions_id INT,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(20),
    age INT,
    category VARCHAR(50),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);


SELECT TOP 10 * FROM [SQL - Retail Sales Analysis_utf];

SELECT COUNT(*) FROM [SQL - Retail Sales Analysis_utf];

-- Data Cleaning

SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Transactions_ID IS NULL;


SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Sale_Date IS NULL;


SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Sale_Time IS NULL;


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

 -- Data Exploration

-- How many sales we have?

SELECT COUNT(*) AS TotalSales
FROM [SQL - Retail Sales Analysis_utf];


-- How many unique customers we have?

SELECT COUNT(DISTINCT Customer_ID) AS TotalCustomers
FROM [SQL - Retail Sales Analysis_utf];


-- Show unique categories

SELECT DISTINCT Category
FROM [SQL - Retail Sales Analysis_utf];


-- Data Analysis & Business Key Problems & Answers

------------------------------------------------
-- Q1. Retrieve all columns for sales made on '2022-11-05'

SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Sale_Date = '2022-11-05';


-- Q2. Retrieve all transactions where category is 'Clothing'
-- and quantity sold is more than 10 in Nov-2022

SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Category = 'Clothing'
AND Quantiy >= 2
AND MONTH(Sale_Date) = 11
AND YEAR(Sale_Date) = 2022;


-- Q3. Calculate total sales for each category

SELECT Category,
SUM(Total_Sale) AS TotalSales
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Category;


-- Q4. Find average age of customers who purchased from Beauty category

SELECT AVG(Age) AS AverageAge
FROM [SQL - Retail Sales Analysis_utf]
WHERE Category = 'Beauty';


-- Q5. Find all transactions where total_sale is greater than 1000

SELECT *
FROM [SQL - Retail Sales Analysis_utf]
WHERE Total_Sale > 1000;


-- Q6. Find total number of transactions made by each gender in each category

SELECT Gender,
Category,
COUNT(Transactions_ID) AS TotalTransactions
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Gender, Category;


-- Q7. Calculate average sale for each month

SELECT 
YEAR(Sale_Date) AS Year,
MONTH(Sale_Date) AS Month,
AVG(Total_Sale) AS AverageSale
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY YEAR(Sale_Date), MONTH(Sale_Date)
ORDER BY Year, Month;


-- Best selling month in each year

SELECT *
FROM
(
    SELECT
        YEAR(Sale_Date) AS Year,
        MONTH(Sale_Date) AS Month,
        SUM(Total_Sale) AS TotalSales,

        RANK() OVER
        (
            PARTITION BY YEAR(Sale_Date)
            ORDER BY SUM(Total_Sale) DESC
        ) AS RankNo

    FROM [SQL - Retail Sales Analysis_utf]

    GROUP BY YEAR(Sale_Date), MONTH(Sale_Date)

) AS RankedSales

WHERE RankNo = 1;


-- Q8. Find top 5 customers based on highest total sales

SELECT TOP 5
Customer_ID,
SUM(Total_Sale) AS TotalSales
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Customer_ID
ORDER BY TotalSales DESC;


-- Q9. Find number of unique customers from each category

SELECT Category,
COUNT(DISTINCT Customer_ID) AS UniqueCustomers
FROM [SQL - Retail Sales Analysis_utf]
GROUP BY Category;


-- Q10. Create shifts and count number of orders

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
