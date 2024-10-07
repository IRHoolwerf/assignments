--1.
SELECT DISTINCT city AS CUSTOMER_CITY
FROM customers;

--2.
SELECT * 
FROM employees
WHERE firstName NOT IN ('Gerard','Mary');

--3.
SELECT CONCAT(firstName, ' ',lastName)
FROM employees
WHERE RIGHT(lastName,1) = 'n';

--4.
SELECT e.*
FROM employees AS e
LEFT JOIN offices AS o
	ON e.officeCode = o.officeCode
WHERE o.territory = 'EMEA';

--5. 
SELECT 
	territory,
	COUNT(employeeNumber) AS 'countEmployees'
FROM employees AS e
LEFT JOIN offices AS o
	ON e.officeCode = o.officeCode
GROUP BY territory
ORDER BY 'countEmployees' DESC;

--6. 
SELECT 
	pl.textDescription AS productLine,
    p.productName
FROM productlines AS pl
LEFT JOIN products AS p
	ON pl.productLine = p.productLine
ORDER BY 
	productLine ASC,
    productName DESC;

--7. 
SELECT 
	p.productName,
	SUM(od.quantityOrdered) AS quantitySold
FROM products AS p
INNER JOIN orderdetails AS od
	ON p.productCode = od.productCode
INNER JOIN orders AS o
	ON o.orderNumber = od.orderNumber
WHERE 
	YEAR(o.orderDate) = 2005 
    AND MONTH (o.orderdate) = 4
GROUP BY p.productName
ORDER BY quantitySold DESC
LIMIT 5;

--8.
SELECT 
	p.productName,
	COALESCE(SUM(od.quantityOrdered * od.priceEach),0) AS totalRevenue
FROM products AS p
LEFT JOIN orderdetails AS od
	ON p.productCode = od.productCode
GROUP BY p.productName

