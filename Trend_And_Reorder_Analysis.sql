--1. Monthly sales + forecast
SELECT
    YEAR([Date]) AS SalesYear,
    MONTH([Date]) AS SalesMonth,
    SUM(Units_Sold) AS TotalUnitsSold,
    SUM(Demand_Forecast) AS TotalForecast
FROM supply_chain
GROUP BY YEAR([Date]), MONTH([Date])
ORDER BY SalesYear, SalesMonth;



-- 2. Stockout Percentage
SELECT
    COUNT(*) AS TotalRecords,
    SUM(CASE
        WHEN Stockout_Flag = 1 THEN 1
        ELSE 0
    END) AS StockoutRecords,
    CAST(
        100.0 * SUM(CASE
            WHEN Stockout_Flag = 1 THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0)
        AS DECIMAL(5,2)
    ) AS StockoutPercent
FROM supply_chain;


--3. Reorder recommendation
SELECT DISTINCT
    SKU_ID,
    Warehouse_ID,
    Inventory_Level,
    Reorder_Point,
    CASE
        WHEN Inventory_Level < Reorder_Point THEN 'Reorder Required'
        ELSE 'Stock OK'
    END AS StockStatus
FROM supply_chain
ORDER BY StockStatus;