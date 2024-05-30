WITH gps_data AS (
    SELECT 
        gps.trajectory_id, gps.uid, min(gps.time_t) AS start_time,
        gps.category,
        COALESCE(max(gps.leaving_time), max(gps.time_t)) - min(gps.time_t) AS duration,
		ST_MakeLine(gps.posicao_google) AS geom,
        ST_StartPoint(ST_MakeLine(gps.posicao_google)) AS start_point,
        ST_EndPoint(ST_MakeLine(gps.posicao_google)) AS end_point,
		ST_Distance(ST_transform(ST_StartPoint(ST_MakeLine(gps.posicao_google))::geometry,3763) ,
					ST_transform(ST_EndPoint(ST_MakeLine(gps.posicao_google))::geometry,3763)) distancia
    FROM (
        SELECT 
            t1.time_t,
            t1.uid,
            t1.trajectory_id,
            t1.posicao_google,
            t2.category,
            t2.leaving_time 
        FROM 
            sensor_logger_tripsopendata t1
        LEFT JOIN 
            sensor_logger_stops_foursquare t2 
        ON 
            ST_DWithin(t1.posicao_google, t2.posicao_google, 5) 
            AND (t1.time_t >= t2.time_t AND t1.time_t <= t2.leaving_time) 
            AND t1.uid = t2.uid
    ) AS gps 
    GROUP BY 
        gps.trajectory_id, 
        gps.uid, 
        gps.category
)
	 SELECT 
        gid,fclass,name,gps_data.*
    FROM 
        gps_data
    Left JOIN 
        landuse 
    ON 
        ST_Intersects(gps_data.geom, landuse.geom)
