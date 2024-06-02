#!/bin/bash

# SSH yapılandırma dosyasını yedekle
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup

# SSH yapılandırma dosyasını düzenle
sudo sed -i 's/^Port [0-9]*$/Port 2222/' /etc/ssh/sshd_config

# SSH servisini yeniden başlat
sudo systemctl restart ssh
