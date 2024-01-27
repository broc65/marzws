<h2 align="center">
<hr>
Chocolatos
</h2><hr>
  
<p align="center"><img src="https://img.shields.io/badge/Service-Multiport-blue"> <img src="https://img.shields.io/badge/Service-Multipath-blue"></p>

</p>
</div>

|  SERVICE | NETWORK PORT |
|---------------|---------------|
| VMess WS nTLS | 80 |
| VLess WS nTLS | 80 |
| TRojan WS nTLS | 80 |
| VMess WS TLS | 443 |
| VLess WS TLS | 443 |
| TRojan WS TLS | 443 |
| VMess gRPC | 443 |
| VLess gRPC | 443 |
| TRojan gRPC | 443 |

| SERVICE | WILDCARD PATH |
|---------------|---------------|
| VMess | bug.com/vmess-ws |
| VLess | bug.com/vless-ws |
| TRojan | bug.com/trojan-ws |

# Yang harus dipersiapkan
- VPS minimal 1 Core 1 GB ram
- root akses vps
- Domain yang sudah di pointing ke CloudFlare

# Sistem VM yang dapat digunakan
- Debian 10 </br>
- Debian 11 </br>
- Debian 12 </br>
- Ubuntu 20 </br>
- Ubuntu 22 </br>
- Ubuntu 23 </br>

# Instalasi
  ```html
 apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub && reboot
 ```
Pastikan anda sudah login sebagai root sebelum menjalankan perintah dibawah
 ```html
 wget https://raw.githubusercontent.com/broc65/marzws/main/install.sh && chmod +x install.sh && ./install.sh
 ```
 
Setelah instalasi berhasil, Panel login / Admin bisa ditambahkan dengan command
```html
marzban cli admin create --sudo
 ```
Buka panel Marzban dengan mengunjungi https://domainmu/dashboard <br>
Username dan Password default panel adalah :
- Username : admin
- Password : admin

Jika ingin mengubah konfigurasi env variable 
```html
nano /opt/marzban/.env
 ```
Perintah Restart service Marzban 
```html
marzban restart
 ```
Perintah Cek Logs service Marzban 
```html
marzban logs
 ```
Perintah Cek update service Marzban
```html
marzban update
 ```
Jangan lupa, setiap selesai instalasi diharapkan reboot server nya satu kali dengan memasukkan perintah dibawah
```html
cat /dev/null > ~/.bash_history && history -c && reboot
 ```

# Setting Host Panel Marzban 
Saat masuk panel, setting host pada bagian kanan atas. <br> 
![image](https://github.com/broc65/marzws/blob/main/set-host.png)
