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

## File Server Roles Installed
- File Server
- File Server Resource Manager (FSRM)
- DFS Namespaces
- DFS Replication

## Shared Folders Created
| Share Name | Path | Access |
|---|---|---|
| IT | C:\Shares\Departments\IT | Domain Admins: Full, Domain Users: Change |
| Management | C:\Shares\Departments\Management | Domain Admins: Full, Domain Users: Change |
| HR | C:\Shares\Departments\HR | Domain Admins: Full, Domain Users: Change |
| Company | C:\Shares\Company | Domain Admins: Full, Domain Users: Read |
| Contoso | C:\Shares\Contoso | DFS namespace root |

## DFS Namespace
- Type: Standalone
- Root: \\FS01\Contoso
- Folders:
  - \\FS01\Contoso\IT → \\FS01\IT
  - \\FS01\Contoso\Management → \\FS01\Management
  - \\FS01\Contoso\HR → \\FS01\HR
  - \\FS01\Contoso\Company → \\FS01\Company

## Disk Quotas (FSRM)
| Path | Quota | Type |
|---|---|---|
| C:\Shares\Departments\IT | 1 GB | Soft limit |
| C:\Shares\Departments\Management | 1 GB | Soft limit |
| C:\Shares\Departments\HR | 1 GB | Soft limit |
| C:\Shares\Company | 2 GB | Soft limit |

## Troubleshooting Notes
- DFS domain-based namespace failed — cannot connect to domain
- Resolved by using standalone namespace type instead
- Root share must exist before DFS namespace can be created

## Screenshots
![FS01 Roles Installed](../images/windows-server-lab/04-file-server/FS01-roles-installed.png)
![FS01 Shares Created](../images/windows-server-lab/04-file-server/FS01-shares-created.png)
![FS01 Shares List](../images/windows-server-lab/04-file-server/FS01-shares-list.png)
![FS01 DFS Created](../images/windows-server-lab/04-file-server/FS01-dfs-created.png)
![FS01 DFS Namespace](../images/windows-server-lab/04-file-server/FS01-dfs-namespace.png)
![FS01 Quotas](../images/windows-server-lab/04-file-server/FS01-quotas.png)
![FS01 DFS Verified](../images/windows-server-lab/04-file-server/FS01-dfs-verified.png)