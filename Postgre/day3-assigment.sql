---------------------------------------Section 7 - Intermediate SELECT Statement------------------------------------------
1. Oreder BY
	I- display in asending ORDER
		
		SELECT DISTINCT country
		FROM suppliers
		ORDER BY country ASC		
	II- Display in Deseding ORDER
		
		SELECT DISTINCT country
		FROM suppliers
		ORDER BY country DESC		
	III- adding citys in it
		
		SELECT DISTINCT country, city
		FROM suppliers
		ORDER BY country ASC, city DESC
	IV- Productname display ASC and poduct price display DESC
	
		SELECT productname, unitprice
		FROM products
		ORDER BY unitprice DESC, productname ASC
	
2. Using Min and max function
	I-	
		SELECT MIN(orderdate)
		FROM orders
		WHERE shipcountry='Italy';
	
	II- what was last order to shipped
	
		SELECT MAX(shippeddate)
		FROM orders
		WHERE shipcountry='Canada';
	
	III- order sent to france based on order date versus ship DATE
	
		SELECT MAX(shippeddate - orderdate)
		FROM orders
		WHERE shipcountry='France';
	
3. using AVG and SUM
	I- 
	
		SELECT SUM(quantity)
		FROM order_details
		WHERE productid=14;
	
	II- average number of steeleye stout
	
		SELECT AVG(quantity)
		FROM order_details
		WHERE productid=35;

4. like to match patterns
	I-
		SELECT companyname,contactname
FROM customers
WHERE contactname LIKE 'D%';

	II-Patterns WITH
	
		SELECT companyname
FROM suppliers
WHERE companyname LIKE '_or%';

	III-company name end with er
	
	SELECT companyname
FROM customers
WHERE companyname LIKE '%er';

5. Renaming Columns with Alis
	I-
	
		SELECT unitprice*quantity AS TotalSpent
		FROM order_details;

		
	
6. LIMIT to Control Number of Records Returned

	I-
		SELECT productid,unitprice*quantity AS TotalCost
		FROM order_details
		ORDER BY TotalCost DESC
		LIMIT 3;
	
	II- Calculate the product with 	the least inventory in stock by total doller amount of inventory?
	
	SELECT productname,unitprice*unitsinstock AS TotalInventory
	FROM products
	ORDER BY TotalInventory ASC
	LIMIT 2;

7.Null VALUES

	I- region is NULL
		SELECT count(*)
		FROM customers
		WHERE region IS NULL;
	
	II- supplier is not null
		SELECT count(*)
		FROM suppliers
		WHERE region IS NOT NULL;
	III- HOW MANY ORDER DID NOT have shipp region
		SELECT count(*)
		FROM orders
		WHERE shipregion IS NULL;
		
---------------------------------------Section 9 - Grouping and aggregation Function------------------------------------------
1. Group BY
	I-
	