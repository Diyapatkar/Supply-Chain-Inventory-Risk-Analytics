CREATE DATABASE SupplyChainDB;
GO

USE SupplyChainDB;

-- Data verification
SELECT COUNT(*) AS TotalRows
FROM supply_chain

SELECT TOP 10 *
FROM supply_chain

SELECT *
FROM supply_chain
WHERE [Date] IS NULL;

