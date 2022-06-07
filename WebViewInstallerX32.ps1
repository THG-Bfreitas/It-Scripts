$DownloadURL = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/MicrosoftEdgeWebView2RuntimeInstallerX86.exe"
Write-host Starting Webview 2 Runtime 32bit installer download.
Start-BitsTransfer -Source $DownloadURL -Destination "C:\hilb\MicrosoftEdgeWebView2RuntimeInstallerX86.exe" 
Start-Sleep -Seconds 60
Start-Process  "C:\HILB\MicrosoftEdgeWebView2RuntimeInstallerX86.exe"  -ArgumentList "/silent /install"
Write-host "MicrosoftEdgeWebView2RuntimeInstallerX86.exe Installation completed"
