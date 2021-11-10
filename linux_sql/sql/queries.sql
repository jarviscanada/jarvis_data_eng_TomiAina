--Group hosts by hardware info
SELECT cpu_number,id, total_mem
FROM host_info
GROUP BY id
ORDER BY total_mem



--Average memory usage
SELECT
       host_info.id,
       host_info.hostname,
       avg(host_info.total_mem - host_usage.memory_free) as avg_used_mem,
       (date_trunc('hour', host_usage."timestamp") + date_part('minute',host_usage."timestamp")::int / 5 * interval '5 min') as timestamp_intv
FROM
     host_info
            INNER JOIN host_usage
                ON host_usage.host_id = host_info.id
GROUP BY timestamp_intv, id;