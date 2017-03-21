#Sets working directory\
Set-Location "C:\JakeGitHub\MDT-Deploy"

#Includes Variables.ps1
. .\Variables.ps1


#Checks Prerequisites
Write-Host "Checking Prerequisites...."
. .\CheckEnv.ps1