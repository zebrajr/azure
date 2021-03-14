Connect-AzAccount
New-AzResourceGroup -Name $VNResourceGroup -Location $Location
$Subnet = New-AzVirtualNetworkSubnetConfig -Name $SubNetName -AddressPrefix $SubNetwork
New-AzVirtualNetwork -Name VNName -ResourceGroupName $VNResourceGroup -Location $Location -AddressPrefix $MainNetwork -Subnet $Subnet
