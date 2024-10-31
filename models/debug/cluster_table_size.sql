{{
    config(
        materialized='view'
    )
}}

SELECT 
    database, 
    table, 
    sum(bytes) AS total_bytes,
    formatReadableSize(sum(bytes)) AS total_size
FROM system.parts
WHERE active = 1
GROUP BY database, table
ORDER BY total_bytes DESC