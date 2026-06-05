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
| VM     | OS                          | RAM  | Disk  |
|--------|-----------------------------|------|-------|
| DC01   | Windows Server 2025 Std     | 2 GB | 60 GB |
| DC02   | Windows Server 2025 Std     | 2 GB | 60 GB |
| PC01   | Windows 11 Enterprise       | 2 GB | 50 GB |
| PC02   | Windows 11 Enterprise       | 2 GB | 50 GB |

## Screenshots
![Hyper-V Manager](../images/windows-server-lab/01-vm-setup/Hyper-V-Manager.png)
![Virtual Switch - LabSwitch](../images/windows-server-lab/01-vm-setup/Virtual-switch.png)

## Notes
- LabSwitch set to Internal only — VMs communicate with each other
  and the host but not directly to the internet
- DC01 renamed to DC01 on first boot before any roles installed