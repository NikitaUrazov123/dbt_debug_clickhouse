SELECT distinct
    --query_id,
    --event_time,
    --query,
    extract(query, '(model\.clickhouse.*?)"') AS dbt_model_name,
    arrayJoin(tables) AS table
FROM system.query_log
WHERE type = 'QueryFinish'  -- Фильтруем завершенные запросы
and has(`databases`, 'dbt_test') = 1
    AND event_time >= (now() - INTERVAL 1 HOUR)
ORDER BY event_time DESC