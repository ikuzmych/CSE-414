SELECT C.name, AVG(F.canceled)*100 as percent
FROM FLIGHTS AS F, CARRIERS AS C
WHERE F.origin_city = 'Seattle WA' AND 
      F.carrier_id = C.cid
GROUP BY C.name
HAVING AVG(F.canceled) > 0.005;