#office 365 32bit conversion


$DownloadURL = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/setup.exe"
$DownloadURL2 = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/configuration.xml"
$DownloadURL3 = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/uninstall.xml"

mkdir C:\hilb\ -ErrorAction SilentlyContinue

# Download Installer to 'C:\HILB\'
Invoke-RestMethod -Uri $DownloadURL -OutFile C:\hilb\setup.exe
Invoke-RestMethod -Uri $DownloadURL2 -OutFile C:\hilb\configuration.xml
Invoke-RestMethod -Uri $DownloadURL3 -OutFile C:\hilb\uninstall.xml
#Sleep for download to complete

# Silently Install the Application

#Uninstall Office
Write-host Uninstalling Office

Start-Process  C:\hilb\setup.exe -ArgumentList "/configure C:\hilb\uninstall.xml"
Start-sleep -seconds 300

#install Office with 32bit configuration
Write-host Installing Office
Start-Process  C:\hilb\setup.exe -ArgumentList "/configure C:\hilb\configuration.xml"
Write-host Installation completed.
