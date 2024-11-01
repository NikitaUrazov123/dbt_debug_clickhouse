SELECT
    query_id,
    event_time,
    query,
    extract(query, '(model\.clickhouse.*?)"') AS dbt_model_name,
    toInt64(memory_usage) as memory_usage,
    toInt64(read_bytes) AS read_bytes,
    toInt64(written_bytes) AS written_bytes,
    formatReadableSize(memory_usage) AS format_memory_usage,
    formatReadableSize(read_bytes) AS format_read_bytes,
    formatReadableSize(written_bytes) AS format_written_bytes,
    query_duration_ms
FROM system.query_log
WHERE type = 'QueryFinish'  -- Фильтруем завершенные запросы
and has(`databases`, 'dbt_test') = 1
    AND event_time >= (now() - INTERVAL 1 HOUR)
ORDER BY event_time DESC
