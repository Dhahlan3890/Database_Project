-- Demonstrating select operation
SELECT * FROM product;

-- Demonsrating Project operation
SELECT Distinct W.WarehouseProvince as warhouse_province, S.ShippingProvince as shipping_province 
from Warehouse as W, Shipment as S order by W.WarehouseProvince;

-- Cartasian product operation
SELECT  P.ProductID ,S.supplierName
FROM supplier as S cross join Product as P
WHERE P.ProductID = 'P001';

-- Creating a user view
CREATE VIEW LowInventoryProducts AS
SELECT p.ProductName, i.QuantityInStock
FROM product p
INNER JOIN inventory i ON p.ProductID = i.ProductID
WHERE i.QuantityInStock < 5;

-- Renaming operation
select OrderID as id ,TrackingNumber as Track_num from shipment;

-- Aggregation function
SELECT SUM(ItemPrice * Quantity) AS TotalAmount
FROM p_order_item
WHERE OrderID = 'O005';

-- Using like keyword
SELECT OrderID as This_month_orders
FROM p_order
where OrderDate like "2023-09-__";














