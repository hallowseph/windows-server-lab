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