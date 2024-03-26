#!/bin/bash

# Update SSH configuration to increase connection timeout
echo "Updating SSH configuration..."
sudo sed -i '/^#ClientAliveInterval/s/^#//' /etc/ssh/sshd_config
sudo sed -i '/^#ClientAliveCountMax/s/^#//' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Verify the changes
echo "SSH configuration updated."
echo "New SSH configuration:"
grep -E '^ClientAliveInterval|^ClientAliveCountMax' /etc/ssh/sshd_config
