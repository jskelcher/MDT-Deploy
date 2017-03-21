Get-NetAdapter
$Ethernet = Get-NetAdapter -Name Ethernet
New-VMSwitch -Name ExternalSwitch -NetAdapterName $Ethernet.Name -AllowManagementOS $True