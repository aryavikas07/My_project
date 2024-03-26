
To increase the connection timeout to 5 hours (which is 18000 seconds), you can modify the ClientAliveInterval parameter to send a "keepalive" message every 18000 seconds and set ClientAliveCountMax to 0 to indicate no limit on consecutive failed messages. Here's the modified script:

bash
Copy code
#!/bin/bash

# Update SSH configuration to increase connection timeout to 5 hours
echo "Updating SSH configuration..."
sudo sed -i '/^#ClientAliveInterval/s/^#//' /etc/ssh/sshd_config
sudo sed -i '/^#ClientAliveCountMax/s/^#//' /etc/ssh/sshd_config
sudo sed -i 's/.*ClientAliveInterval.*/ClientAliveInterval 18000/' /etc/ssh/sshd_config
sudo sed -i 's/.*ClientAliveCountMax.*/ClientAliveCountMax 0/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Verify the changes
echo "SSH configuration updated."
echo "New SSH configuration:"
grep -E '^ClientAliveInterval|^ClientAliveCountMax' /etc/ssh/sshd_config
