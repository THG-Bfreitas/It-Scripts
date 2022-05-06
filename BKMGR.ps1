$DownloadURL = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/nable.exe"

$software = "Backup Manager"
$installed = (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.Displayname -match $software }) -ne $null

If(-Not $installed) {
    Write-Host "'$software' NOT is installed."
mkdir C:\hilb\ -ErrorAction SilentlyContinue
# Download Installer to 'C:\HILB\'
Invoke-RestMethod -Uri $DownloadURL -OutFile "C:\hilb\bm#d50d62b5-ef0a-433e-9812-fe32fde1a8b5#.exe"


# Silently Install the Application
Start-Process  "C:\HILB\bm#d50d62b5-ef0a-433e-9812-fe32fde1a8b5#.exe" -ArgumentList "/silent"
#Sleep for installation to complete
Start-sleep -seconds 60
#Delete the installer

Write-host "Nable Installation script completed"
}
