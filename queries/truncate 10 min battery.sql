SELECT a.user_x, a.time_t_trunc_10min,
avg(level) as level,
max(charging) as charging
FROM mdf_battery a,
(SELECT time_t_trunc_10min, user_x 
 FROM mdf_location 
 GROUP BY user_x, time_t_trunc_10min ORDER BY time_t_trunc_10min, user_x) 
 AS DerivedTable2 
 WHERE DerivedTable2.time_t_trunc_10min = a.time_t_trunc_10min 
 AND DerivedTable2.user_x=a.user_x
 GROUP BY a.user_x, a.time_t_trunc_10min; 
