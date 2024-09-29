# minecraft server | DEV-README
こんにちは。こちらは、デベロッパー向けのREADMEとなります。
[一般向けはコチラ！](https://github.com/akikukeo/minecraft-server/blob/main/README.md)

## 使用ポート｜ip
### <各サーバー>
### lobby:
    port: 25571
### main:
    port: 25572
---
### <アクセス用>
### BungeeCord:
    port: 25570→37564
    host-TCP-port: 0.0.0.0:25570→0.0.0.0:37564
### 統合版:
    UDP-port: 19132


## 使用プラグイン
### lobby: 
    DecentHolograms-2.8.11.jar
    Geyser-Spigot.jar
    LuckPerms-Bukkit-5.4.141.jar
    multiverse-core-4.3.12.jar
    multiverse-netherportals-4.2.3.jar
    multiverse-portals-4.2.3.jar
    worldedit-bukkit-7.3.6.jar
    worldguard-bukkit-7.0.9-dist.jar
---
### main:
    DecentHolograms-2.8.11.jar
    Geyser-Spigot.jar
    LuckPerms-Bukkit-5.4.141.jar
    multiverse-core-4.3.12.jar
    multiverse-netherportals-4.2.3.jar
    multiverse-portals-4.2.3.jar
    worldedit-bukkit-7.3.6.jar
    worldguard-bukkit-7.0.9-dist.jar
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
