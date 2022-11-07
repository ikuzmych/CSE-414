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


SELECT DISTINCT F2.origin_city AS city
FROM FLIGHTS AS F2,
(SELECT F.origin_city, MAX(actual_time) AS maximum
	FROM FLIGHTS AS F GROUP BY F.origin_city) AS F1
WHERE F2.origin_city = F1.origin_city
AND F1.maximum = F2.actual_time
AND F1.maximum < 180
ORDER BY city ASC;