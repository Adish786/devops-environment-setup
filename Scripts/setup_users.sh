#!/bin/bash
# Task 2: User Management

# Create users with secure passwords
sudo useradd -m sarah
echo "Sarah@123" | sudo passwd --stdin sarah

sudo useradd -m mike
echo "Mike@1234" | sudo passwd --stdin mike

# Setup isolated directories
mkdir -p /home/sarah/workspace
mkdir -p /home/mike/workspace

chown sarah:sarah /home/sarah/workspace
chown mike:mike /home/mike/workspace

chmod 700 /home/sarah/workspace
chmod 700 /home/mike/workspace

# Enforce password policy
sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   30/' /etc/login.defs
sed -i 's/^PASS_MIN_LEN.*/PASS_MIN_LEN    8/' /etc/login.defs
