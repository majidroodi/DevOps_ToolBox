#!/bin/bash

# Check if Docker service is enabled
if systemctl is-enabled docker.service &> /dev/null; then
    echo "Docker service is enabled."
else
    echo "Docker service is disabled."
fi
