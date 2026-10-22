-- Inventory Risk Analysis

--1. Low-stock products
SELECT SKU_ID, Warehouse_ID, Inventory_Level, Reorder_Point
FROM supply_chain
WHERE Inventory_Level < Reorder_Point
ORDER BY Inventory_Level ASC;

--2. High-demand products
SELECT SKU_ID, SUM(Units_Sold) AS TotalUnitsSold,
       AVG(Demand_Forecast) AS AvgForecast
FROM supply_chain
GROUP BY SKU_ID
ORDER BY TotalUnitsSold DESC;

--3. Inventory value
SELECT
    SUM(Inventory_Level * Unit_Cost) AS TotalInventoryValue
FROM supply_chain;

--4. Supplier performance
SELECT Supplier_ID,
       AVG(CAST(Supplier_Lead_Time_Days AS DECIMAL(10,2))) AS AvgLeadTime,
       COUNT(*) AS TotalRecords
FROM supply_chain
GROUP BY Supplier_ID
ORDER BY AvgLeadTime DESC;

--5. Promotion vs sales
SELECT Promotion_Flag,
       SUM(Units_Sold) AS TotalUnitsSold,
       COUNT(*) AS TotalRecords
FROM supply_chain
GROUP BY Promotion_Flag
ORDER BY TotalUnitsSold DESC;

--6. Warehouse-wise inventory
SELECT Warehouse_ID,
       SUM(Inventory_Level) AS TotalInventory,
       SUM(Units_Sold) AS TotalUnitsSold
FROM supply_chain
GROUP BY Warehouse_ID
ORDER BY TotalInventory DESC;

