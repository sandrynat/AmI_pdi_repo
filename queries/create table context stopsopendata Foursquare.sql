create table context_dataset_stops_foursquare
SELECT  t2.posicao_google as poi,ST_Distance(t1.posicao_google, t2.posicao_google) AS distance, t2.category,t2.country, t1.*
FROM context_dataset_stopsopendata t1
CROSS JOIN LATERAL (
    SELECT *
    FROM foursquare_pois t2
    ORDER BY t1.posicao_google <-> t2.posicao_google
    LIMIT 1
) t2
WHERE ST_DWithin(t1.posicao_google, t2.posicao_google, 5);