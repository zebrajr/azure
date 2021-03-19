cls

# Get User Credentials
Connect-AzAccount

# Delete ResourceGroup
Remove-AzResourceGroup -Name vm-networks

# Delete the Gateway Group
Remove-AzResourceGroup -Name VpnGatewayDemo
