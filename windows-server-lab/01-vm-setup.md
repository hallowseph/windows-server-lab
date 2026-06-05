# 01 — VM Setup

## Environment
- Host machine: HALLOWPC
- Hypervisor: Microsoft Hyper-V (Windows 11)

## Virtual Switch
- Name: LabSwitch
- Type: Internal network
- Purpose: Isolates lab VMs from the host network

## IP Plan
| Hostname | IP            | Role                        |
|----------|---------------|-----------------------------|
| DC01     | 192.168.10.1  | Primary Domain Controller   |
| DC02     | 192.168.10.2  | Secondary Domain Controller |
| FS01     | 192.168.10.3  | File Server                 |
| WEB01    | 192.168.10.4  | IIS Web Server              |
| WSUS01   | 192.168.10.5  | Windows Update Server       |
| PC01     | DHCP          | Domain Client               |
| PC02     | DHCP          | Domain Client               |

## VMs Created
| VM     | OS                      | RAM  | Disk  | Status    |
|--------|-------------------------|------|-------|-----------|
| DC01   | Windows Server 2025 Std | 2 GB | 60 GB | ✅ Complete |
| DC02   | Windows Server 2025 Std | 2 GB | 60 GB | ✅ Complete |
| PC01   | Windows 11 Education 25H2 | 4 GB | 64 GB | ⏳ Pending |
| PC02   | Windows 11 Education 25H2 | 4 GB | 64 GB | ⏳ Pending |
| FS01   | Windows Server 2025 Std | 2 GB | 80 GB | ⏳ Pending  |
| WEB01  | Windows Server 2025 Std | 2 GB | 60 GB | ⏳ Pending  |
| WSUS01 | Windows Server 2025 Std | 4 GB | 100 GB| ⏳ Pending  |

## Screenshots
![Hyper-V Manager](../images/windows-server-lab/01-vm-setup/Hyper-V-Manager.png)
![Virtual Switch - LabSwitch](../images/windows-server-lab/01-vm-setup/Virtual-switch.png)

## Notes
- LabSwitch set to Internal only — VMs communicate with each other
  and the host but not directly to the internet
- DC01 renamed to DC01 on first boot before any roles installedvv

## DC02 VM
- Created as fresh install (Option B)
- Renamed to DC02 on first boot
- Assigned to LabSwitch
- Static IP set before domain join
- Successfully joined TestNet.Domain
- Promoted to secondary domain controller

## PC02 Setup
- OS: Windows 11 Education 25H2
- Local account created: User02
- Computer renamed: PC02
- Network: DHCP via DC01 — assigned 192.168.10.52
- DNS: 192.168.10.1 (DC01)
- Domain joined: TestNet.Domain
- Verified in AD — moved to Contoso/Computers OU

## Screenshots
![PC02 Network Settings](../images/windows-server-lab/01-vm-setup/PC02-network-settings.png)
![PC02 Domain Join](../images/windows-server-lab/01-vm-setup/PC02-domain-join.png)
![PC02 System Properties](../images/windows-server-lab/01-vm-setup/PC02-system-properties.png)
![PC02 in AD Computers OU](../images/windows-server-lab/01-vm-setup/AD-PC02-moved.png)

## VM Status Update
| VM     | OS                        | RAM  | Disk   | Status      |
|--------|---------------------------|------|--------|-------------|
| DC01   | Windows Server 2025 Std   | 2 GB | 60 GB  | ✅ Complete |
| DC02   | Windows Server 2025 Std   | 2 GB | 60 GB  | ✅ Complete |
| PC01   | Windows 11 Education 25H2 | 4 GB | 64 GB  | ✅ Complete |
| PC02   | Windows 11 Education 25H2 | 4 GB | 64 GB  | ✅ Complete |
| FS01   | Windows Server 2025 Std   | 2 GB | 80 GB  | ⏳ Pending  |
| WEB01  | Windows Server 2025 Std   | 2 GB | 60 GB  | ⏳ Pending  |
| WSUS01 | Windows Server 2025 Std   | 4 GB | 100 GB | ⏳ Pending  |