SELECT C.name AS carrier, MAX(F.price) AS max_price
FROM CARRIERS AS C, FLIGHTS AS F
WHERE ((F.origin_city = 'Seattle WA' AND
      F.dest_city = 'New York NY') OR 
      (F.origin_city = 'New York NY' AND
      F.dest_city = 'Seattle WA')) AND
      C.cid = F.carrier_id
GROUP BY C.name;