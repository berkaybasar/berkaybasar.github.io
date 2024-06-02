#!/bin/bash

# FileZilla sunucusunu kurma
sudo apt-get update
sudo apt-get install filezilla -y

# FileZilla kullanıcı hesabı oluşturma
echo "Oluşturmak istediğiniz kullanıcı adını girin:"
read username
sudo adduser $username

# FileZilla'nın çalışacağı dizini oluşturma ve izinleri ayarlama
sudo mkdir -p /srv/ftp/$username
sudo chown nobody:nogroup /srv/ftp/$username
sudo chmod a-w /srv/ftp/$username
sudo mkdir /srv/ftp/$username/files
sudo chown $username:$username /srv/ftp/$username/files

# FileZilla konfigürasyon dosyasını düzenleme
sudo cp /etc/filezilla/filezilla.xml /etc/filezilla/filezilla.xml_backup
sudo sed -i "s|</FileZillaServer>|  <User Name=\"$username\">\n    <Option Name=\"Pass\">"Bky1337"</Option>\n    <Option Name=\"Group\"></Option>\n    <Option Name=\"Bypass server userlimit\">0</Option>\n    <Option Name=\"User Limit\">0</Option>\n    <Option Name=\"IP Limit\">0</Option>\n    <Option Name=\"Enabled\">1</Option>\n    <Option Name=\"Comments\"></Option>\n    <Option Name=\"ForceSsl\">0</Option>\n    <IpFilter>\n      <Disallowed />\n      <Allowed />\n    </IpFilter>\n    <Permissions>\n      <Permission Dir=\"/srv/ftp/$username\">0</Permission>\n      <Permission Dir=\"/srv/ftp/$username/files\">7</Permission>\n    </Permissions>\n  </User>\n</FileZillaServer>|" /etc/filezilla/filezilla.xml

# FileZilla servisini yeniden başlatma
sudo systemctl restart filezilla
