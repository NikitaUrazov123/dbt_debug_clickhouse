SELECT name, path, total_space, free_space, total_space-free_space as used_space
FROM system.disks