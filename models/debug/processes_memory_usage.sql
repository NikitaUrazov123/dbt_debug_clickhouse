SELECT 
    query_id,
    user,
    address,
    query,
    elapsed AS duration,
    memory_usage, read_bytes, written_bytes, peak_memory_usage,
    formatReadableSize(memory_usage) AS format_memory_used,
    formatReadableSize(read_bytes) AS format_read_bytes,
    formatReadableSize(written_bytes) AS format_written_bytes,
    formatReadableSize(peak_memory_usage) AS format_peak_memory_usage
FROM system.processes
where query not like '%system.processes%'
ORDER BY memory_usage DESC