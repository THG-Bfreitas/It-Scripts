Write-host Downloading Atera

Start-BitsTransfer -Source "https://HelpdeskSupport841847805.servicedesk.atera.com/GetAgent/Msi/?customerId=95&integratorLogin=bfreitas%40hilbgroup.com&customerName=Rampart%20-%20Brokerage" -Destination "C:\hilb\atera.msi"
Write-host Installing Atera

Start-Process 'c:\hilb\atera.msi' -ArgumentList '/qn  IntegratorLogin=bfreitas@hilbgroup.com CompanyId=1'

write-host Stopping Service
Get-service ImageRight* | stop-service -force
write-host Removing File
write-host Downloading new file
Remove-item -path "C:\Program Files (x86)\ImageRight\InstallerService\IRInstallerService.exe.config" -Force
Start-BitsTransfer -Source "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/thgx-IRInstallerService.exe.config" -Destination "C:\Program Files (x86)\ImageRight\InstallerService\IRInstallerService.exe.config"
write-host Starting Service
Get-service ImageRight* | Start-service
Get-service ImageRight*
