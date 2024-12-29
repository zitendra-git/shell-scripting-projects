# shell-scripting-projects
A collection of shell scripting projects focused on AWS event-driven automation.


## 1-System-Info-Fetcher

The System Info Fetcher is a shell script designed to display detailed system information, including:

 - System Information: Hostname, operating system, kernel version, uptime, and current date/time.
 - CPU Details: CPU model, core count, and real-time CPU usage percentage.
 - Memory Statistics: Total, used, and free memory.
 - Disk Usage: Total, used, and available disk space.
 - Network Information: IP address, default gateway, and network latency.
 
 Features :
   - Displays key system metrics in an organized and readable format.
   - Works on most Linux distributions with standard system tools.
   - Lightweight and easy to run on any system.
   - Logs all results to the console for quick inspection.



## 2-Monitoring-Alerting
This script monitors system resources (CPU, memory, disk usage, and network connectivity) and sends alerts via email when predefined thresholds are exceeded. 
The Monitoring and Alerting System is a shell script designed to monitor critical system resources and send email alerts if usage exceeds predefined thresholds. This ensures proactive management of system health and helps prevent potential issues before they escalate.

Features
- Monitors Critical Resources:
- CPU Usage
  - Memory Utilization
  - Disk Space Usage
  - Network Connectivity
- Real-Time Alerts:
  - Sends email notifications when thresholds are breached.
- Customizable Thresholds:
  - Define thresholds for CPU, memory, and disk usage.
- Centralized Logging:
  - Logs all monitoring activities for review and debugging.

Requirements
- A Linux-based system.
- Installed tools:
  - mailutils or mail (for email alerts)
  - ping, awk, and sed
- Internet connectivity for network monitoring and sending alerts.
