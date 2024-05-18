SELECT a.user_x, a.time_t_trunc_10min,
AVG(acc_x_mean) AS acc_x_mean,
    AVG(acc_y_mean) AS acc_y_mean,
    AVG(acc_z_mean) AS acc_z_mean,
    AVG(gravity_x_mean) AS gravity_x_mean,
    AVG(gravity_y_mean) AS gravity_y_mean,
    AVG(gravity_z_mean) AS gravity_z_mean,
    AVG(gyro_x_mean) AS gyro_x_mean,
    AVG(gyro_y_mean) AS gyro_y_mean,
    AVG(gyro_z_mean) AS gyro_z_mean
FROM mdf_motion_sensors a,
(SELECT time_t_trunc_10min, user_x 
 FROM mdf_location 
 GROUP BY user_x, time_t_trunc_10min ORDER BY time_t_trunc_10min, user_x) 
 AS DerivedTable2 
 WHERE DerivedTable2.time_t_trunc_10min = a.time_t_trunc_10min 
 AND DerivedTable2.user_x=a.user_x
 GROUP BY a.user_x, a.time_t_trunc_10min; 
