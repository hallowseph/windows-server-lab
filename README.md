# Windows Server Enterprise Lab

A fully functional enterprise network built on Microsoft 
Hyper-V, simulating a real-world IT infrastructure for a 
fictional company called Contoso.

## Lab Overview

| Detail | Value |
|---|---|
| Host machine | HALLOWPC |
| Hypervisor | Microsoft Hyper-V |
| Domain | TestNet.Domain |
| OS — Servers | Windows Server 2025 Standard |
| OS — Clients | Windows 11 Education 25H2 |
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

### Active Directory
- Forest root domain: TestNet.Domain
- Two domain controllers with full replication
- Contoso OU structure — IT, Management, HR, Computers
- 8 domain user accounts provisioned via PowerShell
- FSMO roles distributed across DC01 and DC02

### DNS & DHCP
- Forward and reverse lookup zones on DC01
- DHCP scope: 192.168.10.50–100
- DNS A record for intranet.testnet.domain

### Group Policy
- Password and account lockout policy
- Desktop wallpaper enforcement
- Screensaver lock after 10 minutes
- USB storage restriction
- H: drive mapping for IT department
- WSUS update policy

### File Server (FS01)
- SMB shares — IT, Management, HR, Company
- DFS Namespace: \\FS01\Contoso
- Disk quotas via FSRM
- NTFS permissions per department

### IIS Web Server (WEB01)
- Custom Contoso intranet homepage
- HTTP and HTTPS bindings
- Self-signed SSL certificate
- Accessible via intranet.testnet.domain

### WSUS (WSUS01)
- Windows Server Update Services configured
- GPO pointing all clients to WSUS01
- Client-side targeting enabled

### PowerShell Automation
- New-LabUsers.ps1 — bulk user creation from CSV
- Get-UserReport.ps1 — AD user reporting
- New-UserShare.ps1 — automated home folder creation

### Backup & DR
- Windows Server Backup on DC01
- Dedicated backup volume (E: drive)
- System state and full volume backup
- Documented disaster recovery procedures

### pfSense Firewall
- NAT routing — internal lab to internet
- Stateful packet inspection
- Custom firewall rules — Telnet blocked
- Web GUI management interface

## Skills Demonstrated

- Windows Server 2025 administration
- Active Directory design and implementation
- DNS, DHCP configuration and troubleshooting
- Group Policy design and verification
- PowerShell scripting and automation
- IIS web server configuration and SSL
- Network file services and DFS
- Patch management with WSUS
- Firewall configuration with pfSense
- Backup and disaster recovery planning
- Technical documentation

## Documentation

Each component is fully documented in the
`windows-server-lab/` folder with:
- Step-by-step configuration notes
- PowerShell commands used
- Screenshots at every stage
- Troubleshooting notes


## Author
Joseph Reanzares — [github.com/hallowseph](https://github.com/hallowseph)

## Live Portfolio

[hallowseph.github.io/windows-server-lab](https://hallowseph.github.io/windows-server-lab/)
