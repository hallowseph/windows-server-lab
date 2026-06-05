# 02 — Active Directory, DNS & DHCP

## Domain Creation
- Forest: TestNet.Domain
- NetBIOS name: TESTNET
- Functional level: Windows Server 2025
- Primary DC: DC01 (192.168.10.1)
- DSRM password configured

## Roles Installed on DC01
- Active Directory Domain Services (AD DS)
- DNS Server
- Global Catalog

## Screenshots
![AD DS Install Success](../images/windows-server-lab/02-ad-dns-dhcp/AD-DS-install-success.png)
![Domain Review Options](../images/windows-server-lab/02-ad-dns-dhcp/DC01-domain-review.png)
![Server Manager Post-Promotion](../images/windows-server-lab/02-ad-dns-dhcp/DC01-server-manager.png)
![AD Users and Computers](../images/windows-server-lab/02-ad-dns-dhcp/DC01-ad-users-computers.png)

## Notes
- Yellow warnings on prerequisites check are normal in a lab environment
- Server automatically restarted after promotion
- Login after restart uses TESTNET\Administrator

## DHCP Configuration
- Role installed on DC01.TestNet.Domain
- Authorised in Active Directory via post-install wizard

### Scope: LabScope
| Setting          | Value              |
|------------------|--------------------|
| IP Range         | 192.168.10.50–100  |
| Subnet Mask      | 255.255.255.0      |
| Default Gateway  | 192.168.10.254     |
| DNS Server       | 192.168.10.1       |
| DNS Domain       | TestNet.Domain     |
| Lease Duration   | 8 days             |
| Status           | Active             |

## Screenshots
![DHCP Install Success](../images/windows-server-lab/02-ad-dns-dhcp/DHCP-install-success.png)
![DHCP Post Install](../images/windows-server-lab/02-ad-dns-dhcp/DHCP-post-install.png)
![DHCP LabScope Active](../images/windows-server-lab/02-ad-dns-dhcp/DHCP-LabScope-active.png)
![DHCP Scope Properties](../images/windows-server-lab/02-ad-dns-dhcp/DHCP-scope-properties.png)
![DHCP Server Manager](../images/windows-server-lab/02-ad-dns-dhcp/DHCP-server-manager.png)


## DC02 Setup

### Static IP Configuration
- IP Address: 192.168.10.2
- Subnet Mask: 255.255.255.0
- Default Gateway: 192.168.10.254
- Preferred DNS: 192.168.10.1 (points to DC01)

### Domain Join
- Joined domain: TestNet.Domain
- Credentials used: TESTNET\Administrator

### AD DS Promotion
- Operation: Add domain controller to existing domain
- Domain: TestNet.Domain
- DNS Server: Yes
- Global Catalog: Yes
- DSRM password configured
- Server: DC02.TestNet.Domain

## DC02 Screenshots
![DC02 Static IP](../images/windows-server-lab/02-ad-dns-dhcp/DC02-static-ip.png)
![DC02 Ping DC01](../images/windows-server-lab/02-ad-dns-dhcp/DC02-ping-dc01.png)
![DC02 Domain Join](../images/windows-server-lab/02-ad-dns-dhcp/DC02-domain-join.png)
![DC02 AD DS Success](../images/windows-server-lab/02-ad-dns-dhcp/DC02-adds-success.png)
![DC02 Server Manager](../images/windows-server-lab/02-ad-dns-dhcp/DC02-server-manager.png)

## Notes
- DC02 DNS points to DC01 (192.168.10.1) before promotion
- After promotion DC02 handles its own DNS replication
- Both DCs running Windows Server 2025
- Replication between DC01 and DC02 automatic via AD DS
- Post-promotion repadmin error 1908 observed on DC01
- dcdiag /test:dns showed all tests passing on DC01
- nslookup confirmed DC02 resolving correctly at 192.168.10.2
- DNS timeout warning is cosmetic IPv6 issue, not functional
- Resolved by flushing DNS cache and restarting NetLogon service