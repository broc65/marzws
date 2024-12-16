<h2 align="center">
<hr>
Chocolatos
</h2><hr>
  
<p align="center"><img src="https://img.shields.io/badge/Service-fallback-blue"> <img src="https://img.shields.io/badge/Service-Multipath-blue"></p>

</p>
</div>

|  SERVICE | NETWORK PORT |
|-----------------|-----------------|
| VMess Websocket | 443, 80 |
| VLess Websocket | 443, 80 |
| Trojan Websocket | 443, 80 |
| VMess HttpUpgrade | 443, 80 |
| VLess HttpUpgrade | 443, 80 |
| Trojan HttpUpgrade | 443, 80 |
| VMess gRPC | 443 |
| VLess gRPC | 443 |
| TRojan gRPC | 443 |
| VMess TCP | 443 |
| VLess TCP | 443 |
| TRojan TCP | 443 |
| VLess TCP Reality| 443 |
| VLess gRPC Reality| 443 |

| SERVICE | DYNAMIC PATH |
|-----------------|-----------------|
| VMess Websocket | anything/vmess-ws |
| VMess HttpUpgrade | anything/vmess-hu |
| VLess Websocket | anything/vless-ws |
| VLess HttpUpgrade | anything/vless-hu |
| TRojan Websocket | anything/trojan-ws |
| TRojan HttpUpgrade | anything/trojan-hu |

# Yang harus dipersiapkan
- VPS minimal 1 Core 1 GB ram
- 2 GB ram [**RECOMMENDED**] 
- root akses vps
- Domain yang sudah di pointing ke CloudFlare

# Cloudflare Sett
```
- SSL/TLS : FULL
- SSL/TLS Recommender : OFF
- GRPC : ON
- WEBSOCKET : ON
- Always Use HTTPS : OFF
- UNDER ATTACK MODE : OFF
```

# Sistem VM yang dapat digunakan
- Debian 11 above[**RECOMMENDED**] </br>
- Ubuntu 22 above </br>
