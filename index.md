# Windows Server Active Directory Home Lab

## Overview
A virtualised enterprise network built to simulate a real-world 
Windows Server environment. Built using VMware/VirtualBox on 
personal hardware.

## Lab topology
- 2 x Windows Server 2022 Domain Controllers (Primary + Replica)
- Domain: TestNet.Domain
- DNS and DHCP configured on DC1
- 2 x Windows 10/11 client PCs joined to the domain
- Virtual switch isolating lab traffic

## What I configured
- Active Directory Domain Services (AD DS)
- DNS zones (forward + reverse lookup)
- DHCP scopes with reservations
- Group Policy Objects (GPOs) — desktop lockdown, mapped drives
- User accounts, OUs, and security groups
- FSMO roles distributed across both DCs

## What I learned
- How domain replication works between DCs
- Troubleshooting DNS resolution failures
- How GPOs are applied and in what order
- The difference between NTDS and SYSVOL replication

## Screenshots
[Add screenshots here]

## What I'd add next
- PowerShell user provisioning scripts
- osTicket helpdesk integration
