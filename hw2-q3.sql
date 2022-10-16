SELECT W.day_of_week AS day_of_week, AVG(F.arrival_delay) as delay
FROM FLIGHTS as F, WEEKDAYS as W
WHERE F.day_of_week_id = W.did
GROUP BY W.day_of_week
ORDER BY AVG(F.arrival_delay) DESC
LIMIT 1;