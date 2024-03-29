###
###
### Prometheus Node Exporter
### https://github.com/prometheus/node_exporter/releases/tag/v1.0.1
###
###

# Download Metric Exporter
# CPUTYPES:
# PI 4 
#   armv7
# Pi B+
# Pi Zero
# Pi Zero W
#   armv6
CPUTYPE=armv7
VERSION=1.3.1

wget https://github.com/prometheus/node_exporter/releases/download/v$VERSION/node_exporter-$VERSION.linux-$CPUTYPE.tar.gz 
tar -xvzf node_exporter-$VERSION.linux-$CPUTYPE.tar.gz

# Move it to a proper location
sudo cp node_exporter-$VERSION.linux-$CPUTYPE/node_exporter /usr/local/bin

# Make executable and create user with needed permissions
sudo chmod +x /usr/local/bin/node_exporter
sudo useradd -m -s /bin/bash node_exporter
sudo mkdir /var/lib/node_exporter
sudo chown -R node_exporter:node_exporter /var/lib/node_exporter

# Service file
wget https://raw.githubusercontent.com/DmitryPustovit/auto-setup/master/RaspberryPi_OS/node_exporter/node_exporter.service
sudo cp node_exporter.service /etc/systemd/system/node_exporter.service

# Reload systemd
sudo systemctl daemon-reload 
sudo systemctl enable node_exporter.service
sudo systemctl start node_exporter.service

# Sanity check 
systemctl status node_exporter
curl http://localhost:9100/metrics