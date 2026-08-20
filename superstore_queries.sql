-- ============================================================
-- Superstore Sales & Profitability Analysis
-- Author: Poorvi Joshi
-- Dataset: Superstore Sample (9,994 order-line records)
-- Companion project: Sales Performance Dashboard (Power BI)
-- ============================================================


-- ============================================
-- Q1: Overall Sales, Profit, and Profit Margin
-- ============================================
SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(100.0 * SUM(Profit) / SUM(Sales), 2) AS profit_margin_pct,
    COUNT(DISTINCT [Order ID]) AS total_orders,
    COUNT(DISTINCT [Customer ID]) AS total_customers,
    ROUND(SUM(Sales) / COUNT(DISTINCT [Order ID]), 2) AS avg_order_value
FROM orders;


-- ============================================
-- Q2: Sales and Profit by Region and Category
-- ============================================
SELECT
    Region,
    Category,
    ROUND(SUM(Sales), 2) AS sales,
    ROUND(SUM(Profit), 2) AS profit,
    ROUND(100.0 * SUM(Profit) / SUM(Sales), 2) AS profit_margin_pct
FROM orders
GROUP BY Region, Category
ORDER BY sales DESC;


-- ============================================
-- Q3: Loss-Making Sub-Categories
-- ============================================
SELECT
    [Sub-Category],
    ROUND(SUM(Sales), 2) AS sales,
    ROUND(SUM(Profit), 2) AS profit,
    ROUND(100.0 * SUM(Profit) / SUM(Sales), 2) AS profit_margin_pct,
    ROUND(AVG(Discount), 3) AS avg_discount
FROM orders
GROUP BY [Sub-Category]
HAVING profit < 0
ORDER BY profit ASC;


-- ============================================
-- Q4: Top 10 Customers by Sales
-- ============================================
SELECT
    [Customer Name],
    Segment,
    ROUND(SUM(Sales), 2) AS sales,
    ROUND(SUM(Profit), 2) AS profit,
    COUNT(DISTINCT [Order ID]) AS num_orders
FROM orders
GROUP BY [Customer Name], Segment
ORDER BY sales DESC
LIMIT 10;


-- ============================================
-- Q5: Year-over-Year Sales and Profit
-- ============================================
SELECT
    strftime('%Y', [Order Date]) AS order_year,
    ROUND(SUM(Sales), 2) AS sales,
    ROUND(SUM(Profit), 2) AS profit
FROM orders
GROUP BY order_year
ORDER BY order_year;


-- ============================================
-- Q6: Ship Mode Profit Share (Window Function)
-- ============================================
SELECT
    [Ship Mode],
    ROUND(AVG(Discount), 3) AS avg_discount,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / SUM(SUM(Profit)) OVER (), 2
    ) AS pct_of_total_profit
FROM orders
GROUP BY [Ship Mode]
ORDER BY total_profit ASC;
