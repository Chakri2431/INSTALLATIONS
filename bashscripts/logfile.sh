#!/bin/bash

# Variables
LOG_FILE="/path/to/logfile.log"
ERROR_PATTERN="ERROR"
OUTPUT_FILE="error_summary.txt"

# Check if log file exists
if [ ! -f $LOG_FILE ]; then
    echo "Log file not found!"
    exit 1
fi

# Extract and count error occurrences
grep "$ERROR_PATTERN" $LOG_FILE > $OUTPUT_FILE
ERROR_COUNT=$(grep -c "$ERROR_PATTERN" $LOG_FILE)

# Print summary
echo "Error occurrences: $ERROR_COUNT"
echo "Detailed error log saved to $OUTPUT_FILE"

