# New-UserShare.ps1
# Creates home folders for all Contoso AD users
# Author: Your Name
# Date: June 2026

Import-Module ActiveDirectory

# Base path for home folders
$BasePath = "C:\Shares\HomeDirectories"

# Create base directory if it doesn't exist
if (-not (Test-Path $BasePath)) {
    New-Item -Path $BasePath -ItemType Directory
    Write-Host "Created base directory: $BasePath" -ForegroundColor Cyan
}

# Get all users in Contoso OU
$Users = Get-ADUser -Filter * `
    -SearchBase "OU=Contoso,DC=TestNet,DC=Domain"

foreach ($User in $Users) {
    $UserFolder = "$BasePath\$($User.SamAccountName)"

    if (Test-Path $UserFolder) {
        Write-Host "Folder already exists for $($User.SamAccountName) — skipping" -ForegroundColor Yellow
    }
    else {
        # Create the folder
        New-Item -Path $UserFolder -ItemType Directory

        # Set NTFS permissions — user gets full control of own folder
        $Acl = Get-Acl $UserFolder
        $Permission = New-Object System.Security.AccessControl.FileSystemAccessRule(
            "TESTNET\$($User.SamAccountName)",
            "FullControl",
            "ContainerInherit,ObjectInherit",
            "None",
            "Allow"
        )
        $Acl.SetAccessRule($Permission)
        Set-Acl -Path $UserFolder -AclObject $Acl

        Write-Host "Created home folder for $($User.SamAccountName)" -ForegroundColor Green
    }
}

Write-Host "`nHome folder creation complete." -ForegroundColor Cyan