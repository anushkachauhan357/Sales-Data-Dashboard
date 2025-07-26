-- ============================================
-- Sales Data Analysis Queries (MySQL)
-- File: SQL_queries.sql
-- Description: This file contains analytical SQL queries 
--              used for generating dashboard insights.
-- Note: Data import and preprocessing were handled separately in MySQL.
-- Author: Anushka Chauhan
-- ============================================

-- Query 1: Total Sales by Region
SELECT region, SUM(total_amount) AS total_sales
FROM sales_data
GROUP BY region;

-- Query 2: Monthly Sales Trends
...


-- Query 1: Total Sales and Total Profit
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales;

-- Query 2: Customer sSegmentation by Total Spending
SELECT 
    CustomerName,
    ROUND(SUM(Sales), 2) AS Total_Spent
FROM sales
GROUP BY CustomerName
ORDER BY Total_Spent DESC
LIMIT 10;

-- Query 3: Monthly Sales Trend
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM sales
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY Month;

-- Query 4: Top 5 Selling Products
SELECT 
    ProductName,
    SUM(Quantity) AS Total_Units_Sold
FROM sales
GROUP BY ProductName
ORDER BY Total_Units_Sold DESC
LIMIT 5;

-- Query 5: Category and Sub-Category Sales Breakdown
SELECT 
    Category,
    SubCategory,
    ROUND(SUM(Sales), 2) AS Revenue
FROM sales
GROUP BY Category, SubCategory
ORDER BY Revenue DESC;

-- Query 6: Profit Margin by Category
SELECT 
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percentage
FROM sales
GROUP BY Category;

-- Query 7: Region-wise Total Sales
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Query 8: Discount Impact on Profit
SELECT 
    Discount,
    ROUND(AVG(Profit), 2) AS Average_Profit
FROM sales
GROUP BY Discount
ORDER BY Discount;

