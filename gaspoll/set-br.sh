#!/bin/bash
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/ophaant/vps/main/gaspoll/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user admin@geolstore.net
from admin@geolstore.net
password AkbarSSH
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://raw.githubusercontent.com/ophaant/vps/main/gaspoll/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/ophaant/vps/main/gaspoll/backup.sh"
wget -O bckp "https://raw.githubusercontent.com/ophaant/vps/main/gaspoll/bckp.sh"
wget -O restore "https://raw.githubusercontent.com/ophaant/vps/main/gaspoll/restore.sh"
wget -O strt "https://raw.githubusercontent.com/ophaant/vps/main/gaspoll/strt.sh"
wget -O limit-speed "https://raw.githubusercontent.com/ophaant/vps/main/gaspoll/limit-speed.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x strt
chmod +x limit-speed
cd
rm -f /root/set-br.sh

