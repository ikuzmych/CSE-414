/*
Number of affected rows: 4
Time to complete query: 95s

First four rows:

city
-----
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
Victoria TX

*/
SELECT DISTINCT F4.origin_city AS city
FROM Flights AS F4
WHERE F4.origin_city NOT IN (SELECT DISTINCT F3.dest_city AS city
FROM FLIGHTS AS F2, FLIGHTS AS F3
WHERE F2.dest_city = F3.origin_city
AND F2.origin_city = 'Seattle WA')
AND F4.origin_city NOT IN (SELECT DISTINCT F1.dest_city AS city
FROM FLIGHTS AS F1
WHERE F1.origin_city = 'Seattle WA')
ORDER BY F4.origin_city ASC;
