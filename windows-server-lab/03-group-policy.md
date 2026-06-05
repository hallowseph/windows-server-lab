# 03 — Group Policy

## Overview
Group Policy Objects (GPOs) are used to centrally manage 
settings for users and computers in the Contoso domain.
All GPOs are managed from DC01 via Group Policy Management Console.

## GPOs Created

### 1. Contoso-Password-Policy
- Linked to: TestNet.Domain
- Type: Computer Configuration
- Settings:
  - Minimum password length: 8 characters
  - Password complexity: Enabled
  - Maximum password age: 90 days
  - Minimum password age: 1 day
  - Password history: 5 passwords
  - Account lockout threshold: 5 attempts
  - Account lockout duration: 15 minutes
  - Reset lockout counter: 15 minutes

### 2. Contoso-Desktop-Wallpaper
- Linked to: Contoso/Computers OU
- Type: User Configuration
- Settings:
  - Wallpaper path: C:\Windows\Web\Wallpaper\Windows\img0.jpg
  - Style: Fill
- Verified: Wallpaper applied on PC01 and PC02

### 3. Contoso-Screensaver-Lock
- Linked to: Contoso/Computers OU
- Type: User Configuration
- Settings:
  - Screen saver enabled: Yes
  - Timeout: 600 seconds (10 minutes)
  - Password protected: Yes

### 4. Contoso-Disable-USB
- Linked to: Contoso/Computers OU
- Type: Computer Configuration
- Settings:
  - All Removable Storage classes: Deny all access: Enabled

### 5. Contoso-IT-Drive-Map
- Linked to: Contoso/IT OU
- Type: User Configuration → Preferences → Drive Maps
- Settings:
  - Drive letter: H:
  - Path: \\DC01\IT-Share
  - Label: IT Share
  - Reconnect: Yes
- Verified: H: drive visible in File Explorer on PC01 as jsmith

## Troubleshooting Notes
- GPO was created but not linked to IT OU — resolved by manually
  linking via right-click → Link an Existing GPO in GPMC
- gpresult /r must be run as the domain user (not local admin)
  to show user-based GPO application
- Drive mapping applies at logon — gpupdate /force alone is not
  sufficient, a logoff/logon cycle is required

## Commands Used
```powershell
# Force Group Policy refresh
gpupdate /force

# Check applied GPOs for current user
gpresult /r

# List all GPOs in domain
Get-GPO -All | Select-Object DisplayName, GpoStatus | Format-Table

# Create IT share on DC01
New-Item -Path "C:\Shares\IT-Share" -ItemType Directory
New-SmbShare -Name "IT-Share" -Path "C:\Shares\IT-Share" `
  -FullAccess "TESTNET\Domain Admins" `
  -ReadAccess "TESTNET\Domain Users"
```

## Screenshots
![Password Policy Settings](../images/windows-server-lab/03-group-policy/GPO-password-policy.png)
![Screensaver Lock Settings](../images/windows-server-lab/03-group-policy/GPO-screensaver-lock.png)
![Desktop Wallpaper Settings](../images/windows-server-lab/03-group-policy/GPO-desktop-wallpaper.png)
![Disable USB Settings](../images/windows-server-lab/03-group-policy/GPO-disable-usb.png)
![Drive Mapping Settings](../images/windows-server-lab/03-group-policy/GPO-drive-mapping.png)
![IT OU GPO Linked](../images/windows-server-lab/03-group-policy/GPO-IT-OU-linked.png)
![GPO Result DC01](../images/windows-server-lab/03-group-policy/GPO-gpresult-dc01.png)
![H Drive Mapped on PC01](../images/windows-server-lab/03-group-policy/GPO-drive-map-working.png)
![GPO Result DC01 Part 2](../images/windows-server-lab/03-group-policy/GPO-gpresult2-dc01.png)
![GPO List](../images/windows-server-lab/03-group-policy/GPO-list.png)
![Wallpaper on PC01](../images/windows-server-lab/03-group-policy/GPO-wallpaper-pc01.png)
![Wallpaper on PC02](../images/windows-server-lab/03-group-policy/GPO-wallpaper-pc02.png)
![Account Lockout Policy](../images/windows-server-lab/03-group-policy/GPO-account-lockout-policy.png)
