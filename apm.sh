#! /usr/bin/env bash
#ps aux | grep -v "grep" | grep "$process"
#main function that loops every 5sec
allFiles=(APM1 APM2 APM3 APM4 APM5 APM6)
function globalLoop {
    spawnprocesses 
    while [ 1 ]
    do
        for process in ${allFiles[@]}; do
            statsCollection $process
        done
        sleep 5s
    done
    TedBundy
}
#function that starts all processes
function spawnprocesses {
    for process in ${allFiles[@]}; do
        ./( $process )
    done
}
#function that kills everything
function TedBundy {
    cleanup
}
function cleanup {
    for process in ${allFiles[@]}; do
        PID=(ps aux | grep -v "grep" | grep $process | sed 's/+{ }/,/g' | cut -d ',' -f 1)
        kill $PID
    done
}
#function that collects data
#system_metrics.csv <seconds>, <RX data rate>, <TX data rate>, <disk writes>, <available disk capacity>
function statsCollection {
    touch system_metrics.csv
    ps aux | grep -v "grep" | grep "$process"
}

#function that gets the memory and cpu information for a specific process

function 

# ***** GOALS OF THIS SCRIPT ******
# 1.Collect process and system level metrics every 5 seconds
# 2.Collect %CPU and %memory utilization per process using the ps tool
# 3.Collect network bandwidth utilization in terms of RX data rate and TX data rate (kB/s) on the "ens<ID>" interface using the ifstat tool
# Note that ip add will show interface names and the IP address of the computer
# ip route will show the gateway IP
# 4.Collect hard disk writes in kB/second to the primary hard drive using the iostat tool
# Traditionally, the primary hard drive is "sda" (SCSI Disk A"). On Rocky Linux, it's "mapper/rl-root"
# 5.Collect hard disk utilization of the "/" mount in MB available using the df tool
# 6.Output all CPU and memory metrics to a CSV file specific to the process they were measured from. Name the files <proc_name>_metrics.csv
# The format of the process specific output files shall be: <seconds>, <%CPU>, <%memory>
# 7.Write all system level metrics to a file called system_metrics.csv
# The format of the system level output file shall be: <seconds>, <RX data rate>, <TX data rate>, <disk writes>, <available disk capacity>
# 8.Spawn all application processes
# 9.Kill all application processes and any other processes it spawns in an exit trap function called "cleanup"
# 10.Minimally include functions to:
# spawn applications and other processes
# collect process level metrics, and
# collect system level metrics


# ***** C SCRIPTS AND WHAT THEY DO ******
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






#requirements

#function that takes the cpu and memory numbers from the ps every 5 secs and then cats them to a file in this format

# Time	APM 1 CPU	APM 1 Memory	APM 2 CPU	APM 2 Memory	APM 3 CPU	APM 3 Memory	APM 4 CPU	APM 4 Memory	APM 5 CPU	APM 5 Memory	APM 6 CPU	APM 6 Memory
