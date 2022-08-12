		# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/MimecastUni.ps1'))" 

    write-host "64bit office found"
		$url64 = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/Mimecast-x64.msi"
		write-host "Downloading 64bit plugin"
		Start-BitsTransfer -Source $url64 -Destination "c:\intune\mimecast\Mimecast-x64.msi"
Write-host Installation Starting, closing outlook
taskkill /im outlook.exe /f
		Start-Process  "c:\intune\mimecast\Mimecast-x64.msi"   -ArgumentList "/q"

		write-host "32bit office found"
		$url32 = "https://eusthginfrastructure.blob.core.windows.net/thg-remediation-scripts/Mimecast-x86.msi"
		write-host "Downloading 32bit plugin"
		Start-BitsTransfer -Source $url32 -Destination "c:\intune\mimecast\Mimecast-x86.msi"
Write-host Installation Started
Write-host Installation Starting, closing outlook
taskkill /im outlook.exe /f
        Start-Process  "c:\intune\mimecast\Mimecast-x86.msi"   -ArgumentList "/q"
