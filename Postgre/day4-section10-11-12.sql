---------------------------------------Section 10 - Combining Queries------------------------------------------
52. UNION
	I- Combine the result of 2 or more queries.
		SELECT companyname
		FROM customers
		UNION
		SELECT companyname
		FROM suppliers;
	II- Grab All VALUES- all our customers and suppliers, with one recored for each companies city
		SELECT city
		FROM customers
		UNION ALL
		SELECT city
		FROM suppliers;
	III- Countries of all our suppliers and customers in alphabetical order.
		SELECT country
		FROM customers
		UNION
		SELECT country
		FROM suppliers
		ORDER BY country ASC;
	IV- All list of countries of our suppliers and customers,with a record for each one.
		
		SELECT country
		FROM customers
		UNION ALL
		SELECT country
		FROM suppliers
		ORDER BY country ASC;
53. INTERSECT
	I- find item hat are both queris.
		SELECT country FROM customers
		INTERSECT
		SELECT country FROM suppliers;
		
	II-all countries that we have both customers and suppliers IN
	
		SELECT COUNT(*) FROM
		(SELECT country FROM customers
		INTERSECT ALL
		SELECT country FROM suppliers) AS same_country;
	
	III- The number of customer and supplier pairs that are in the same country.
	
		SELECT COUNT(*) FROM
		(SELECT city FROM customers
		INTERSECT
		SELECT city FROM suppliers ) AS same_city;

54. Except
	I- all countiers that we customers in but no suppliers.
		SELECT country FROM customers
		EXCEPT
		SELECT country FROM suppliers;
	II- the number of customer that are in a country without suppliers.
		SELECT COUNT(*) FROM
		(SELECT country FROM customers
		EXCEPT ALL
		SELECT country FROM suppliers) AS same_country;
	III- Cities we have a supplier with no customer.
	
		SELECT city FROM suppliers
		EXCEPT
		SELECT city FROM customers;
	IV- how many customer do we have in cities without suppliers
	
		SELECT COUNT(*) FROM
		(SELECT city FROM customers
		INTERSECT
		SELECT city FROM suppliers ) AS same_city;
---------------------------------------Section 11 - Subqueries------------------------------------------

55. Subquery using EXISTS
	I- Find customers with an order in april,1997
		SELECT companyname,contactname
		FROM customers
		WHERE EXISTS (SELECT customerid FROM orders
          WHERE customerid=customers.customerid AND
		  orderdate BETWEEN '1997-04-01' AND '1997-04-30');
		  
	II- all suppliers that don have as order in december 1996
	
		SELECT companyname
		FROM suppliers
		WHERE  NOT EXISTS (SELECT products.productid FROM products
          JOIN order_details ON products.productid=order_details.productid
          JOIN orders ON order_details.orderid=orders.orderid
		  WHERE suppliers.supplierid=products.supplierid AND
          orderdate BETWEEN '1996-12-01' AND '1996-12-31' );
		  
56. subquery using ANY AND ALL
	I- with an order detail with more than 50 items is a single product
		SELECT companyname
		FROM customers
		WHERE customerid = ANY (SELECT customerid FROM orders 
					   JOIN order_details ON orders.orderid=order_details.orderid
					   WHERE quantity>50);
					
	II- find all suppliers hat have had as order with 1 item.
		SELECT companyname
		FROM suppliers
		WHERE  supplierid = ANY (SELECT products.supplierid FROM order_details
                        JOIN products ON products.productid=order_details.productid
                        WHERE quantity = 1);
	
	III- which had order  amounts hat were higher than the average of all the products.
		SELECT DISTINCT productname
		FROM products
		JOIN order_details ON products.productid=order_details.productid
		WHERE  order_details.unitprice*quantity > ALL
				(SELECT AVG(order_details.unitprice*quantity)
				FROM order_details
				GROUP BY productid);
---------------------------------------Section 12 - Modifying data in table- Insert, Update, Delete ------------------------------------------	

58. Insert into
	I- inster into ORDER
		SELECT * FROM orders 
		WHERE customerid='VINET'
		
		INSERT INTO orders
			(orderid,customerid, employeeid, orderdate, requireddate, shipvia,
				freight, shipname, shipaddress, shipcity, shippostalcode,shipcountry)
			VALUES (11078, 'VINET', 4, '2017-09-16','2017-09-30',3,
			42.5, 'Vins et alcools Chevalier','59 rue de l''Abbaye', 'Reims','51100', 'France');
	II- Insert an order detail for order we just created. Make it an Quantity of 20 of queso cabrales(you will have to look up id) with a price of$14
		
		SELECT *
		FROM PRODUCTS	
		WHERE productname LIKE'Queso%'
		
		INSERT INTO order_details
		(orderid, productid, unitprice,quantity,discount)
		VALUES (11078,11,14,20,0);

59.UPDATE
	I- They need it by 2017-09-20 (10 days earlier), and he shipping cost will increses to $50
	
		UPDATE orders
		SET requireddate='2017-09-20',freight=50
		WHERE orderid=11078;
	
	II- they also want 40 Queso Cabrales instead of 20 and we are giving a discount of 05. 
		Trick is the WHERE clause to make sure we update the right order details since there is no order detail id field.
			
		UPDATE order_details
		SET quantity=40,discount=.05
		WHERE orderid=11078 AND productid=11;

60. DELETE
	I- They cancel the order, so lets first delete the order_detail.
		DELETE FROM order_details
		WHERE orderid=11078 AND productid=11;
	
	II- delete the order for the customer using the order id.
		DELETE FROM orders
		WHERE orderid=11078;
	
61. Select INTO
	I- lets backup all our suppliers in Northwind America.
		SELECT *
		INTO suppliers_northamerica
		FROM suppliers
		WHERE country in ('USA','Canada');
		
	