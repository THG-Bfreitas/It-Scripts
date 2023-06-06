
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/Nextivaone.ps1'))" 
# uninstall 



$software =  "Nextiva App"
$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null
If(-Not $installed) {
Write-Host "'$software' NOT is installed."


} else { Write-host $software Found
Start-Process  "C:\windows\System32\msiexec.exe"  -ArgumentList '/x 3D9EBDA44FD9448498CCEAD77662DDB8 /q'

}

write-host Downloading nextivaone Installer
mkdir C:\hilb\ -ErrorAction SilentlyContinue
start-BitsTransfer -Source 'https://assets.nextiva.com/download/Nextiva-win.msi' -Destination C:\HILB\Nextiva-win.msi

Start-Process  "C:\HILB\Nextiva-win.msi"  -ArgumentList "/qn"
