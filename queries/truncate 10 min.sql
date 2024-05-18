SELECT a.user_x, a.time_t_trunc_10min, SUM(a.in_vehicle) AS in_vehicle, 
SUM(a.on_bicycle) AS on_bicycle, 
SUM(a.on_foot) AS on_foot,
SUM(a.running) AS running, 
SUM(a.still) AS still, 
SUM(a.tilting) AS tilting,
SUM(a.walking) AS walking,
SUM(a.unknown) AS unknown
FROM mdf_activities a,
(SELECT time_t_trunc_10min, user_x 
 FROM mdf_location 
 GROUP BY user_x, time_t_trunc_10min ORDER BY time_t_trunc_10min, user_x) 
 AS DerivedTable2 
 WHERE DerivedTable2.time_t_trunc_10min = a.time_t_trunc_10min 
 AND DerivedTable2.user_x=a.user_x
 GROUP BY a.user_x, a.time_t_trunc_10min; 

 
