function createVirtualNetwork {
    param (
        [Parameter(Mandatory=$false)] [String]$VNResourceGroup = $VNResourceGroup,
        [Parameter(Mandatory=$false)] [String]$Location = $Location,
        [Parameter(Mandatory=$false)] [String]$SubNetName = $SubNetName,
        [Parameter(Mandatory=$false)] [String]$SubNetwork = $SubNetwork,
        [Parameter(Mandatory=$false)] [String]$MainNetwork = $MainNetwork
    )
    . $PSScriptRoot/functions/azureCreateVirtualNetwork.ps1
}

function createVM {
    param (
        [Parameter(Mandatory=$true)] [string]$VMName,
        [Parameter(Mandatory=$false)] [String]$VNResourceGroup = $VNResourceGroup,
        [Parameter(Mandatory=$false)] [String]$VNName = $VNName,
        [Parameter(Mandatory=$false)] [String]$SubNetName = $SubNetName,
        [Parameter(Mandatory=$false)] [String]$VMOS = $VMOS,
        [Parameter(Mandatory=$false)] [String]$VMSize = $VMSize,
        [Parameter(Mandatory=$false)] [String]$VMPassword = $VMPassword,
        [Parameter(Mandatory=$false)] [String]$VMUsername = $VMUsername
    )
    . $PSScriptRoot/functions/azureCreateVM.ps1
}
