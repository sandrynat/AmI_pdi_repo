SELECT count(*) FROM public.sensor_logger
select freguesias_3763.* from freguesias_3763 where gid in (SELECT DISTINCT freguesias_3763.gid
FROM freguesias_3763
JOIN sensor_logger
ON ST_Contains(freguesias_3763.geom, sensor_logger.posicao_pt));





----
select * from freguesias_3763, sensor_logger WHERE concelho like '%COIMBRA%' AND 
ST_Contains(freguesias_3763.geom, sensor_logger.posicao_pt); 



select st_astext(posicao_google),st_astext(posicao_pt) from sensor_logger;

select st_astext(geom) from freguesias_3763;
select st_astext(geom) from freguesias_4326;

select * from freguesias_3763 where concelho like '%COIMBRA%';

