-- ======================= without views ======================

-- With union
(SELECT ProductName FROM product WHERE QuantityInStock > 0)
UNION
(SELECT p.ProductName FROM product AS P
INNER JOIN inventory AS I ON P.ProductID = I.ProductID);

-- With intersect
/*
(SELECT ProductName FROM product WHERE QuantityInStock > 0)
INTERSECT
(SELECT DISTINCT P.ProductID FROM product AS P
INNER JOIN p_order_item as O ON P.ProductID = O.ItemID);
*/
SELECT P.ProductName FROM product as P inner join p_order_item as O 
on P.ProductID = O.ItemID 
where P.QuantityInStock >0;


-- with set difference

/*
(SELECT ProductName FROM product WHERE QuantityInStock > 0)
EXCEPT
(SELECT DISTINCT P.ProductID FROM product AS P
INNER JOIN p_order_item as O ON P.ProductID = O.ItemID);
*/

Select distinct P.ProductName from product as P inner join p_order_item as O 
on P.ProductID = O.ItemID WHERE QuantityInStock > 0 and O.ItemID is NULL;

-- with division
SELECT CustomerID
FROM p_order
GROUP BY CustomerID
HAVING COUNT(DISTINCT ProductID) = (SELECT COUNT(*) FROM product);





-- =================== Join with views =================

-- innner join
create view supplierpaymentterms AS
SELECT P.PaymentTerms, S.SupplierName 
FROM supplier_paymentterms AS P
INNER JOIN supplier as S ON P.SupplierID = S.SupplierID;

SELECT * FROM supplierpaymentterms;


-- natural join
create view Stocks AS
select  I.QuantityInStock , W.Capacity
FROM inventory as I
natural join warehouse as W;

SELECT * FROM Stocks;

-- left outer join
create view Ordertoship AS
SELECT P.OrderDate, S.ShippingDate
FROM p_order as P
LEFT OUTER JOIN shipment AS S ON P.OrderID = S.OrderID;

SELECT * FROM Ordertoship;


-- right outer join
create view Suppliernumber AS
SELECT S.supplierID, T.telephone
FROM supplier as S
RIGHT OUTER JOIN supplier_telephone AS T ON S.SupplierID = S.SupplierID;

SELECT * FROM Suppliernumber;


-- full outer join
create view citypaymentterm AS
(SELECT S.supplierCity, P.paymentterms
FROM supplier as S
LEFT OUTER JOIN supplier_paymentterms AS P ON S.SupplierID = S.SupplierID)
UNION
(SELECT S.supplierCity, P.paymentterms
FROM supplier as S
LEFT OUTER JOIN supplier_paymentterms AS P ON S.SupplierID = S.SupplierID);

SELECT * FROM citypaymentterm;





-- =================== Nested Queries with relaitonal algibric operations ==================

-- with union 
SELECT CustomerID
FROM p_order
WHERE ProductID IN (
    (SELECT ProductID FROM product WHERE QuantityInStock > 0)
    UNION
    (SELECT DISTINCT P.ProductID FROM product AS P
    INNER JOIN product_supplier AS PS ON P.ProductID = PS.ProductID)
);


-- with intersection
/*
(SELECT ProductName
FROM product
WHERE QuantityInStock > 0)
INTERSECT
(SELECT DISTINCT P.ProductID FROM product AS P
INNER JOIN product_supplier AS PS ON P.ProductID = PS.ProductID);
*/


SELECT DISTINCT P.ProductName
FROM product AS P
INNER JOIN product_supplier AS PS ON P.ProductID = PS.ProductID
WHERE P.QuantityInStock > 0;

-- with set difference
/*
(SELECT ProductName
FROM product
WHERE QuantityInStock > 0)
EXCEPT
(SELECT DISTINCT P.ProductID FROM product AS P
INNER JOIN product_supplier AS PS ON P.ProductID = PS.ProductID);
*/


SELECT DISTINCT P1.ProductName
FROM product AS P1
LEFT JOIN (
    SELECT DISTINCT P2.ProductID
    FROM product AS P2
    INNER JOIN product_supplier AS PS ON P2.ProductID = PS.ProductID
) AS T ON P1.ProductID = T.ProductID
WHERE P1.QuantityInStock > 0 AND T.ProductID IS NULL;




















