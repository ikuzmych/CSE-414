SELECT DISTINCT C.name
FROM FLIGHTS AS F, CARRIERS AS C
WHERE F.carrier_id = C.cid
GROUP BY F.day_of_month, F.month_id, C.name
HAVING COUNT(*) > 1000;