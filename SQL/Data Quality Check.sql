-- Data Quality Checks

-- Total Records
SELECT COUNT(*) AS TotalRecords
FROM supply_chain;

--Missing values
SELECT 
	SUM(CASE WHEN [Date] IS NULL THEN 1 ELSE 0 END)  AS MissingDates,
	SUM(CASE WHEN SKU_ID IS NULL THEN 1 ELSE 0  END) AS MissingSkuId,
	SUM(CASE WHEN Inventory_Level IS NULL THEN 1 ELSE 0 END) AS MissingInventory,
	SUM(CASE WHEN Units_Sold IS NULL THEN 1 ELSE 0 END) AS MissingSales
FROM supply_chain

--Duplicate records
SELECT 
	[Date], SKU_ID, Warehouse_ID,
	COUNT(*) as DuplicateCount
FROM supply_chain
GROUP BY [Date], SKU_ID, Warehouse_ID
HAVING COUNT(*) > 1;

--Negative values check
SELECT *
FROM supply_chain
WHERE Units_Sold < 0
   OR Inventory_Level < 0
   OR Supplier_Lead_Time_Days < 0
   OR Unit_Cost < 0
   OR Unit_Price < 0;

--Invalid flags check
SELECT 
	DISTINCT Promotion_Flag, Stockout_Flag
FROM supply_chain

--Inventory below reorder point
SELECT SKU_ID, Warehouse_ID,
       Inventory_Level, Reorder_Point
FROM supply_chain
WHERE Inventory_Level < Reorder_Point;

