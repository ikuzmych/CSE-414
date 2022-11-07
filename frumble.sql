/* Illya Kuzmych. HW4. CS 414. fall 2022 */

/* 4.1 */
CREATE TABLE FData (
	name VARCHAR(256),
	discount INT,
	month VARCHAR(15),
	price INT
);

/* 4.2
name -> price */
SELECT * FROM 
FData AS F, FData AS F2
WHERE ((F.name = F2.name) AND (F.price != F2.price));
/* no output, as name depends on price */


/* month -> discount */
SELECT * FROM FData AS F, FData AS F2
WHERE ((F.month = F2.month) AND (F.discount != F2.discount));
/* no output, as month depends on the discount */

	/*
	name -> price and month -> discount implies
	name, month -> price, discount

	name, discount -> price, month
	*/
SELECT * FROM 
FData AS F, FData AS F2
WHERE ((F.name = F2.name) AND (F.discount = F2.discount)
		AND (F.price != F2.price) AND (F.month != F2.month));

/* month, price -> discount, name */
SELECT * FROM 
FData AS F, FData AS F2
WHERE ((F.month = F2.month) AND (F.price = F2.price)
		AND (F.discount != F2.discount) AND (F.name != F2.name));

	/*
	Functional dependencies:
		name -> price
		month -> discount
		name, month -> price, discount
		name, discount -> price, month
		month, price -> discount, name
	*/

/* 4.3 */

	/*
	S(name,price,discount,month)
	{name}+ = {name,price} and {name}+ != {name}
	{name}+ != {name,price,discount,month}

	S(name,price,discount,month) decomposes to S1(name,price) and S2(name,discount,month)

	S2(name,discount,month)
	{month}+ = {month, discount} and {month}+ != {month} and {month}+ != {name,discount,month}

	S2(name,discount,month) decomposes to S21(month,discount) and S22 (month, name)

	BCNF is S1(name,price), S21(month,discount), S22(month, name)
	*/

CREATE TABLE NamePrice (
	name VARCHAR(300) PRIMARY KEY,
	price INT
);

CREATE TABLE MonthDiscount (
	month VARCHAR(30)  PRIMARY KEY,
	discount INT
);

CREATE TABLE MonthName (
	name VARCHAR(300),
	month VARCHAR(30),
	FOREIGN KEY(name) REFERENCES NamePrice(name),
	FOREIGN KEY(month) REFERENCES MonthDiscount(month)
);

/* 4.4 */
INSERT INTO NamePrice  
SELECT DISTINCT name, price FROM
FData;

SELECT COUNT(*) FROM NamePrice; /* output: 36 rows */


INSERT INTO MonthDiscount 
SELECT DISTINCT month, discount FROM
FData;

SELECT COUNT(*) FROM MonthDiscount; /* output: 12 rows */


INSERT INTO MonthName 
SELECT DISTINCT name, month FROM
FData;

SELECT COUNT(*) FROM MonthName; /* output: 426 rows */



SELECT F.name, F.price, F2.month, F2.discount FROM
NamePrice AS F, MonthDiscount AS F2, MonthName AS F3
WHERE F.name = F3.name and F2.month = F3.month;
/* output: 426. got everything*/