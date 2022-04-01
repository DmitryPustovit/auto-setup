###
###
### Prometheus PushGateway
### https://github.com/prometheus/pushgateway/releases/tag/v1.4.2
###
###

# Download Metric Exporter
wget https://github.com/prometheus/pushgateway/releases/tag/v1.4.2/pushgateway-1.4.2.linux-armv6.tar.gz
tar -xvzf pushgateway-1.4.2.linux-armv6.tar.gz

# Move it to a proper location
sudo cp pushgateway-1.4.2.linux-armv6/pushgateway /usr/local/bin

# Make executable and create user with needed permissions
sudo chmod +x /usr/local/bin/pushgateway
sudo useradd -m -s /bin/bash pushgateway
sudo mkdir /var/lib/pushgateway
sudo chown -R pushgateway:pushgateway /var/lib/pushgateway

# Service file
wget https://raw.githubusercontent.com/DmitryPustovit/auto-setup/master/RaspberryPi_OS/pushgateway/pushgateway.service
sudo cp pushgateway.service /etc/systemd/system/pushgateway.service

# Reload systemd
sudo systemctl daemon-reload 
sudo systemctl enable pushgateway.service
sudo systemctl start pushgateway.service

# Sanity check 
systemctl status pushgateway