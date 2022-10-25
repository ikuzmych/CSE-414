/*
Number of affected rows: 4
Time to complete query: 58s

First four rows:

carrier
-------
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/

WITH sub AS (SELECT DISTINCT F.carrier_id
FROM FLIGHTS AS F
WHERE F.origin_city = 'Seattle WA'
AND F.dest_city = 'San Francisco CA')
SELECT C.name AS carrier
FROM CARRIERS AS C, sub AS subF
WHERE C.cid = subF.carrier_id
ORDER BY C.name ASC;
