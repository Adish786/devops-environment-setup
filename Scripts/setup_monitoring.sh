#!/bin/bash
# Task 1: Setup Monitoring

LOG_DIR="/var/log/monitoring"
mkdir -p $LOG_DIR

DATE=$(date +%F)
LOG_FILE="$LOG_DIR/system_metrics_$DATE.log"

# Install tools
sudo yum install -y htop nmon > /dev/null 2>&1

# Log system stats
echo "==== System Metrics on $(date) ====" >> $LOG_FILE
echo "--- CPU/Memory/Process Usage (top 5) ---" >> $LOG_FILE
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10 >> $LOG_FILE

echo "--- Disk Usage ---" >> $LOG_FILE
df -h >> $LOG_FILE

echo "--- Directory Usage (/var/www/html if exists) ---" >> $LOG_FILE
du -sh /var/www/html 2>/dev/null || echo "No /var/www/html" >> $LOG_FILE
