# 06 — WSUS (Windows Server Update Services)

## Server Details
- Hostname: WSUS01
- IP Address: 192.168.10.5
- OS: Windows Server 2025 Standard
- Role: Windows Server Update Services
- Domain: TestNet.Domain
- Update storage: C:\WSUS

## Roles Installed
- Windows Server Update Services
- WID Connectivity (Windows Internal Database)
- WSUS Services

## WSUS Configuration
| Setting | Value |
|---|---|
| Upstream server | Microsoft Update |
| Proxy server | None |
| Languages | English only |
| Products | Windows 10 family, Windows Server 2019 |
| Classifications | Critical Updates, Security Updates, Definition Updates |
| Sync schedule | Automatic, once daily |

## Group Policy — Contoso-WSUS-Policy
- Linked to: Contoso/Computers OU
- Settings configured:
  - Specify intranet update service: http://192.168.10.5:8530
  - Automatic Updates detection frequency: 6 hours
  - Enable client-side targeting: Workstations
  - Configure Automatic Updates: Auto download and notify
  - No auto-restart with logged on users: Enabled

## Troubleshooting Notes
- Initial WSUS sync failed — WebException: remote name could
  not be resolved: sws.update.microsoft.com
- Cause: LabSwitch is internal only — no internet access
- Resolution: Configured WSUS manually via Options panel
  instead of using the configuration wizard
- Windows 11 and Windows Server 2025 not available in product
  list — WSUS requires internet sync to populate full product
  catalogue. Windows 10 and Server 2019 selected as closest
  available alternatives
- In production: WSUS would have internet access and sync
  automatically with Microsoft Update servers

## Screenshots
![WSUS01 Role Installed](../images/windows-server-lab/06-wsus/WSUS01-role-installed.png)
![WSUS01 Post Install](../images/windows-server-lab/06-wsus/WSUS01-post-install.png)
![WSUS01 Console](../images/windows-server-lab/06-wsus/WSUS01-console.png)
![WSUS01 Update Source](../images/windows-server-lab/06-wsus/WSUS01-update-source.png)
![WSUS01 Products](../images/windows-server-lab/06-wsus/WSUS01-products.png)
![WSUS01 Classifications](../images/windows-server-lab/06-wsus/WSUS01-classifications.png)
![WSUS01 Sync Schedule](../images/windows-server-lab/06-wsus/WSUS01-sync-schedule.png)
![WSUS01 GPO Configured](../images/windows-server-lab/06-wsus/WSUS01-gpo-configured.png)
![WSUS01 GPO Update Server](../images/windows-server-lab/06-wsus/WSUS01-gpo-update-server.png)
![WSUS01 GPO Targeting](../images/windows-server-lab/06-wsus/WSUS01-gpo-targeting.png)
![WSUS01 GPO Auto Update](../images/windows-server-lab/06-wsus/WSUS01-gpo-auto-update.png)