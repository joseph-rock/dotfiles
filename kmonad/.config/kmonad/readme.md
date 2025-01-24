### Copy mykeymap.service to /etc/systemd/system/
`cp ./mykeymap.service /etc/systemd/system/`

### Reload systemd
`sudo systemctl daemon-reload`

### Start the mykeymap service
`sudo systemctl start mykeymap`

### Enable the mykeymap service to start on boot
`sudo systemctl enable mykeymap`

### Check the status of your service
`sudo systemctl status mykeymap`
