-- 02_data_exploration.sql

-- 1. Total Number of Orders
SELECT COUNT(*) AS TotalOrders
FROM SQLProject.dbo.OrderDetails;

-- 2. Average Order Amount
SELECT AVG(OrderAmount) AS AvgOrderAmount
FROM SQLProject.dbo.OrderDetails;

-- 3. Highest and Lowest Order Amounts
SELECT
    MAX(OrderAmount) AS MaxOrderAmount,
    MIN(OrderAmount) AS MinOrderAmount
FROM SQLProject.dbo.OrderDetails;

--4. Average Quantity of Items Ordered
SELECT AVG(QuantityOfItems) AS AvgQuantityOfItems
FROM SQLProject.dbo.OrderDetails;

-- 5. Most Common Payment Mode
SELECT
    PaymentMode,
    COUNT(*) AS PaymentCount
FROM SQLProject.dbo.OrderDetails
GROUP BY PaymentMode
ORDER BY PaymentCount DESC

