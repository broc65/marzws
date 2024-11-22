#!/bin/bash

# Menghapus folder .acme.sh
rm -rf ~/.acme.sh

# Mematikan layanan Docker Marzban
cd /opt/marzban && docker compose down

# Kembali ke home directory
cd

# Konfigurasi domain
DOMAIN1=$(cat /etc/data/domain1)
DOMAIN2=$(cat /etc/data/domain2)
EMAIL=$(cat /etc/data/email)

# Menginstal acme.sh
curl https://get.acme.sh | sh -s email=$EMAIL

# Atur Let's Encrypt sebagai server CA default
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt

# Mendaftarkan akun dan menerbitkan sertifikat untuk domain pertama
/root/.acme.sh/acme.sh --register-account -m "$EMAIL"
/root/.acme.sh/acme.sh --issue -d "$DOMAIN1" --standalone -k ec-256

# Memasang sertifikat untuk domain pertama
~/.acme.sh/acme.sh --installcert -d "$DOMAIN1" \
  --fullchainpath /var/lib/marzban/certs/domain1/xray.crt \
  --keypath /var/lib/marzban/certs/domain1/xray.key --ecc

# Mendaftarkan akun dan menerbitkan sertifikat untuk domain kedua
/root/.acme.sh/acme.sh --issue -d "$DOMAIN2" --standalone -k ec-256

# Memasang sertifikat untuk domain kedua
~/.acme.sh/acme.sh --installcert -d "$DOMAIN2" \
  --fullchainpath /var/lib/marzban/certs/domain2/xray.crt \
  --keypath /var/lib/marzban/certs/domain2/xray.key --ecc

# Menghidupkan kembali layanan Docker Marzban
cd /opt/marzban && docker compose up -d

# Kembali ke home directory
cd
