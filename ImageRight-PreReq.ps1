#Checking if server. 
$OSVersion = (get-itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ProductName).ProductName
Write-host Checking if computer is a server
If($OSVersion -ilike "*Server*")
{
Write-Host "Stopping install It's Server!"
exit
}
Else
{
cls
Write-Host "Okay, Not A server"
}


#Dot Net 3.5 Check
$software =  "Dot Net 3.5"
$installed = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5\*' | Where { $_.Install-ge 1 }) -ne $null

If(-Not $installed) {
#Enabling Dot Net 3.5
    Write-Host "'$software' NOT is installed."
Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3"

} else { Write-host $software already installed }


#Dot Net 4.8
mkdir C:\hilb\ -ErrorAction SilentlyContinue
$software =  "Dot Net 4.8"
$installed = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\*' | Where { $_.Version -ge 4 }) -ne $null

If(-Not $installed) {
    Write-Host "'$software' NOT is installed."
mkdir C:\hilb\ -ErrorAction SilentlyContinue
$DownloadURL = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/ndp48-x86-x64-allos-enu.exe"
Write-host "Downloading $($software)"
Start-BitsTransfer -Source $DownloadURL -Destination "C:\hilb\ndp48-x86-x64-allos-enu.exe" 
Write-host Waiting for download to finish
Start-Sleep -Seconds 60
Start-Process  "C:\HILB\ndp48-x86-x64-allos-enu.exe"  -ArgumentList "/q /norestart"
Write-host "$($software) has been installed"
} else { Write-host $software already installed }

#webview webview 2 -32bit (not 64)
$software =  "Webview 2 32bit"
$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null
If(-Not $installed) {
Write-Host "'$software' NOT is installed."
Write-host "Downloading $($software)"
$DownloadURL = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/MicrosoftEdgeWebView2RuntimeInstallerX86.exe"
Write-host "Downloading $($software)"
Write-host Waiting for download to finish
Start-BitsTransfer -Source $DownloadURL -Destination "C:\hilb\MicrosoftEdgeWebView2RuntimeInstallerX86.exe" 
Start-Sleep -Seconds 60
Start-Process  "C:\HILB\MicrosoftEdgeWebView2RuntimeInstallerX86.exe"  -ArgumentList "/silent /install"
Write-host "MicrosoftEdgeWebView2RuntimeInstallerX86.exe Installation completed"
} else { Write-host $software already installed }
