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