# Windows Server Enterprise Lab — Contoso

A fully functional enterprise network built on Microsoft Hyper-V,
simulating a real-world IT infrastructure for a fictional company
called Contoso.

## Live Lab — Built June 2026

| Detail | Value |
|---|---|
| Host | HALLOWPC |
| Hypervisor | Microsoft Hyper-V (Windows 11) |
| Domain | TestNet.Domain |
| Servers | Windows Server 2025 Standard |
| Clients | Windows 11 Education 25H2 |
| Firewall | pfSense CE 2.8.1 |

## Network Topology

```
Internet
    │
[pfSense 192.168.10.254] — Firewall, NAT
    │
[LabSwitch — 192.168.10.0/24]
    │
    ├── DC01 (192.168.10.1) — AD DS, DNS, DHCP
    ├── DC02 (192.168.10.2) — Secondary DC
    ├── FS01 (192.168.10.3) — File Server, DFS
    ├── WEB01 (192.168.10.4) — IIS Intranet, SSL
    ├── WSUS01 (192.168.10.5) — Patch Management
    ├── PC01 (DHCP) — Domain Client
    └── PC02 (DHCP) — Domain Client
```

## What Was Built

### Active Directory Domain Services
- Forest root domain: TestNet.Domain (Windows Server 2025)
- Two domain controllers with verified AD replication
- Contoso OU structure — IT, Management, HR, Computers
- 8 domain user accounts across all departments
- FSMO roles distributed across DC01 and DC02
- Replication verified with repadmin

### DNS & DHCP
- Forward and reverse lookup zones on DC01
- DHCP scope: 192.168.10.50–100
- DHCP authorised in Active Directory
- DNS A record: intranet.testnet.domain → WEB01

### Group Policy (6 GPOs)
- Password policy — complexity, lockout, history
- Desktop wallpaper enforcement
- Screensaver lock after 10 minutes
- USB storage restriction
- H: drive mapping for IT department
- WSUS client update policy

### File Server (FS01)
- SMB shares — IT, Management, HR, Company
- DFS Namespace: \\FS01\Contoso
- Disk quotas via File Server Resource Manager
- NTFS permissions per department

### IIS Web Server (WEB01)
- Custom Contoso intranet homepage
- HTTP and HTTPS bindings
- Self-signed SSL certificate
- Accessible via intranet.testnet.domain

### WSUS Patch Management
- Windows Server Update Services on WSUS01
- GPO pointing all domain computers to WSUS01:8530
- Client-side targeting configured

### PowerShell Automation
- New-LabUsers.ps1 — bulk user creation from CSV
- Get-UserReport.ps1 — AD user reporting with CSV export
- New-UserShare.ps1 — automated home folder and NTFS permissions

### Backup & Disaster Recovery
- Windows Server Backup on DC01
- Dedicated 30GB backup volume (E: drive)
- System state and full volume backup
- Documented DR procedures for common failure scenarios

### pfSense Firewall
- NAT routing — internal lab to internet
- Stateful packet inspection
- Custom firewall rules — Telnet blocked
- Web GUI management at 192.168.10.254

## Skills Demonstrated

- Windows Server 2025 administration
- Active Directory design and implementation
- DNS and DHCP configuration and troubleshooting
- Group Policy design and verification
- PowerShell scripting and automation
- IIS web server and SSL certificate management
- Network file services and DFS namespaces
- Patch management with WSUS
- Firewall configuration with pfSense CE
- Backup and disaster recovery planning
- Technical documentation and runbooks

## Documentation

Full step-by-step documentation for every component:

- [01 — VM Setup](windows-server-lab/01-vm-setup)
- [02 — Active Directory, DNS & DHCP](windows-server-lab/02-ad-dns-dhcp)
- [03 — Group Policy](windows-server-lab/03-group-policy)
- [04 — File Server](windows-server-lab/04-file-server)
- [05 — IIS Web Server](windows-server-lab/05-iis-webserver)
- [06 — WSUS](windows-server-lab/06-wsus)
- [07 — pfSense](windows-server-lab/07-pfsense)
- [08 — PowerShell Automation](windows-server-lab/08-powershell-automation)
- [09 — Backup & DR](windows-server-lab/09-backup-dr)

## Repository

[github.com/hallowseph/windows-server-lab](https://github.com/hallowseph/windows-server-lab)
