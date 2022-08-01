$software =  "Acrobat Reader*"
$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null
If(-Not $installed) {
Write-Host "'$software' NOT is installed."
Write-host "Downloading $($software)"
$DownloadURL = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/AcroRdrDC2200120169_en_US.exe"
Invoke-RestMethod -Uri $DownloadURL -OutFile "C:\HILB\AcroRdrDC2200120169_en_US.exe" 
Start-Process  "C:\HILB\AcroRdrDC2200120169_en_US.exe"  -ArgumentList "/sAll /rs /msi EULA_ACCEPT=YES"
Write-host "MicrosoftEdgeWebView2RuntimeInstallerX86.exe Installation completed"
} else { Write-host $software already installed }
