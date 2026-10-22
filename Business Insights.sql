SELECT TOP (1000) [Date]
      ,[SKU_ID]
      ,[Warehouse_ID]
      ,[Supplier_ID]
      ,[Region]
      ,[Units_Sold]
      ,[Inventory_Level]
      ,[Supplier_Lead_Time_Days]
      ,[Reorder_Point]
      ,[Order_Quantity]
      ,[Unit_Cost]
      ,[Unit_Price]
      ,[Promotion_Flag]
      ,[Stockout_Flag]
      ,[Demand_Forecast]
  FROM [SupplyChainDB].[dbo].[supply_chain]


SELECT TOP 5 SKU_ID, SUM(Units_Sold) AS UnitsSold
FROM supply_chain
GROUP BY SKU_ID
ORDER BY UnitsSold DESC;

SELECT COUNT(*) AS LowStockRecords
FROM supply_chain
WHERE Inventory_Level < Reorder_Point;

SELECT Region, SUM(Inventory_Level) AS TotalInventory
FROM supply_chain
GROUP BY Region
ORDER BY TotalInventory DESC;


SELECT YEAR([Date]) AS [Year],
       MONTH([Date]) AS [Month],
       SUM(Units_Sold) AS UnitsSold,
       SUM(Demand_Forecast) AS Forecast
FROM supply_chain
GROUP BY YEAR([Date]), MONTH([Date])
ORDER BY [Year], [Month];

SELECT Supplier_ID,
       AVG(CAST(Supplier_Lead_Time_Days AS DECIMAL(10,2))) AS AvgLeadTime
FROM supply_chain
GROUP BY Supplier_ID
ORDER BY AvgLeadTime DESC;