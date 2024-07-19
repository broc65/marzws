<h2 align="center">
<hr>
Chocolatos
</h2><hr>
  
<p align="center"><img src="https://img.shields.io/badge/Service-fallback-blue"> <img src="https://img.shields.io/badge/Service-Multipath-blue"></p>

</p>
</div>

|  SERVICE | NETWORK PORT |
|---------------|---------------|
| VMess Websocket | 443, 80 |
| VLess Websocket | 443, 80 |
| Trojan Websocket | 443, 80 |
| VMess HttpUpgrade | 443, 80 |
| VLess HttpUpgrade | 443, 80 |
| Trojan HttpUpgrade | 443, 80 |
| VMess SplitHttp | 443, 80 |
| VLess SplitHttp | 443, 80 |
| Trojan SplitHttp | 443, 80 |
| VMess gRPC | 443 |
| VLess gRPC | 443 |
| TRojan gRPC | 443 |
| VMess TCP | 443 |
| VLess TCP | 443 |
| TRojan TCP | 443 |
| VLess TCP Reality| 443 |
| VLess gRPC Reality| 443 |

| SERVICE | DYNAMIC PATH |
|---------------|---------------|
| VMess WS | bug.com/vmess-ws |
| VMess HU | bug.com/vmess-hu |
| VLess WS | bug.com/vless-ws |
| VLess HU | bug.com/vless-hu |
| TRojan WS | bug.com/trojan-ws |
| TRojan HU | bug.com/trojan-hu |

# Yang harus dipersiapkan
- VPS minimal 1 Core 1 GB ram
- 2 GB ram [**RECOMMENDED**] 
- root akses vps
- Domain yang sudah di pointing ke CloudFlare

# Cloudflare Sett
- Pastikan SSL/TLS Setting pada cloudflare sudah di set menjadi full
- Lalu pada tab **Network** pastikan gRPC dan WebSocket sudah ON

# Sistem VM yang dapat digunakan
- Debian 11 [**RECOMMENDED**] </br>
- Debian 12 </br>
- Ubuntu 20 </br>
- Ubuntu 22 </br>
- Ubuntu 23 </br>
- Ubuntu 24 </br>

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
Buka panel Marzban dengan mengunjungi https://domainmu:7879/dashboard <br>
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
