/*
Number of affected rows: 109
Time to complete query: 48s

First 20 rows in output:

city
-----
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
*/


SELECT DISTINCT f2.origin_city AS city
FROM FLIGHTS AS f2,
(SELECT f.origin_city, MAX(actual_time) AS maximum
	FROM FLIGHTS AS f GROUP BY f.origin_city) AS f1
WHERE f2.origin_city = f1.origin_city
AND f1.maximum = f2.actual_time
AND f1.maximum < 180
ORDER BY city ASC;