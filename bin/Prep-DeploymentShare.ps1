 If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(` 
    [Security.Principal.WindowsBuiltInRole] "Administrator")) 
{ 
    Write-Warning "Please start the PowerShell prompt as an Administrator and re-run the script." 
    Break 
} 

#Load MDT SnapIn
Add-PSSnapIn Microsoft.BDD.PSSnapIn -ErrorAction SilentlyContinue 

#Create DeploymentShare
$DeploymentServer = $ComputerName
$InstallDrive = "C:" 
New-Item -Path $InstallDrive\ReferenceFactory -ItemType directory
New-PSDrive -Name "Reference Factory" -PSProvider "MDTProvider" -Root "$InstallDrive\ReferenceFactory" -Description "Reference Factory" -NetworkPath "\\$DeploymentServer\ReferenceFactory$" -Verbose | add-MDTPersistentDrive -Verbose
New-SmbShare –Name ReferenceFactory$ –Path "$InstallDrive\ReferenceFActory" –ChangeAccess EVERYONE 

#Download ISO


#Mount ISO
Mount-DiskImage [-ImagePath] <String[]> [-Access <Access> ] [-AsJob] [-CimSession <CimSession[]> ] [-NoDriveLetter] [-PassThru] [-StorageType <StorageType> ] [-ThrottleLimit <Int32> ] [-Confirm] [-WhatIf] [ <CommonParameters>]

#Import OS
Import-Module "C:\Program Files\Microsoft Deployment Toolkit\bin\MicrosoftDeploymentToolkit.psd1"
New-PSDrive -Name "DS003" -PSProvider MDTProvider -Root "C:\DeploymentShare"
import-mdtoperatingsystem -path "DS003:\Operating Systems" -SourcePath "E:\" -DestinationFolder "Windows 10 Pro x64" -Verbose