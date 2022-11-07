/*
Number of affected rows: 327
Time to complete query: 26s

Output of first 20 rows:

origin_city	percentage
----------- ----------
Aberdeen SD	100
Abilene TX	100
Adak Island AK	88.88888889
Aguadilla PR	29.43396226
Akron OH	95.0617284
Albany GA	99.47916667
Albany NY	95.22830111
Albuquerque NM	90.64964326
Alexandria LA	99.56427015
Allentown/Bethlehem/Easton PA	98.98819562
Alpena MI	100
Amarillo TX	99.57044674
Anchorage AK	32.1460374
Appleton WI	99.3814433
Arcata/Eureka CA	99.57264957
Asheville NC	99.45652174
Ashland WV	100
Aspen CO	97.31800766
Atlanta GA	88.97227434
Atlantic City NJ	99.30875576

*/
SELECT F2.origin_city AS origin_city, CAST((SELECT COUNT(*) AS number
                                        FROM FLIGHTS AS F1
                                        WHERE F1.actual_time < 180
                                        AND F1.origin_city = F2.origin_city
                                        GROUP BY F1.origin_city) AS FLOAT) * 100 / COUNT(*) AS percentage
FROM FLIGHTS AS F2
GROUP BY F2.origin_city;