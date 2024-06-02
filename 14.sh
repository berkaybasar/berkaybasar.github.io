#!/bin/bash

# iptables ile 22 numaralı portu açma
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# iptables kurallarını kalıcı hale getirme
iptables-save > /etc/iptables/rules.v4

# ufw ile 22 numaralı portu açma
ufw allow 22

# SSH servisini yeniden başlatma
systemctl restart ssh

echo "22 numaralı port bağlantılara açıldı."
