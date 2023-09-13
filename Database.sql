create database supply_chain;
use supply_chain;

create table product(
	ProductID varchar(4) not null,
    ProductName varchar(20),
    QuantityInstock int(5),
    UnitPrice float(5),
    Descrip varchar(50),
    primary key (ProductID)
);
create table product_supplier(
	ProductID varchar(4),
    Supplier varchar(20),
    primary key (ProductID, Supplier),
    foreign key (ProductID) references product(ProductID)
);
create table supplier(
	SupplierID varchar(4) not null,
    SupplierName varchar(20),
    SupplierEmail varchar(30),
    SupplierCity varchar(30),
    SupplierProvince varchar(30),
    SupplierCountry varchar(30),
    primary key (SupplierID)
);
create table supplier_telephone(
	SupplierID varchar(4),
    Telephone int(12),
    primary key (SupplierID, Telephone),
    foreign key (SupplierID) references supplier(SupplierID)
);
create table supplier_paymentTerms(
	SupplierID varchar(4),
	PaymentTerms varchar(20),
    primary key (SupplierID, PaymentTerms),
    foreign key (SupplierID) references supplier(SupplierID)
);
create table p_order(
	OrderID varchar(4) not null,
    ProductID varchar(4) not null,
    CustomerID varchar(4) not null,
    ParentOrderID varchar(4) not null,
    OrderDate date,
    DeliveryDate date,
    OrderStatus boolean,
    TotalAmount float(5),
    primary key (OrderID),
    SubOrderID varchar(4) not null,
    foreign key (SubOrderID) references p_order(OrderID)
);
create table inventory(
	ProductID varchar(4) not null,
    WarehouseID varchar(4),
    RecorderLevel varchar(20),
    LastStockDate date,
    QuantityInStock int(5),
    primary key (ProductID, WarehouseID)
);
create table warehouse(
	WarehouseID varchar(4) not null,
    WarehouseName varchar(20) not null,
    Capacity int(10),
    ParentWareHouseID varchar(4),
    primary key (WarehouseID, WarehouseName),
    SubWareHouseID varchar(4),
    WarehouseCity varchar(30),
    WarehouseProvince varchar(30),
    WarehouseCountry varchar(30),
    foreign key (SubWareHouseID) references warehouse(WarehouseID)
);
create table shipment(
	ShipmentID varchar(4) not null,
    OrderID varchar(4) not null,
    WarehouseID varchar(4) not null,
    TrackingNumber varchar(10),
    ShippingDate date,
    ShippingCity varchar(30),
    ShippingProvince varchar(30),
    ShippingCountry varchar(30),
    primary key (ShipmentID)
);
create table shipping_method(
	ShipmentID varchar(4),
	ShippingMethod varchar(10),
    primary key (ShipmentID,ShippingMethod),
    foreign key (ShipmentID) references shipment(ShipmentID)
);
create table product_attribute(
	AttributeID varchar(4) not null,
    AttributeName varchar(20),
    AttributeValue int(5),
    ProductID varchar(4),
    foreign key (ProductID) references product(ProductID)
);
create table p_order_item(
	ItemID varchar(4) not null,
    ItemPrice float(5),
    Quantity int(5),
    OrderID varchar(4),
    foreign key (OrderID) references p_order(OrderID)
);

-- Relationships --

create table ProductOrderRelation(
	ProductID varchar(4) not null,
    OrderID varchar(4) not null,
    primary key (ProductID, OrderID),
    constraint fk_product foreign key (ProductID) references product(ProductID),
    constraint fk_order foreign key (OrderID) references p_order(OrderID)
);
create table ProductSupplierRelation(
	ProductID varchar(4) not null,
    SupplierID varchar(4) not null,
    primary key (ProductID, SupplierID),
    constraint fk_product_sup foreign key (ProductID) references product(ProductID),
    constraint fk_supplier foreign key (SupplierID) references supplier(SupplierID)
);

alter table inventory
add constraint fk_ProductID
foreign key (ProductID) references product(ProductID);

alter table inventory
add constraint fk_WarehouseID
foreign key (WarehouseID) references warehouse(WarehouseID);

alter table shipment
add constraint fk_OrderID
foreign key (OrderID) references p_order(OrderID);

alter table shipment
add constraint fk_WarehouseID_Shipment
foreign key (WarehouseID) references warehouse(WarehouseID);
