###
###
### Prometheus SNMP Exporter
### https://github.com/prometheus/snmp_exporter/releases/tag/v0.20.0
###
###

# Download Metric Exporter
wget https://github.com/prometheus/snmp_exporter/releases/download/v0.20.0/snmp_exporter-0.20.0.linux-armv6.tar.gz
tar -xvzf snmp_exporter-0.20.0.linux-armv6.tar.gz

# Move it to a proper location
sudo cp snmp_exporter-0.20.0.linux-armv6/snmp_exporter /usr/local/bin

# Make executable and create user with needed permissions
sudo chmod +x /usr/local/bin/snmp_exporter
sudo useradd -m -s /bin/bash snmp_exporter
sudo mkdir /var/lib/snmp_exporter
sudo chown -R snmp_exporter:snmp_exporter /var/lib/snmp_exporter

# Reload systemd
wget https://raw.githubusercontent.com/prometheus/snmp_exporter/main/examples/systemd/snmp_exporter.service
sudo cp snmp_exporter.service /etc/systemd/system/snmp_exporter.service

# Reload systemd
sudo systemctl daemon-reload 
sudo systemctl enable snmp_exporter.service
sudo systemctl start snmp_exporter.service

# Sanity check 
systemctl status snmp_exporter