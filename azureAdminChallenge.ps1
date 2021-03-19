cls
#Setting Location for Azure Services
$Location = "WestEurope"

#Virtual Machines
$VMUsername = "csa"
$VMPassword = "12345abc.!"
$VMOS = "Win2016Datacenter"
$VMSize = "Standard_B1s"

#Virtual Networks
$VNResourceGroup = "vm-networks"
$VNName = "myVnet"
$SubNetName = "default"
$MainNetwork = "10.0.0.0/16"
$SubNetwork = "10.0.0.0/24"


<#
  Preparations
#>

# Convert Credentials info to PsCredential object
$vmSecPassword = ConvertTo-SecureString -String $VMPassword -AsPlainText -Force
$vmCredential = New-Object System.Management.Automation.PsCredential($VMUsername, $vmSecPassword)


<#
  Main Script
#>

# Get User Credentials
Connect-AzAccount

# Create New ResourceGroup
<#
New-AzResourceGroup -Name vm-networks -Location $Location
#>


# Create subnet and Virtual Network
<#
New-AzResourceGroup -Name $VNResourceGroup -Location $Location
$Subnet = New-AzVirtualNetworkSubnetConfig -Name $SubNetName -AddressPrefix $SubNetwork
New-AzVirtualNetwork -Name VNName -ResourceGroupName $VNResourceGroup -Location $Location -AddressPrefix $MainNetwork -Subnet $Subnet
#>

# Create VMs
<#
New-AzVm -ResourceGroupName $VNResourceGroup -Name "dataProcStage1" -VirtualNetworkName $VNName `
-SubnetName $SubNetName -image $VMOS -Size $VMSize -Credential $vmCredential
New-AzVm -ResourceGroupName $VNResourceGroup -Name "dataProcStage2" -VirtualNetworkName $VNName `
-SubnetName $SubNetName -image $VMOS -Size $VMSize -Credential $vmCredential
#>

<#
Disassociate public IP
Notes: After the following command, dataProcStage2 will not be accessible via PublicIP
dataProcStage1 will still be able to connect, since they are in the same VirtualNetwork
#>
<#
$nic = Get-AzNetworkInterface -Name dataProcStage2 -ResourceGroup vm-networks
$nic.IpConfigurations.publicipaddress.id = $null
Set-AzNetworkInterface -NetworkInterface $nic
#>
