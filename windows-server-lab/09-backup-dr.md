# 09 — Backup & Disaster Recovery

## Overview
Windows Server Backup configured on DC01 to provide
system state and full volume backup capability.
Follows the 3-2-1 backup principle:
- 3 copies of data
- 2 different storage types
- 1 offsite copy (in production)

## Backup Configuration on DC01

### Backup Drive
- Added second virtual disk: DC01-Backup.vhdx
- Size: 30 GB dynamically expanding
- Initialized: GPT partition style
- Drive letter: E:
- Label: Backup
- Format: NTFS

### Backup Job
| Setting | Value |
|---|---|
| Type | One-time backup (manual) |
| Items | System state, Local disk C: |
| Destination | E: (Backup drive) |
| Method | VSS full backup |

## Disaster Recovery Plan

### Scenario 1 — DC01 failure
1. Boot DC02 — domain still functional via secondary DC
2. Restore DC01 from backup using Windows Server Backup
3. Boot from Windows Server 2025 ISO → Repair → System Image Recovery
4. Point to E: backup drive
5. Verify AD replication after restore

### Scenario 2 — AD object accidentally deleted
1. Open Active Directory Users and Computers
2. Enable Advanced Features → View menu
3. Navigate to Deleted Objects container
4. Right-click deleted object → Restore
5. Verify object is restored in correct OU

### Scenario 3 — GPO accidentally deleted
1. Open Group Policy Management
2. Check if backup exists in SYSVOL
3. Restore from Windows Server Backup
4. Or recreate from documentation in this repo

## 3-2-1 Backup Strategy
| Copy | Location | Type |
|---|---|---|
| 1 | DC01 C: drive (live) | Primary |
| 2 | DC01 E: drive (backup) | Local backup |
| 3 | Offsite/cloud (production) | Remote backup |

## PowerShell Backup Commands
```powershell
# Check backup summary
Get-WBSummary

# Initialize backup drive
Initialize-Disk -Number 1 -PartitionStyle GPT
New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter E
Format-Volume -DriveLetter E -FileSystem NTFS `
    -NewFileSystemLabel "Backup" -Confirm:$false

# Check backup policy
Get-WBPolicy
```

## Screenshots
![Backup Feature Installed](../images/windows-server-lab/09-backup-dr/Backup-feature-installed.png)
![Backup Drive Setup](../images/windows-server-lab/09-backup-dr/Backup-drive-setup.png)
![Backup Confirmation](../images/windows-server-lab/09-backup-dr/Backup-confirmation.png)
![Backup In Progress](../images/windows-server-lab/09-backup-dr/Backup-in-progress.png)
![Backup Complete](../images/windows-server-lab/09-backup-dr/Backup-complete.png)
![Backup Summary](../images/windows-server-lab/09-backup-dr/Backup-summary.png)

## Notes
- In production: backup should go to a separate physical server
  or cloud storage (Azure Backup, Veeam)
- System state backup includes AD database, SYSVOL, registry
- Bare metal recovery allows full server rebuild from backup
- Test restores should be performed regularly in production