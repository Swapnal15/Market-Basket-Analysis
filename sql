
-- Create table custorder
CREATE TABLE custorder
( orderid INT,
customerid INT,
productid varchar(100));

-- Insert values into table
INSERT INTO custorder (orderid,customerid,productid)
VALUES (1111,1,'AAA'),
(1111,1,'BBB'),
(1111,1,'CCC'),
(2222,2,'AAA'),
(2222,2,'CCC'),
(3333,3,'BBB'),
(3333,3,'CCC'),
(4444,4,'AAA'),
(4444,4,'BBB'),
(4444,4,'CCC'),
(5555,5,'DDD'),
(5555,5,'AAA'),
(6666,6,'BBB'),
(6666,6,'CCC');

Select * from custorder;

-- Analysis of frequently bought items
WITH temp AS(
SELECT c1.customerid, c1.orderid, 
c1.productid as product_1, c2.productid as product_2
 FROM custorder c1
JOIN custorder c2
ON c1.customerid=c2.customerid -- Join the table with itself
WHERE c1.productid> c2.productid -- to get unique combination
)
SELECT temp.product_1, temp.product_2, count(*) AS Bought_Together FROM temp
GROUP BY temp.product_1, temp.product_2
ORDER BY temp.product_1, temp.product_2;
