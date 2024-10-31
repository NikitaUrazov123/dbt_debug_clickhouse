SELECT 
    database, 
    table, 
    sum(bytes) AS total_bytes,
    formatReadableSize(sum(bytes)) AS total_size
FROM system.parts
WHERE active = 1
AND table = 'trace_log'
GROUP BY database, table
