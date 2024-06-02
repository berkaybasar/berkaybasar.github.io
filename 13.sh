#!/bin/bash

# SSH ayarlarını sıfırlamak için gerekli olan komutlar

# SSH konfigürasyon dosyasını yedekle
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup

# SSH konfigürasyon dosyasını temizle
echo "# SSH Default Configuration" > /etc/ssh/sshd_config
echo "Port 22" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config
echo "UsePAM yes" >> /etc/ssh/sshd_config
echo "X11Forwarding yes" >> /etc/ssh/sshd_config
echo "PrintMotd no" >> /etc/ssh/sshd_config
echo "AcceptEnv LANG LC_*" >> /etc/ssh/sshd_config
echo "Subsystem       sftp    /usr/lib/openssh/sftp-server" >> /etc/ssh/sshd_config

# SSH servisini yeniden başlat
systemctl restart ssh

echo "SSH ayarları başarıyla sıfırlandı ve 22 numaralı porttan giriş yapılacak."
