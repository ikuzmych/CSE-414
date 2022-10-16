SELECT DISTINCT F.flight_num 
FROM FLIGHTS as F
WHERE ((F.origin_city = 'Seattle WA') AND
       (F.dest_city = 'Boston MA') AND
	   (F.day_of_week_id = 1) AND 
	   (F.carrier_id = 'AS'));