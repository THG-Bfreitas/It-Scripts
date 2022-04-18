$DownloadURL = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/IRAdobePlugin.msi"
$software = "imageright adobe plug-in"
$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null

If(-Not $installed) {
	Write-Host "'$software' NOT is installed."
	Write-Host "'$software' is being installed."
mkdir C:\hilb\ -ErrorAction SilentlyContinue
# Download Installer to 'C:\HILB\'
Invoke-RestMethod -Uri $DownloadURL -OutFile C:\hilb\IRAdobePlugin.msi
#Sleep for download to complete


# Silently Install the Application
Start-Process  C:\HILB\IRAdobePlugin.msi -ArgumentList "/quiet"

} else {
	Write-Host "'$software' is installed."
    write-host "Exiting Script"
}
