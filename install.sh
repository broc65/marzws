#!/bin/bash
#input data
mkdir -p /etc/data
read -rp "Masukkan Domain: " domain
echo "$domain" > /etc/data/domain
read -rp "Masukkan ChatID: " chatid
echo "$chatid" > /etc/data/chatid
read -rp "Masukkan GroupID: " groupid
echo "$groupid" > /etc/data/groupid
read -rp "Masukkan ThreadID: " threadid
echo "$threadid" > /etc/data/threadid
read -rp "Masukkan TokenBot: " token
echo "$token" > /etc/data/token
read -rp "Masukkan Email anda: " email
echo "$email" > /etc/data/email

#Preparation
clear
cd;
apt-get update;

#Remove unused Module
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove bind9*;

#install bbr
echo 'fs.file-max = 500000
net.core.rmem_max = 67108864
net.core.wmem_max = 67108864
net.core.netdev_max_backlog = 250000
net.core.somaxconn = 4096
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.ip_local_port_range = 10000 65000
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_mem = 25600 51200 102400
net.ipv4.tcp_rmem = 4096 87380 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.core.rmem_max=4000000
net.ipv4.tcp_mtu_probing = 1
net.ipv4.ip_forward=1
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1' >> /etc/sysctl.conf
sysctl -p;

#install toolkit
apt-get install libio-socket-inet6-perl libsocket6-perl libcrypt-ssleay-perl libnet-libidn-perl perl libio-socket-ssl-perl libwww-perl libpcre3 libpcre3-dev zlib1g-dev dbus iftop zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr dnsutils sudo at htop iptables bsdmainutils cron lsof lnav -y

#Set Timezone GMT+7
timedatectl set-timezone Asia/Jakarta;

#Install Marzban
sudo bash -c "$(curl -sL https://github.com/broc65/Marzban-scripts/raw/master/marzban.sh)" @ install

#install env
wget -O /opt/marzban/.env "https://raw.githubusercontent.com/broc65/marzws/main/env"

#install latest xray
mkdir -p /var/lib/marzban/xray-core && cd /var/lib/marzban/xray-core
wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip Xray-linux-64.zip && rm Xray-linux-64.zip LICENSE README.md *.dat
cd

#update-geo
mkdir -p /var/lib/marzban/assets
wget -O /var/lib/marzban/assets/geosite.dat "https://github.com/rfxcll/v2ray-rules-dat/releases/latest/download/GeoSite.dat"
wget -O /var/lib/marzban/assets/geoip.dat "https://github.com/rfxcll/v2ray-rules-dat/releases/latest/download/GeoIP.dat"

wget -O /usr/bin/update-geo "https://github.com/broc65/marzws/raw/main/updategeo"
chmod +x /usr/bin/update-geo

#profile
apt install neofetch -y
cat > /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
neofetch --ascii_distro Arcolinux_small
END

#cek-service
wget -O /usr/bin/cek-service "https://raw.githubusercontent.com/broc65/marzws/main/cek-service"
chmod +x /usr/bin/cek-service

#install compose
wget -O /opt/marzban/docker-compose.yml "https://raw.githubusercontent.com/broc65/marzws/main/docker-compose.yml"

#install subcription
wget -O /opt/marzban/index.html "https://raw.githubusercontent.com/broc65/marzws/main/index.html"

#install clear log
wget -O /usr/bin/clear-log "https://github.com/broc65/marzws/raw/main/clear-log"
chmod +x /usr/bin/clear-log

#install auto backup
wget -O /usr/bin/backup "https://github.com/broc65/marzws/raw/main/backup"
chmod +x /usr/bin/backup

#install cek-ip
wget -O /usr/bin/cek-login "https://github.com/broc65/marzws/raw/main/cek-login"
chmod +x /usr/bin/cek-login

#crontab
crontab -l > mycron

echo "*/2 * * * * echo -n > /var/lib/marzban/access.log" >> mycron
echo "*/2 * * * * echo -n > /var/log/nginx/access.log" >> mycron
echo "#*/13 * * * * /usr/bin/cek-login" >> mycron
echo "5 0 * * * /usr/bin/clear-log" >> mycron
echo "21 3 * * * /usr/bin/backup" >> mycron
crontab mycron
rm mycron

#Install VNSTAT
apt install vnstat -y

#Install Speedtest
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install speedtest -y

#install nginx
mkdir -p /var/log/nginx
touch /var/log/nginx/access.log
touch /var/log/nginx/error.log
wget -O /opt/marzban/nginx.conf "https://raw.githubusercontent.com/broc65/marzws/main/nginx.conf"
wget -O /opt/marzban/default.conf "https://raw.githubusercontent.com/broc65/marzws/main/vps.conf"
wget -O /opt/marzban/xray.conf "https://raw.githubusercontent.com/broc65/marzws/main/xray.conf"
mkdir -p /var/www/html
wget -O /var/www/html/index.html "https://raw.githubusercontent.com/broc65/marzws/main/nginx.html"

#install socat
apt install iptables -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion -y

#install cert
domain=$(cat /etc/data/domain)
curl https://get.acme.sh | sh -s email=$email
mkdir -p /var/lib/marzban/certs
/root/.acme.sh/acme.sh --server letsencrypt --register-account -m $email --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /var/lib/marzban/certs/xray.crt --keypath /var/lib/marzban/certs/xray.key --ecc
wget -O /var/lib/marzban/xray_config.json "https://raw.githubusercontent.com/broc65/marzws/main/xray_config.json"

#install firewall
apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow 7879/tcp
sudo ufw allow 8081/tcp
yes | sudo ufw enable

#install database
wget -O /var/lib/marzban/db.sqlite3 "https://github.com/broc65/marzws/raw/main/db.sqlite3"

#update host marzban config
apt install sqlite3 -y

cd /var/lib/marzban

# Nama database
DB_NAME="db.sqlite3"

if [ ! -f "$DB_NAME" ]; then
  echo "Database $DB_NAME tidak ditemukan!"
  exit 1
fi

SQL_QUERY="UPDATE hosts SET address = '$domain' WHERE address = 'domain'; UPDATE hosts SET host = '$domain' WHERE host = 'domain'; UPDATE hosts SET sni = '$domain' WHERE sni = 'domain';"

sqlite3 "$DB_NAME" "$SQL_QUERY"

# Periksa apakah query berhasil dijalankan
if [ $? -eq 0 ]; then
  echo "Update berhasil dilakukan."
else
  echo "Gagal melakukan update."
fi

#swap ram 1gb
cd
wget https://raw.githubusercontent.com/Cretezy/Swap/master/swap.sh -O swap
sh swap 2G
rm swap

#finishing
apt autoremove -y
apt clean
cd /opt/marzban
docker compose down && docker compose up -d
cd
rm /root/install.sh
systemctl restart ufw

clear
echo ""
echo -e "\033[96m_______________________________\033[0m"
echo -e "\033[92m         INSTALL SUCCES\033[0m"
echo -e "\033[96m_______________________________\033[0m"
sleep 1.5
echo -e "\e[33;1m[ WARNING ] reboot now ? (Y/N)\e[0m"
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
cat /dev/null > ~/.bash_history && history -c && reboot
fi
