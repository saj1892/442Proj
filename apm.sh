# APM 1: bandwidth_hog.c
# ping -c 1 -s %d %s
# -c count: stop pinging after this number is reached
# -s packet size: number of bytes to be sent; between 16000 and 64000
# 1 second pause between pings

# APM 2: bandwidth_hog_burst.c
# packet size between 50000 and 64000
# sends a burst every 45 seconds

# APM 3: cpu_hog.c
# Infinite loop

# APM 4: disk_hog.c
# Writes to a tmp file

# APM 5: memory_hog.c
# Allocates memory and then frees it

# APM 6: memory_hog_leak.c
# Allocates memory without freeing it