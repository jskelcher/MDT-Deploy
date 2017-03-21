. .\Variables.ps1
Write-Host "Checking Environment..."
Function Test-Admin(){


}


Function Test-Powershell(){
    If($PSVersion.Major -ge "5") {
        Write-Host "PowerShell [OK]"
    } Else {
        Write-Host "Powershell [FAIL]"
    }
}


Function Test-HyperV(){
    $HVEnabled = (Get-WindowsOptionalFeature -Online | select featurename | Where FeatureName -Like *Hyper*)
    If($HVEnabled.state -eq 'disabled') {
        Write-Host "Hyper-V [FAILED]"
        Start ".\Hyper-V Setup.ps1"
    } Else { 
    Write-Host "Hyper-V [OK]"
    }
}
#Test-Admin
Test-Powershell
Test-HyperV