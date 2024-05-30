SELECT gps.trajectory_id,
uid,
min(time_t) as start_time,
category,
COALESCE(max(leaving_time), max(time_t)) -min(time_t) as duration,
ST_StartPoint(ST_MakeLine(gps.posicao_google)) start_point,
ST_EndPoint(ST_MakeLine(gps.posicao_google)) end_point, 
ST_Distance(ST_transform(ST_StartPoint(ST_MakeLine(gps.posicao_google))::geometry,3763) ,ST_transform(ST_EndPoint(ST_MakeLine(gps.posicao_google))::geometry,3763)) distancia,
ST_MakeLine(gps.posicao_google) As geom
	FROM (
		select t1.time_t,t1.uid,t1.trajectory_id,t1.posicao_google,t2.category, leaving_time from sensor_logger_tripsopendata t1
left join sensor_logger_stops_foursquare t2
on ST_DWithin(t1.posicao_google, t2.posicao_google, 5) and (t1.time_t>= t2.time_t and  t1.time_t<= t2.leaving_time) and t1.uid=t2.uid
		 ) As gps 
	GROUP BY trajectory_id, uid, category
		order by uid

