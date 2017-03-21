Clear-Host
#Sets working directory\
Set-Location "C:\JakeGitHub\MDT-Deploy"

#Includes Variables.ps1
. .\Variables.ps1

#Checks Prerequisites
. .\CheckEnv.ps1

#Create VM
.\Create-VM.ps1