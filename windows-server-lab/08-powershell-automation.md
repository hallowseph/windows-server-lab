# 08 — PowerShell Automation

## Overview
PowerShell scripts written to automate common Active Directory
administration tasks. All scripts stored in C:\Scripts on DC01
and in the scripts/ folder of this repository.

## Scripts Written

### 1. New-LabUsers.ps1
Bulk creates AD users from a CSV file. Reads user details
from users.csv and creates accounts in the correct Contoso OUs.

**Key concepts demonstrated:**
- Import-Module ActiveDirectory
- Import-Csv to read structured data
- foreach loop to iterate users
- New-ADUser with full parameter set
- Error handling with -ErrorAction SilentlyContinue
- ConvertTo-SecureString for secure password handling
- Variable scoping fix for Get-ADUser -Filter

**Troubleshooting note:**
Variables cannot be used directly inside Get-ADUser filter
script blocks. Must assign to a simple variable first:
```powershell
$username = $User.Username
Get-ADUser -Filter {SamAccountName -eq $username}
```

### 2. Get-UserReport.ps1
Queries all users in the Contoso OU and generates a formatted
report showing account status, last logon, and password age.
Exports results to CSV at C:\Scripts\UserReport.csv.

**Key concepts demonstrated:**
- Get-ADUser with -Properties parameter
- Conditional Write-Host colouring (green/red for enabled status)
- Export-Csv for data export
- Get-Date for report timestamps

### 3. New-UserShare.ps1
Automatically creates personal home folders for all Contoso
users with correct NTFS permissions. Each user receives
FullControl of their own folder only.

**Key concepts demonstrated:**
- Test-Path for conditional folder creation
- New-Item for directory creation
- Get-Acl and Set-Acl for NTFS permission management
- FileSystemAccessRule for permission objects
- ContainerInherit and ObjectInherit for permission inheritance

## CSV Structure
Users are provisioned from a CSV file with this structure:
```csv
FirstName,LastName,Username,Department,OU
Alice,Johnson,ajohnson,IT,IT
```

## Users Created via Script
| Name | Username | OU |
|---|---|---|
| Alice Johnson | ajohnson | Contoso/IT |
| Robert Brown | rbrown | Contoso/IT |
| Sarah Williams | swilliams | Contoso/Management |
| Michael Davis | mdavis | Contoso/Management |
| Emma Wilson | ewilson | Contoso/HR |
| James Taylor | jtaylor | Contoso/HR |

## Home Directories Created
- Base path: C:\Shares\HomeDirectories
- 8 folders created — one per user
- NTFS permissions: each user has FullControl of own folder only
- Domain Admins retain full access to all folders

## Screenshots
![Bulk User Creation Output](../images/windows-server-lab/08-powershell/PS-bulk-user-creation.png)
![Users in IT OU](../images/windows-server-lab/08-powershell/PS-users-IT-ou.png)
![Users in Management OU](../images/windows-server-lab/08-powershell/PS-users-management-ou.png)
![Users in HR OU](../images/windows-server-lab/08-powershell/PS-users-hr-ou.png)
![User Report Output](../images/windows-server-lab/08-powershell/PS-user-report.png)
![Home Folders Created](../images/windows-server-lab/08-powershell/PS-home-folders.png)
![Home Folders Explorer](../images/windows-server-lab/08-powershell/PS-home-folders-explorer.png)