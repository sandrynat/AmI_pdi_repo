SELECT *
FROM mdf_location a,
(SELECT * 
 FROM mdf_activities_stage 
 ) 
 AS DerivedTable2 
 WHERE DerivedTable2.time_t_trunc_10min = a.time_t_trunc_10min 
 AND DerivedTable2.user_x=a.user_x;