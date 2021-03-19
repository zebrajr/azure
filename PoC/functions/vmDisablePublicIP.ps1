clear

. $PSScriptRoot/config.ps1
. $PSScriptRoot/setupCredentials.ps1


$nic = Get-AzNetworkInterface -Name $VM2Name -ResourceGroup $VNResourceGroup
$nic.IpConfigurations.publicipaddress.id = $null
Set-AzNetworkInterface -NetworkInterface $nic 