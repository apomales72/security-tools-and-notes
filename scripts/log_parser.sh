#!/bin/bash

LOG_FILE="/var/log/messages"

if [ -z "$1" ]; then
  echo "Usage: $0 'MMM dd'"
  echo "Example: $0 'Aug 10'"
  exit 1
fi

DATE_FILTER="$1"
OUTPUT_FILE="messages_errors_${DATE_FILTER// /_}_$(date +%Y%m%d_%H%M%S).txt"

echo "Filtering errors from $LOG_FILE on date: $DATE_FILTER"
echo ""

# Grep lines starting with the date filter and containing 'error' (case-insensitive)
grep "^$DATE_FILTER" "$LOG_FILE" | grep -i 'error' > "$OUTPUT_FILE"

ERROR_COUNT=$(wc -l < "$OUTPUT_FILE")

echo "Found $ERROR_COUNT error(s) on $DATE_FILTER."
echo "Results saved in $OUTPUT_FILE"


# How to run it

# chmod +x log_parser.sh
# sudo ./log_parser.sh "Aug 10"  --> replace with today's date

# Notes
# The date format must match how dates appear in your syslog. 
# The date format for the /var/log/syslog in CentOS typically follows the low-precision format, which is "MMM dd HH:mm:ss" (e.g., "Aug 10 14:30:00"). 
# This format is designed for readability and does not include the year.

# Error Message Locations in Red Hat/CentOS

# Red Hat/CentOS saves error messages in specific log files located in the /var/log directory. Here are the main log files where you can find error messages:
# Common Log Files
# Log File	Description
# /var/log/messages	Contains general system activity and error messages.
# /var/log/secure	Logs security-related events, including authentication.
# /var/log/syslog	Stores global system activity data (Debian-based systems).
# /var/log/auth.log	Records authentication attempts and security events (Debian-based systems).
# /var/log/cron	Logs cron job activities and errors.
# /var/log/httpd/error_log	Contains error messages from the Apache web server (if installed).
# Viewing Log Files

# To view these log files, you can use commands like:

# cat /var/log/messages to display the entire log.
# tail -n 100 /var/log/messages to see the last 100 lines.
# less /var/log/messages for a scrollable view.

