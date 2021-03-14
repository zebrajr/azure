clear

. $PSScriptRoot/config.ps1

if (-not(Test-Path -Path $PSScriptRoot/credentials.txt -PathType Leaf)){
    Write-Host "::>  No Credentials found. Creating:"
    (Get-Credential).Password | ConvertFrom-SecureString | Set-Content $PSScriptRoot/credentials.txt
    Write-Host "::>  Securing Password."
} else {
    $azurePassword = Get-Content $PSScriptRoot/credentials.txt | ConvertTo-SecureString
    $azureCredential = New-Object System.Management.Automation.PsCredential($azureUsername,$azurePassword)
}


