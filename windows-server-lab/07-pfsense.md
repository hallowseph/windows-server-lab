# 07 — pfSense Firewall

## Overview
pfSense CE 2.8.1 deployed as the network edge firewall and
router for the Contoso lab environment. Provides NAT, stateful
packet inspection, DNS forwarding, and firewall rules.

## VM Details
- Hostname: pfSense
- Version: pfSense CE 2.8.1-RELEASE
- Hypervisor: Hyper-V Generation 1
- RAM: 1024 MB
- Disk: 20 GB

## Network Interfaces
| Interface | Adapter | IP | Purpose |
|---|---|---|---|
| WAN | hn0 (ExternalSwitch) | DHCP 192.168.68.106 | Internet facing |
| LAN | hn1 (LabSwitch) | 192.168.10.254/24 | Internal lab gateway |

## Configuration
| Setting | Value |
|---|---|
| Hostname | pfSense |
| Domain | TestNet.Domain |
| Primary DNS | 192.168.10.1 (DC01) |
| Secondary DNS | 192.168.10.2 (DC02) |
| Timezone | Pacific/Auckland |
| Admin password | Lab password |

## Firewall Rules Created
| Action | Protocol | Source | Destination | Port | Description |
|---|---|---|---|---|---|
| Block | TCP | LAN subnets | Any | 23 | Block Telnet - insecure protocol |

## NAT Configuration
- Outbound NAT: Automatic — all internal traffic NATed to WAN IP
- Internal hosts access internet via pfSense WAN IP

## Verified
- DC01 can ping 8.8.8.8 via pfSense ✅
- DC01 taskbar shows "Internet access" ✅
- pfSense web GUI accessible at https://192.168.10.254 ✅

## Troubleshooting Notes
- Factory reset required after password was set during
  Netgate installer and became unknown
- LAN IP needed manual configuration via console option 2
  after factory reset defaulted to 192.168.1.1
- Web GUI login failed repeatedly — resolved by clearing
  browser cache and cookies on DC01
- WAN accidentally configured instead of LAN on first
  attempt at option 2 — corrected by running option 2 again

## Screenshots
![External Switch](../images/windows-server-lab/07-pfsense/pfSense-external-switch.png)
![VM Settings](../images/windows-server-lab/07-pfsense/pfSense-vm-settings.png)
![Installing](../images/windows-server-lab/07-pfsense/pfSense-installing.png)
![Interface Assignment](../images/windows-server-lab/07-pfsense/pfSense-interface-assign.png)
![Interface Confirmed](../images/windows-server-lab/07-pfsense/pfSense-interface-confirm.png)
![Console](../images/windows-server-lab/07-pfsense/pfSense-console.png)
![Login Page](../images/windows-server-lab/07-pfsense/pfSense-login.png)
![Setup Wizard](../images/windows-server-lab/07-pfsense/pfSense-setup-wizard.png)
![Dashboard](../images/windows-server-lab/07-pfsense/pfSense-dashboard.png)
![DC01 Internet via pfSense](../images/windows-server-lab/07-pfsense/pfSense-dc01-internet.png)
![Firewall Rules](../images/windows-server-lab/07-pfsense/pfSense-firewall-rules.png)