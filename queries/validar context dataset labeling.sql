SELECT time_t,trajectory_id,posicao_pt,label, activity_label,* 
FROM public.context_dataset_stage where uid=2 and time_t>='2018-05-10 00:40:40' order by time_t asc;


SELECT time_t,trajectory_id,posicao_pt,label, activity_label,* FROM public.context_dataset_stage where uid=1 and time_t>='2018-03-20 02:41:49' order by time_t asc;
