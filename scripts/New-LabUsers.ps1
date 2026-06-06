# New-LabUsers.ps1
# Bulk creates Active Directory users from a CSV file
# Author: Joseph Reanzares
# Date: June 2026

# Import Active Directory module
Import-Module ActiveDirectory

# Define variables
$CSVPath = "C:\Scripts\users.csv"
$DefaultPassword = ConvertTo-SecureString "Windows2025" -AsPlainText -Force
$Domain = "TestNet.Domain"
$BaseOU = "OU=Contoso,DC=TestNet,DC=Domain"

# Import CSV
$Users = Import-Csv -Path $CSVPath

# Loop through each user
foreach ($User in $Users) {
    
    $FullName = "$($User.FirstName) $($User.LastName)"
    $TargetOU = "OU=$($User.OU),$BaseOU"
    
    # Check if user already exists
    $username = $User.Username
    if (Get-ADUser -Filter {SamAccountName -eq $username} -ErrorAction SilentlyContinue) {
        Write-Host "User $($User.Username) already exists — skipping" -ForegroundColor Yellow
    }
    else {
        # Create the user
        New-ADUser `
            -GivenName $User.FirstName `
            -Surname $User.LastName `
            -Name $FullName `
            -SamAccountName $User.Username `
            -UserPrincipalName "$($User.Username)@$Domain" `
            -Path $TargetOU `
            -Department $User.Department `
            -AccountPassword $DefaultPassword `
            -PasswordNeverExpires $true `
            -Enabled $true

        Write-Host "Created user: $FullName ($($User.Username)) in $($User.OU)" -ForegroundColor Green
    }
}

Write-Host "`nUser creation complete." -ForegroundColor Cyan