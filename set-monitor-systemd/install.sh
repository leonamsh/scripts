sudo cp /run/media/development/scripts/set-monitor-systemd/set-monitor.sh /usr/local/bin/
sudo cp /run/media/development/scripts/set-monitor-systemd/set-monitor.service /etc/systemd/system/
sudo systemctl enable set-monitor.service
