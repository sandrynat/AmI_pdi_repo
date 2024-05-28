SELECT distinct r.gid, name, ST_Length(r.geom::geography), r.geom
FROM
    sensor_logger p
JOIN
    roads r
ON
    ST_DWithin(p.posicao_google, r.geom, 0.0001)
ORDER BY ST_Length(r.geom::geography) desc; 
