SELECT gps.trajectory_id, ST_MakeLine(gps.posicao_it) As geom
	FROM ( SELECT trajectory_id, time, posicao_it
			FROM context_dataset_stage ORDER BY trajectory_id, time ) As gps
	GROUP BY trajectory_id;

--filtrar pelo length > ...










-- se o dataset foi bem construido
select trajectory_id,uid,start_time, geom,ST_astext(geom) from(
SELECT gps.trajectory_id,uid,min(time_t) as start_time, ST_MakeLine(gps.posicao_pt ORDER BY time_t) As geom
	FROM context_dataset_stage As gps where trajectory_id>=0
	GROUP BY trajectory_id, uid
		order by uid);
		
		
select * from context_dataset_stage where uid=1;
		