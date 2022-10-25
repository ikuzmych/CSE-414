/*
Number of affected rows: 256
Time to complete query: 49s

First twenty rows:

city
-----
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlantic City NJ
Augusta GA
Bakersfield CA
Bangor ME

*/

SELECT DISTINCT F3.dest_city AS city
FROM FLIGHTS AS F2, FLIGHTS AS F3
WHERE F2.dest_city = F3.origin_city
AND F3.dest_city != 'Seattle WA'
AND F2.origin_city = 'Seattle WA'
AND F3.dest_city NOT IN (SELECT DISTINCT F1.dest_city AS city
            FROM FLIGHTS AS F1
            WHERE F1.origin_city = 'Seattle WA')
ORDER BY F3.dest_city ASC;
