###
###
### Prometheus 
### https://github.com/prometheus/prometheus/releases/download/v2.34.0/
###
###

# Download Metric Exporter
wget https://github.com/prometheus/prometheus/releases/download/v2.34.0/prometheus-2.34.0.linux-armv6.tar.gz
tar -xvzf prometheus-2.34.0.linux-armv6.tar.gz

# Move it to a proper location
sudo cp prometheus-2.34.0.linux-armv6/prometheus /usr/local/bin

# Make executable and create user with needed permissions
sudo chmod +x /usr/local/bin/prometheus
sudo useradd -m -s /bin/bash prometheus
sudo mkdir /var/lib/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus

# Service file
wget https://raw.githubusercontent.com/DmitryPustovit/auto-setup/master/RaspberryPi_OS/prometheus/prometheus.service
sudo cp prometheus.service /etc/systemd/system/prometheus.service

# Reload systemd
sudo systemctl daemon-reload 
sudo systemctl enable prometheus.service
sudo systemctl start prometheus.service

# Sanity check 
systemctl status prometheus