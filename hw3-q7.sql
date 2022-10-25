/*
Number of affected rows: 4
Time to complete query: 53s

First four rows:

city
-----
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
Victoria TX
*/

SELECT DISTINCT C.name AS carrier
FROM CARRIERS AS C, FLIGHTS AS F
WHERE C.cid = F.carrier_id
AND F.dest_city = 'San Francisco CA'
AND F.origin_city = 'Seattle WA'
ORDER BY C.name ASC;