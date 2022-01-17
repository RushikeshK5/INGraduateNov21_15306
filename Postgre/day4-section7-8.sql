---------------------------------------Section 7 - AdventureWorks------------------------------------------

1. Return the name, weight, and productnumber of  all the products  ordered by weight from lightest to heaviest.  
	SELECT production.product.name, production.product.weight, production.product.productnumber
	FROM production.product
	ORDER BY weight ASC;
	
2. Return the records from productvendor for productid = 407 in order of averageleadtime from shortest to longest.
	SELECT *
	FROM purchasing.productvendor
	WHERE productid=407
	ORDER BY averageleadtime ASC;
	
3. Find all the salesorderdetail records for productid 799 and order them by largest orderqty to smallest.
	SELECT *
	FROM sales.salesorderdetail
	WHERE productid=799
	ORDER BY orderqty DESC;
	
4. What is the largest  discount percentage offered in the specialoffer table.
	SELECT MAX(discountpct)
	FROM sales.specialoffer;
	
5. Find the smallest number of sickleavehours for an employee.
	SELECT MIN(sickleavehours)
	FROM humanresources.employee;
	
6. Find the largest rejected quantity in the purchaseorderdetail table.
	SELECT MAX(rejectedqty)
	FROM purchasing.purchaseorderdetail;
	
7. Find the average rate from employeepayhistory table.
	SELECT AVG(rate)
	FROM humanresources.employeepayhistory;
	
8. Find the average standardcost in the productcosthistory table for productid 738.
	SELECT AVG(standardcost)
	FROM production.productcosthistory
	WHERE productid= 738;
	
9. Find the sum of scrappedqty from the workorder table for productid 529.
	SELECT SUM(scrappedqty)
	FROM production.workorder
	WHERE productid= 529;
	
10. Find all vendor names with a name that starts with letter G.
	 SELECT purchasing.vendor.name
	 FROM purchasing.vendor
	 WHERE name LIKE 'G%';
	
11. Find all vendor names that have the word Bike in them.
	 SELECT purchasing.vendor.name
	 FROM purchasing.vendor
	 WHERE name LIKE '%Bike%';
	
12. Search the person table for every firstname that has t as a second letter.
	 SELECT person.person.firstname
	 FROM person.person
	 WHERE firstname LIKE '_t%';
	
13. Return the first 20 records from emailaddress table.
	 SELECT *
	 FROM person.emailaddress
	 LIMIT 20;
	
14. Return the first 2 records from productcategory table.
	 SELECT *
	 FROM production.productcategory
	 LIMIT 2;
	
15. How many product records have a missing weight value.
	 SELECT COUNT(*)
	 FROM production.product
	 WHERE weight IS NULL;

16. How many person records have an additionalcontactinfo field that has a value.
	 SELECT COUNT(*)
	 FROM person.person
	 WHERE additionalcontactinfo IS NOT NULL;


---------------------------------------Section 8 - AdventureWorks (JOINS)------------------------------------------


1. Join (with inner join) together person, personphone, businessentity and phonenumber type in the persons schema.  
   Return first name, middle name, last name, phone number and the name of the phone number type (home, office, etc.)  
   Order by business entity id descending.
	SELECT firstname,middlename,lastname,phonenumber,name
	FROM person.personphone AS ph
	JOIN person.businessentity USING (businessentityid)
	JOIN person.person USING (businessentityid)
	JOIN person.phonenumbertype USING (phonenumbertypeid)
	ORDER BY ph.businessentityid DESC;

2. Join (Inner) productmodel, productmodelproductiondescriptionculture, productdescription and culture from the production schema.  
   Return the productmodel name, culture name, and productdescription description ordered by the product model name.
	SELECT pm.name,c.name,description
	FROM production.productdescription
	JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
	JOIN production.culture AS c USING (cultureid)
	JOIN production.productmodel AS pm USING (productmodelid)
	ORDER BY pm.name ASC;

3. Add a join to previous example to production.product and return the product name field in addition to other information.
	SELECT p.name,pm.name,c.name,description
	FROM production.productdescription
	JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
	JOIN production.culture AS c USING (cultureid)
	JOIN production.productmodel AS pm USING (productmodelid)
	JOIN production.product AS p USING (productmodelid)
	ORDER BY pm.name ASC;

4. Join product and productreview in the schema table.  Include every record from product and any reviews they have.  
   Return the product name, review rating and comments.  Order by rating in ascending order.
	SELECT name, rating, comments
	FROM production.product
	LEFT JOIN production.productreview USING (productid)
	ORDER BY rating ASC;

5. Use a right join to combine workorder and product from production schema to bring back all products and any work orders they have.  
   Include the product name and workorder orderqty and scrappedqty fields.  Order by productid ascending.
	SELECT p.name,orderqty,scrappedqty
	FROM production.workorder
	RIGHT JOIN production.product AS p USING (productid)
	ORDER BY p.productid ASC;