# minecraft server v(hoge)-beta | DEV-README
### **[EN is here!](EN\DEV-README_EN.md)**

こんにちは。こちらは、デベロッパー向けのREADMEとなります。
[一般向けはコチラ！](README.md)

## 環境
<img src="https://img.shields.io/badge/MC%20Server%20Soft-v13.9.1-4FC08D.svg?logo=&style=popout">
<img src="https://img.shields.io/badge/Java-21.0.1%20LTS-007396.svg?logo=java&style=popout">
<img src="https://img.shields.io/badge/-Windows-0078D6.svg?logo=windows&style=popout">

### 主な使用技術
<img src="https://img.shields.io/badge/-BungeeCord-4FC08D.svg?logo=&style=popout">
<img src="https://img.shields.io/badge/Paper-%204514c71%2096-4FC08D.svg?logo=&style=popout">

## 使用ポート｜ip
### <各サーバー>
### lobby: Paper
    port: 25571
### main: Paper
    port: 25572
---
### <アクセス用>
### BungeeCord:
    port: 25570 → 37564
    host-TCP-port: 0.0.0.0:25570 → 0.0.0.0:37564
### 統合版:
    UDP-port: 19132


## 使用プラグイン
### lobby: 
    DecentHolograms-2.8.11.jar
    LuckPerms-Bukkit-5.4.141.jar
    multiverse-core-4.3.12.jar
    multiverse-netherportals-4.2.3.jar
    multiverse-portals-4.2.3.jar
    worldedit-bukkit-7.3.6.jar
    worldguard-bukkit-7.0.9-dist.jar
---
### main:
    DecentHolograms-2.8.11.jar
    LuckPerms-Bukkit-5.4.141.jar
    worldedit-bukkit-7.3.6.jar
    worldguard-bukkit-7.0.9-dist.jar
    Towny-0.100.4.0.jar
    TownyChat-0.116.jar
---
### BungeeCord:
    Geyser-BungeeCord.jar
    ViaBackwards-5.0.3.jar
    ViaRewind-4.0.2.jar
    ViaVersion-5.0.3.jar


## サーバーの仕組み
### 複雑な構成図です。
**緑：クライアントの経路**  
**黄色：Auto-startup.batの経路**  
**黒：サーバーがアクセスする経路**  

![複雑構成図](https://github.com/user-attachments/assets/d06aa2f7-7cf7-43f5-a203-9d6371ae1807)
