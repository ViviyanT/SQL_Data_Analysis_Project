-- 03_customer_analysis.sql

-- 1. Calculate Average Order Amount per Customer
SELECT
    CustomerName,
    AVG(OrderAmount) AS AvgOrderAmount
FROM
    SQLProject.dbo.OrderDetails
GROUP BY
    CustomerName
ORDER BY
    AvgOrderAmount DESC;


-- 2. Count the Number of Distinct Customers
SELECT
    COUNT(DISTINCT CustomerName) AS DistinctCustomers
FROM
    SQLProject.dbo.OrderDetails;


-- 3. Identify Top Customers by Total Spending
SELECT TOP 10
    CustomerName,
    SUM(OrderAmount) AS TotalSpending
FROM
    SQLProject.dbo.OrderDetails
GROUP BY
    CustomerName
ORDER BY
    TotalSpending DESC;


-- 4. Analyze Preferred Payment Modes of Customers
SELECT
    CustomerName,
    PaymentMode,
    COUNT(*) AS PaymentCount
FROM
    SQLProject.dbo.OrderDetails
GROUP BY
    CustomerName,
    PaymentMode
ORDER BY
    CustomerName,
    PaymentCount DESC;


