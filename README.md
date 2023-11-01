</p> 
<h2 align="center"> Marzban + Nginx </h2>

<p align="center"><img src="https://d33wubrfki0l68.cloudfront.net/5911c43be3b1da526ed609e9c55783d9d0f6b066/9858b/assets/img/debian-ubuntu-hover.png"></p> 

</p>
</div>

|  SERVICE  |  NETWORK PORT  |
|---------- |--------|
| Vmess WS TLS | 443 |
| Vless WS TLS  | 443 |
| Trojan WS TLS  | 443 |
| Vmess WS | 80 |
| Vless WS  | 80 |
| Trojan WS  | 80 |
| Vmess gRPC  | 443 |
| Vless gRPC  | 443 |
| Trojan gRPC  | 443 |
| Wildcard Path  | bug.com/vmess-ws 
| |bug.com/vless-ws |
| |bug.com/trojan-ws|

# Yang harus dipersiapkan
- VPS minimal 1 Core 1 GB ram
- root akses vps
- Domain yang sudah di pointing ke CloudFlare

# Sistem VM yang dapat digunakan
- Debian 10 </br>
- Debian 11 </br>
- Debian 12 </br>
- Ubuntu 18.04 </br>
- Ubuntu 20.04 </br>
- Ubuntu 22.04 </br>

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
