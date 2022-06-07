Write-host "Downloading $($software)"
$DownloadURL = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/MicrosoftEdgeWebView2RuntimeInstallerX86.exe"
Write-host Waiting for download to finish
Start-BitsTransfer -Source $DownloadURL -Destination "C:\hilb\MicrosoftEdgeWebView2RuntimeInstallerX86.exe" 
Start-Sleep -Seconds 60
Start-Process  "C:\HILB\MicrosoftEdgeWebView2RuntimeInstallerX86.exe"  -ArgumentList "/silent /install"
Write-host "MicrosoftEdgeWebView2RuntimeInstallerX86.exe Installation completed"
