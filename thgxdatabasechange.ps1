#powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/thgxdatabasechange.ps1'))" 

write-host Stopping Service
Get-service ImageRight* | stop-service -force
write-host Removing File
write-host Downloading new file
Remove-item -path "C:\Program Files (x86)\ImageRight\Clients\imageright.desktop.exe.config" -Force
Remove-item -path "C:\Program Files (x86)\ImageRight\InstallerService\IRInstallerService.exe.config" -Force
Start-BitsTransfer -Source "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/thgx-IRInstallerService.exe.config" -Destination "C:\Program Files (x86)\ImageRight\InstallerService\IRInstallerService.exe.config"

Start-BitsTransfer -Source "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/imageright.desktop.exe.config" -Destination "C:\Program Files (x86)\ImageRight\Clients\imageright.desktop.exe.config"
write-host Starting Service
Get-service ImageRight* | Start-service
Get-service ImageRight*
