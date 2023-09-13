INSERT INTO product (ProductID, ProductName, QuantityInstock, UnitPrice, Descrip)
VALUES
    ('P001', 'Widget A', 100, 10.99, 'High-quality widget'),
    ('P002', 'Widget B', 50, 7.99, 'Standard widget'),
    ('P003', 'Widget C', 75, 14.99, 'Premium widget'),
    ('P004', 'Widget D', 120, 12.49, 'Economical widget'),
    ('P005', 'Widget E', 30, 19.99, 'Deluxe widget'),
    ('P006', 'Widget F', 60, 8.75, 'Basic widget');

INSERT INTO supplier (SupplierID, SupplierName, SupplierEmail, SupplierCity, SupplierProvince, SupplierCountry)
VALUES
    ('S001', 'Supplier1', 'supplier1@example.com', 'City1', 'Province1', 'Country1'),
    ('S002', 'Supplier2', 'supplier2@example.com', 'City2', 'Province2', 'Country2'),
    ('S003', 'Supplier3', 'supplier3@example.com', 'City3', 'Province3', 'Country3'),
    ('S004', 'Supplier4', 'supplier4@example.com', 'City4', 'Province4', 'Country4'),
    ('S005', 'Supplier5', 'supplier5@example.com', 'City5', 'Province5', 'Country5'),
    ('S006', 'Supplier6', 'supplier6@example.com', 'City6', 'Province6', 'Country6');

INSERT INTO p_order (OrderID, ProductID, CustomerID, ParentOrderID, OrderDate, DeliveryDate, OrderStatus, TotalAmount, SubOrderID)
VALUES
    ('O001', 'P001', 'C001', 'P001', '2023-09-10', '2023-09-15', 1, 1099.0, 'O001'),
    ('O002', 'P002', 'C002', 'P002', '2023-09-11', '2023-09-16', 1, 399.5, 'O002'),
    ('O003', 'P003', 'C001', 'P003', '2023-09-12', '2023-09-17', 1, 1124.25, 'O003'),
    ('O004', 'P004', 'C003', 'P004', '2023-09-13', '2023-09-18', 1, 1498.8, 'O004'),
    ('O005', 'P005', 'C004', 'P005', '2023-09-14', '2023-09-19', 1, 599.7, 'O005'),
    ('O006', 'P006', 'C002', 'P006', '2023-09-15', '2023-09-20', 1, 525.0, 'O006');

INSERT INTO warehouse (WarehouseID, WarehouseName, Capacity, ParentWareHouseID, SubWareHouseID, WarehouseCity, WarehouseProvince, WarehouseCountry)
VALUES
    ('W001', 'Warehouse1', 5000, NULL, NULL, 'City1', 'Province1', 'Country1'),
    ('W002', 'Warehouse2', 3000, NULL, NULL, 'City2', 'Province2', 'Country2'),
    ('W003', 'Warehouse3', 7000, NULL, NULL, 'City3', 'Province3', 'Country3'),
    ('W004', 'SubWarehouse1', 2000, 'W001', NULL, 'City1', 'Province1', 'Country1'),
    ('W005', 'SubWarehouse2', 1500, 'W002', NULL, 'City2', 'Province2', 'Country2'),
    ('W006', 'SubWarehouse3', 2500, 'W003', NULL, 'City3', 'Province3', 'Country3');

INSERT INTO inventory (ProductID, WarehouseID, RecorderLevel, LastStockDate, QuantityInStock)
VALUES
    ('P001', 'W001', 'Low', '2023-09-10', 100),
    ('P002', 'W001', 'Low', '2023-09-10', 50),
    ('P003', 'W002', 'Medium', '2023-09-10', 75),
    ('P004', 'W003', 'High', '2023-09-10', 120),
    ('P005', 'W003', 'Low', '2023-09-10', 30),
    ('P006', 'W002', 'Medium', '2023-09-10', 60);
    
INSERT INTO shipment (ShipmentID, OrderID, WarehouseID, TrackingNumber, ShippingDate, ShippingCity, ShippingProvince, ShippingCountry)
VALUES
    ('S001', 'O001', 'W001', '1234567890', '2023-09-14', 'City1', 'Province1', 'Country1'),
    ('S002', 'O002', 'W001', '9876543210', '2023-09-15', 'City1', 'Province1', 'Country1'),
    ('S003', 'O003', 'W002', '4567890123', '2023-09-16', 'City2', 'Province2', 'Country2'),
    ('S004', 'O004', 'W003', '7890123456', '2023-09-17', 'City3', 'Province3', 'Country3'),
    ('S005', 'O005', 'W003', '3456789012', '2023-09-18', 'City3', 'Province3', 'Country3'),
    ('S006', 'O006', 'W002', '9012345678', '2023-09-19', 'City2', 'Province2', 'Country2');

