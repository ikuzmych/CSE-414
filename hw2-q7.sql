SELECT SUM(F.capacity) AS capacity
FROM FLIGHTS AS F
WHERE ((F.origin_city = 'Seattle WA' AND
      F.dest_city = 'San Francisco CA') OR 
      (F.origin_city = 'San Francisco CA' AND
      F.dest_city = 'Seattle WA')) AND
      F.month_id = 7 AND
      F.day_of_month = 10;