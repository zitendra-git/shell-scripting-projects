#!/bin/bash

# Monitoring and Alerting Script
# This script monitors CPU, memory, disk usage, and network connectivity and sends alerts if thresholds are exceeded.
# Author: Jitendra kumar

# Configuration
CPU_THRESHOLD=80          # CPU usage threshold in percentage
MEMORY_THRESHOLD=80       # Memory usage threshold in percentage
DISK_THRESHOLD=80         # Disk usage threshold in percentage
LOG_FILE="/var/log/system-monitor.log"  # Log file for monitoring
ALERT_EMAIL="admin@example.com"  # Email address for alerts

# Function to log and send an alert
send_alert() {
    local message="$1"
    echo "$(date): $message" | tee -a "$LOG_FILE"
    echo "$message" | mail -s "System Alert: $(hostname)" "$ALERT_EMAIL"
}

# Function to check CPU usage
check_cpu() {
    local cpu_usage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
        send_alert "High CPU Usage: ${cpu_usage}% (Threshold: ${CPU_THRESHOLD}%)"
    fi
}

# Function to check memory usage
check_memory() {
    local memory_usage
    memory_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
    if (( memory_usage > MEMORY_THRESHOLD )); then
        send_alert "High Memory Usage: ${memory_usage}% (Threshold: ${MEMORY_THRESHOLD}%)"
    fi
}

# Function to check disk usage
check_disk() {
    local disk_usage
    disk_usage=$(df / | awk 'END{print $5}' | sed 's/%//')
    if (( disk_usage > DISK_THRESHOLD )); then
        send_alert "High Disk Usage: ${disk_usage}% (Threshold: ${DISK_THRESHOLD}%)"
    fi
}

# Function to check network connectivity
check_network() {
    local latency
    if ! ping -c 1 google.com &>/dev/null; then
        send_alert "Network Connectivity Issue: Unable to reach Google.com"
    else
        latency=$(ping -c 1 google.com | grep 'time=' | awk -F'=' '{print $4}')
        echo "$(date): Network is healthy, latency: $latency ms" >> "$LOG_FILE"
    fi
}

# Main script execution
echo "Starting System Monitoring..." | tee -a "$LOG_FILE"
check_cpu
check_memory
check_disk
check_network
echo "Monitoring completed at $(date)" | tee -a "$LOG_FILE"

