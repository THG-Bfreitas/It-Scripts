# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/fslogix.ps1'))" 
# uninstall 


#Change URL to match latest Release
$Url1 = 'https://download.microsoft.com/download/c/4/4/c44313c5-f04a-4034-8a22-967481b23975/FSLogix_Apps_2.9.8440.42104.zip'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
New-Item -Path "C:" -Name "Hilb" -ItemType "directory" -ErrorAction SilentlyContinue
Write-Host "Attempting to download FSLogix..."
$File1 = 'C:\hilb\' + $(Split-Path -Path $Url1 -Leaf)
Invoke-WebRequest $Url1  -OutFile $File1 
Expand-Archive -Path $File1 -DestinationPath "C:\hilb\FSLogix" -Force
Start-Process -FilePath "C:\hilb\FSlogix\x64\Release\FSLogixAppsSetup.exe" -ArgumentList '/quiet /install'
