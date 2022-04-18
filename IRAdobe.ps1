$DownloadURL = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/IRAdobePlugin.msi"
$software = "IR Adobe"
$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null

If(-Not $installed) {
	Write-Host "'$software' NOT is installed."

mkdir C:\hilb\ -ErrorAction SilentlyContinue
# Download Installer to 'C:\HILB\'
Invoke-RestMethod -Uri $DownloadURL -OutFile C:\hilb\IRAdobePlugin.msi
#Sleep for download to complete
Start-sleep -seconds 60

# Silently Install the Application
Start-Process  C:\HILB\IRAdobePlugin.msi -ArgumentList "/quiet"

#Delete the installer
Remove-Item 'C:\HILB\IRAdobePlugin.msi'
Write-host "HilbCwInstaller.msi Installation script completed"
Start-Process  -ArgumentList 

} else {
	Write-Host "'$software' is installed."
    write-host "Exiting Script"
}
