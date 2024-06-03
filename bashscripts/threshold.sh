#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90
EMAIL="admin@example.com"

# Get current usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check CPU usage
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" |bc -l) )); then
    echo "CPU usage is above threshold: $CPU_USAGE%" | mail -s "CPU Alert" $EMAIL
fi

# Check memory usage
if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" |bc -l) )); then
    echo "Memory usage is above threshold: $MEM_USAGE%" | mail -s "Memory Alert" $EMAIL
fi

# Check disk usage
if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
    echo "Disk usage is above threshold: $DISK_USAGE%" | mail -s "Disk Alert" $EMAIL
fi

# Print status
echo "CPU Usage: $CPU_USAGE%"
echo "Memory Usage: $MEM_USAGE%"
echo "Disk Usage: $DISK_USAGE%"

