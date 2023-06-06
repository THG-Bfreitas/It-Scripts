
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/Nextivaone.ps1'))" 
# uninstall 

write-host Downloading nextivaone Installer
mkdir C:\hilb\ -ErrorAction SilentlyContinue
start-BitsTransfer -Source 'https://assets.nextiva.com/download/Nextiva-win.msi' -Destination C:\HILB\Nextiva-win.msi

Start-Process  "C:\HILB\Nextiva-win.msi"  -ArgumentList "/qn"
