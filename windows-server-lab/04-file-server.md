# 04 — File Server (FS01)

## Server Details
- Hostname: FS01
- IP Address: 192.168.10.3
- OS: Windows Server 2025 Standard
- Role: File Server, DFS Namespace
- Domain: TestNet.Domain

## Setup Steps
- Renamed to FS01 on first boot
- Static IP configured: 192.168.10.3
- DNS pointing to DC01: 192.168.10.1
- Successfully joined TestNet.Domain
- Logged in as TESTNET\Administrator

## Screenshots
![FS01 Static IP](../images/windows-server-lab/04-file-server/FS01-static-ip.png)
![FS01 Ping DC01](../images/windows-server-lab/04-file-server/FS01-ping-dc01.png)
![FS01 Domain Join](../images/windows-server-lab/04-file-server/FS01-domain-join.png)
![FS01 Server Manager](../images/windows-server-lab/04-file-server/FS01-server-manager.png)