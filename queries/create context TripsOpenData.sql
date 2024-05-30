CREATE TABLE context_dataset_TripsOpenData AS
SELECT gps.trajectory_id,uid,min(time_t) as start_time, ST_MakeLine(gps.posicao_pt ORDER BY time_t) As geom,
	avg(location_lat) location_lat,
avg(location_lon) location_lon,
max(wifi_connected) wifi_connected,
avg(sensor_light_mean) sensor_light_mean,
avg(sensor_accelerometer_x_mean) sensor_accelerometer_x_mean,
avg(sensor_accelerometer_y_mean) sensor_accelerometer_y_mean,
avg(sensor_accelerometer_z_mean) sensor_accelerometer_z_mean,
avg(sensor_gravity_x_mean) sensor_gravity_x_mean,
avg(sensor_gravity_y_mean) sensor_gravity_y_mean,
avg(sensor_gravity_z_mean) sensor_gravity_z_mean,
avg(sensor_gyroscope_x_mean) sensor_gyroscope_x_mean,
avg(sensor_gyroscope_y_mean) sensor_gyroscope_y_mean,
avg(sensor_gyroscope_z_mean) sensor_gyroscope_z_mean,
avg(sensor_linear_acc_x_mean) sensor_linear_acc_x_mean,
avg(sensor_linear_acc_y_mean) sensor_linear_acc_y_mean,
avg(sensor_linear_acc_z_mean) sensor_linear_acc_z_mean,
avg(sensor_rotation_vec_x_mean) sensor_rotation_vec_x_mean,
avg(sensor_rotation_vec_y_mean) sensor_rotation_vec_y_mean,
avg(sensor_rotation_vec_z_mean) sensor_rotation_vec_z_mean,
avg(sensor_proximity_mean) sensor_proximity_mean,
	STRING_AGG (label, ';') label,
STRING_AGG (activity_label, ';') activity_label
	FROM context_dataset_stage As gps where trajectory_id>=0
	GROUP BY trajectory_id, uid
		order by uid
