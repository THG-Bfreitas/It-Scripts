# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/mimecast.ps1'))" 
$DownloadURL = "https://601905.app.netsuite.com/core/media/media.nl?id=138573912&c=601905&h=cpHZsyktFe1XO9dka6shNzIUxxqxHqdXpXUsd35C5HrG47b_&_xt=.zip"

$software = "Mimecast"
$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null

If(-Not $installed) {
	Write-Host "'$software' Outlook plugin Not found on computer, installing."


mkdir C:\hilb\ -ErrorAction SilentlyContinue
# Download Installer to 'C:\HILB\'


Invoke-RestMethod -Uri $DownloadURL -OutFile C:\hilb\mimecast.zip



#Sleep for download to complete


#extact zip
remove-item C:\hilb\mimecast\ -recurse -ErrorAction SilentlyContinue
Expand-Archive -LiteralPath "C:\hilb\mimecast.zip" -DestinationPath C:\hilb\mimecast\ -force

# Silently Install the Application

Start-Process 'C:\HILB\mimecast\Mimecast for outlook 7.10.1.133 (x64).msi' -ArgumentList '/qn /L*V C:\hilb\mimecast\mimecast.log'

Write-host $software Outlook plugin has been installed

} else { Write-host $software Outlook plugin is already installed}
