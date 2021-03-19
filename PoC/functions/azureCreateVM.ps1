$vmSecPassword = ConvertTo-SecureString -String $VMPassword -AsPlainText -Force

$vmCredential = New-Object System.Management.Automation.PsCredential($VMUsername, $vmSecPassword)

New-AzVM `
    -ResourceGroupName $VNResourceGroup `
    -Name $VMName `
    -VirtualNetworkName $VNName `
    -SubnetName $SubNetName `
    -Image $VMOS `
    -Size $VMSize `
    -Credential $vmCredential

Get-AzPublicIpAddress -Name $VMName
