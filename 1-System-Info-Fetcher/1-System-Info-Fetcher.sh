#!/bin/bash

# Script: System Info Fetcher
# Description: Displays detailed system information including CPU, memory, disk, and network details.
# Author: Jitendra kumar

# Function to fetch and display system information
fetch_system_info() {
  echo "======================================="
  echo "        SYSTEM INFORMATION             "
  echo "======================================="
  
  # Hostname
  echo "Hostname: $(hostname)"
  
  # OS and Kernel
  echo "Operating System: $(uname -o)"
  echo "Kernel Version: $(uname -r)"
  
  # Uptime
  echo "System Uptime: $(uptime -p)"
  
  # Date and Time
  echo "Current Date & Time: $(date)"
  
  echo ""
}

# Function to fetch CPU information
fetch_cpu_info() {
  echo "======================================="
  echo "          CPU INFORMATION              "
  echo "======================================="
  
  # CPU Model and Cores
  echo "CPU Model: $(lscpu | grep 'Model name:' | sed 's/Model name:\s*//')"
  echo "CPU Cores: $(lscpu | grep '^CPU(s):' | awk '{print $2}')"
  
  # CPU Usage
  echo "CPU Usage: $(top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}')%"

  echo ""
}

# Function to fetch memory information
fetch_memory_info() {
  echo "======================================="
  echo "         MEMORY INFORMATION            "
  echo "======================================="
  
  # Total, Used, Free Memory
  free -h | awk 'NR==2{printf "Total Memory: %s\nUsed Memory: %s\nFree Memory: %s\n", $2, $3, $4}'
  
  echo ""
}

# Function to fetch disk usage information
fetch_disk_info() {
  echo "======================================="
  echo "          DISK INFORMATION             "
  echo "======================================="
  
  # Disk Usage
  df -h --total | awk 'END{printf "Total Disk Space: %s\nUsed Disk Space: %s\nAvailable Disk Space: %s\n", $2, $3, $4}'

  echo ""
}

# Function to fetch network information
fetch_network_info() {
  echo "======================================="
  echo "        NETWORK INFORMATION            "
  echo "======================================="
  
  # IP Address
  echo "IP Address: $(hostname -I | awk '{print $1}')"
  
  # Gateway
  echo "Default Gateway: $(ip route | grep default | awk '{print $3}')"
  
  # Ping to Google
  echo "Network Latency to Google: $(ping -c 1 google.com | grep 'time=' | awk -F'=' '{print $4}')"

  echo ""
}

# Main script execution
fetch_system_info
fetch_cpu_info
fetch_memory_info
fetch_disk_info
fetch_network_info

echo "System information fetched successfully!"

