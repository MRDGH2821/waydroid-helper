#!/bin/bash

# Mount handler script for Waydroid
# This script enables and starts waydroid monitoring and mounting services
# Also provides option to restart services

# Function to enable and start services
enable_start_services() {
    echo "Enabling and starting waydroid-monitor service for current user..."
    systemctl --user enable --now waydroid-monitor.service

    echo "Enabling and starting waydroid-mount service system-wide..."
    sudo systemctl enable --now waydroid-mount.service

    echo "Done! The waydroid monitoring and mounting services have been enabled and started."
}

# Function to restart services
restart_services() {
    echo "Restarting waydroid-monitor service for current user..."
    systemctl --user restart waydroid-monitor.service

    echo "Restarting waydroid-mount service system-wide..."
    sudo systemctl restart waydroid-mount.service

    echo "Done! The waydroid monitoring and mounting services have been restarted."
}

# Check for command line arguments
if [[ "$1" = "--restart" ]] || [[ "$1" = "-r" ]]; then
    restart_services
else
    enable_start_services
fi
