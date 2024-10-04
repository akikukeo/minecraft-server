# Minecraft Server v(hoge)-beta | DEV-README - EN
### **Translation by a translation machine**
### **[JP is here!](DEV-README.md)**

Hello! This is the developer's README.
[一般向けはコチラ！](README.md)

## Environment
<img src="https://img.shields.io/badge/MC%20Server%20Soft-v13.9.1-4FC08D.svg?logo=&style=popout">
<img src="https://img.shields.io/badge/Java-21.0.1%20LTS-007396.svg?logo=java&style=popout">
<img src="https://img.shields.io/badge/-Windows-0078D6.svg?logo=windows&style=popout">

### Main Technologies Used
<img src="https://img.shields.io/badge/-BungeeCord-4FC08D.svg?logo=&style=popout">
<img src="https://img.shields.io/badge/Paper-%204514c71%2096-4FC08D.svg?logo=&style=popout">

## Used Ports | IP
### <Each Server>
### Lobby: Paper
    port: 25571
### Main: Paper
    port: 25572
---
### <Access>
### BungeeCord:
    port: 25570 → 37564
    host-TCP-port: 0.0.0.0:25570 → 0.0.0.0:37564
### Bedrock Edition:
    UDP-port: 19132

## Used Plugins
### Lobby: 
    DecentHolograms-2.8.11.jar
    LuckPerms-Bukkit-5.4.141.jar
    multiverse-core-4.3.12.jar
    multiverse-netherportals-4.2.3.jar
    multiverse-portals-4.2.3.jar
    worldedit-bukkit-7.3.6.jar
    worldguard-bukkit-7.0.9-dist.jar
---
### Main:
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

## Server Architecture
### This is a complex architecture diagram.
**Green: Client route**  
**Yellow: Auto-startup.bat route**  
**Black: Routes accessed by the server**  

![複雑構成図](https://github.com/user-attachments/assets/d06aa2f7-7cf7-43f5-a203-9d6371ae1807)
