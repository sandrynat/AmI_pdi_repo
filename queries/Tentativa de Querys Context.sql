SELECT l.time, l.time_t,l.user_x, a.* 
FROM public.mdf_location l left join mdf_activities a 
on l.time=a.time and l.user_x=a.user_x ;


SELECT 
    l.time, 
    l.time_t, 
    l.user_x,
    b.*
FROM 
    public.mdf_location l 
LEFT JOIN 
    mdf_activities a 
ON 
    DATE_TRUNC('MINUTE', l.time_t) = DATE_TRUNC('MINUTE', a.time_t) 
    AND l.user_x = a.user_x
LEFT JOIN 
    mdf_battery b 
ON 
    DATE_TRUNC('MINUTE', l.time_t) = DATE_TRUNC('MINUTE', b.time_t) 
    AND l.user_x = b.user_x
LEFT JOIN 
    mdf_environment_sensors e 
ON 
    DATE_TRUNC('MINUTE', l.time_t) = DATE_TRUNC('MINUTE', e.time_t) 
    AND l.user_x = e.user_x	
LEFT JOIN 
    mdf_motion_sensors m 
ON 
    DATE_TRUNC('MINUTE', l.time_t) = DATE_TRUNC('MINUTE', m.time_t) 
    AND l.user_x = m.user_x	
LEFT JOIN 
    mdf_wifi_scans h 
ON 
    DATE_TRUNC('MINUTE', l.time_t) = DATE_TRUNC('MINUTE', h.time_t) 
    AND l.user_x = h.user_x;
	

	SELECT 
    l.time, 
    l.time_t, 
    l.user_x, 
    a.*
FROM 
    public.mdf_location l 
LEFT JOIN 
    mdf_activities a 
ON 
    DATE_TRUNC('HOUR', l.time_t) + INTERVAL '1 minute' * (FLOOR(EXTRACT(MINUTE FROM l.time_t) / 5) * 5) = 
    DATE_TRUNC('HOUR', a.time_t) + INTERVAL '1 minute' * (FLOOR(EXTRACT(MINUTE FROM a.time_t) / 5) * 5)
    AND l.user_x = a.user_x;
	
	
	SELECT 
    l.time, 
    l.time_t, 
    l.user_x, 
    a.*
FROM 
    public.mdf_location l 
LEFT JOIN 
    mdf_activities a 
ON 
    DATE_TRUNC('HOUR', l.time_t) + INTERVAL '1 minute' * (FLOOR(EXTRACT(MINUTE FROM l.time_t) / 5) * 5) = 
    DATE_TRUNC('HOUR', a.time_t) + INTERVAL '1 minute' * (FLOOR(EXTRACT(MINUTE FROM a.time_t) / 5) * 5)
    AND l.user_x = a.user_x;


