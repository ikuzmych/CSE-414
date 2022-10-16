SELECT C.name AS name, SUM(F.departure_delay) AS delay
FROM CARRIERS AS C, FLIGHTS AS F
WHERE  C.cid = F.carrier_id
GROUP BY C.name;