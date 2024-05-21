--miliseconds
select TO_TIMESTAMP(time/1000) as date_time, MOD(time, 1000) as miliseconds from context_dataset limit 5;

--nanoseconds
select TO_TIMESTAMP(time/1000000000) as date_time, MOD(time, 1000) as miliseconds from context_dataset limit 5;

select DATE_TRUNC('HOUR', date_time) as hour, count(*) from (
select TO_TIMESTAMP(time/1000) as date_time from context_dataset
limit 100) AS DerivedTable
group by hour order by hour;


select DATE_TRUNC('HOUR', date_time) as hour, count(*) from (
select TO_TIMESTAMP(time/1000000000) as date_time from context_dataset
limit 100) AS DerivedTable
group by hour order by hour;

SELECT DATE_BIN('15 minutes', date_time, TIMESTAMP '2001-01-01') as ten, count(*),average(sensor), user_x from (
select TO_TIMESTAMP(time/1000) as date_time, sensor, user_x from context_dataset) AS DerivedTable
group by ten,user_x order by ten;



select distinct(user_x) from context_dataset;

SELECT DATE_BIN('10 minutes', date_time, TIMESTAMP '2001-01-01') as ten, count(*) from (
select TO_TIMESTAMP(time/1000000000) as date_time from sensor_logger_location
limit 100) AS DerivedTable
group by ten order by ten;