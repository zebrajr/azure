. $PSScriptRoot/functions/config.ps1
. $PSScriptRoot/setupCredentials.ps1
. $PSScriptRoot/azureFunctions.ps1

clear
createVM -VMName "dataProcStage1"
createVM -VMName "dataProcStage2"