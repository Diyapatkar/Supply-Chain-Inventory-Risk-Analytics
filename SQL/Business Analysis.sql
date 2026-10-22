-- Business Analysis

-- 1. Total sales and inventory
SELECT
    SUM(Units_Sold) AS TotalUnitsSold,
    SUM(Inventory_Level) AS TotalInventory,
    AVG(Unit_Price) AS AverageUnitPrice
FROM supply_chain;

-- 2. Top 10 best-selling products
SELECT TOP 10
    SKU_ID,
    SUM(Units_Sold) AS TotalUnitsSold
FROM supply_chain
GROUP BY SKU_ID
ORDER BY TotalUnitsSold DESC;

-- 3. Region-wise sales
SELECT 
    Region,
    SUM(Units_Sold) AS TotalUnitSold
FROM supply_chain
GROUP BY Region
ORDER BY TotalUnitSold DESC;

-- 4. Monthly sales trend
SELECT
    YEAR([DATE]) AS SalesYear,
    MONTH([date]) as SalesMonth,
    SUM(Units_Sold) as TotalUnitsSold
FROM supply_chain
GROUP BY YEAR([DATE]), MONTH([DATE])
ORDER BY SalesYear, SalesMonth

-- 5. Stockout analysis
SELECT
    SKU_ID,
    SUM(CASE
        WHEN Stockout_Flag = 1 THEN 1
        ELSE 0
    END) AS StockoutRecords
FROM supply_chain
GROUP BY SKU_ID
ORDER BY StockoutRecords DESC;

-- 6. Supplier lead-time analysis
SELECT
    Supplier_ID,
    AVG(Supplier_Lead_Time_Days) AS AvgLeadTimeDays
FROM supply_chain
GROUP BY Supplier_ID
ORDER BY AvgLeadTimeDays DESC;