
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/AMS360.ps1'))" 
# uninstall 

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$software =  "ams360"
$DownloadURL = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/AMS360ClientInstallerRev11.msi"
Write-host Checking for $software


$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null
If(-Not $installed) {
Write-Host "'$software' NOT is installed."
Write-host "Downloading $($software)"
(New-Object System.Net.WebClient).DownloadFile($DownloadURL, "C:\hilb\AMS360ClientInstallerRev11.msi")
Start-Process  "C:\hilb\AMS360ClientInstallerRev11.msi"  -ArgumentList "/q"
Write-host "C:\hilb\AMS360ClientInstallerRev11.msi Installation completed"
} else { 
Write-host $software already installed 

}

$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null
If(-Not $installed) {Write-host Software Installation Failed}
