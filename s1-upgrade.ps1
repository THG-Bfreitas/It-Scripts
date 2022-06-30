#powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/s1-upgrade.ps1'))"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Folder = "C:\Program Files\SentinelOne\Sentinel Agent 22.1.2.217\"

if (Test-Path -Path $Folder) {
    Write-host Sentinel one is current
} else {
    #updating S1
    Write-host Sentinel one is out of date
    Write-host Updating Sentinel One
    $SentinelSiteToken = "eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0wMTQuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImQzNDY1MDVjM2U3M2RmNjEifQ==";
$S1URL64 = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/SentinelInstaller_windows_64bit_v22_1_2_217.msi";
$S1File64 = "SentinelInstaller_windows_64bit_v22_1_2_217.msi";
New-Item -ItemType Directory -Path "C:\temp\intune\S1" -ErrorAction SilentlyContinue
Start-BitsTransfer -Source $S1URL64 -Destination "C:\temp\intune\S1\$S1File64"
Start-Process C:\temp\intune\S1\SentinelInstaller_windows_64bit_v22_1_2_217.msi -ArgumentList '/q /norestart SITE_TOKEN="eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0wMTQuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImQzNDY1MDVjM2U3M2RmNjEifQ=="'

}
