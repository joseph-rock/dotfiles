# Copy mykeymap.service to /etc/systemd/system/
cp ~/.config/kmonad/mykeymap.service /etc/systemd/system/

# Reload systemd
sudo systemctl daemon-reload

# Start the keyboard_mylaptop service
sudo systemctl start mykeymap

# Enable the keyboard_mylaptop service to start on boot
sudo systemctl enable mykeymap

# Check the status of your service
sudo systemctl status mykeymap 
