# Get-UserReport.ps1
# Generates a report of all AD users, their OU and account status
# Author: Your Name
# Date: June 2026

Import-Module ActiveDirectory

# Get all users in Contoso OU
$Users = Get-ADUser -Filter * -SearchBase "OU=Contoso,DC=TestNet,DC=Domain" `
    -Properties DisplayName, Department, Enabled, LastLogonDate, PasswordLastSet

# Display report header
Write-Host "`n===== Contoso User Report =====" -ForegroundColor Cyan
Write-Host "Generated: $(Get-Date)" -ForegroundColor Cyan
Write-Host "================================`n" -ForegroundColor Cyan

# Loop through users and display info
foreach ($User in $Users) {
    Write-Host "Name:         $($User.DisplayName)" -ForegroundColor White
    Write-Host "Username:     $($User.SamAccountName)" -ForegroundColor White
    Write-Host "Department:   $($User.Department)" -ForegroundColor White
    Write-Host "Enabled:      $($User.Enabled)" -ForegroundColor $(if ($User.Enabled) {"Green"} else {"Red"})
    Write-Host "Last Logon:   $($User.LastLogonDate)" -ForegroundColor White
    Write-Host "Password Set: $($User.PasswordLastSet)" -ForegroundColor White
    Write-Host "---" -ForegroundColor Gray
}

# Summary count
Write-Host "`nTotal users: $($Users.Count)" -ForegroundColor Cyan

# Export to CSV
$Users | Select-Object DisplayName, SamAccountName, Department, Enabled, LastLogonDate, PasswordLastSet |
    Export-Csv -Path "C:\Scripts\UserReport.csv" -NoTypeInformation

Write-Host "Report exported to C:\Scripts\UserReport.csv" -ForegroundColor Green