#Installs Hyper-V Feature
Write-Host "Installing Hyper-V..."
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
.\CheckEnv.ps1