. .\Variables.ps1
$HVSVC = get-service vmms -ComputerName $ComputerName
If($HVSVC.status -eq "Running"){
    Write-Host "Hyper-V [OK]"
}Else{ 
Start ".\Hyper-V Setup.ps1}