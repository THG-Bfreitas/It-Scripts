# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/zoomfullrepair.ps1'))" 

$cleanzoomURL = "https://assets.zoom.us/docs/msi-templates/CleanZoom.zip"
$zoomInstallerURL = "https://zoom.us/client/latest/ZoomInstallerFull.msi?archType=x64"
$dstRoot = 'C:\Temp\ZoomCleanup'
$cleanZoomPath = ($dstRoot + "\CleanZoom.zip")
$zoomPath = ($dstRoot + "\ZoomInstallerFull.msi")
$DataStamp = get-date -Format yyyyMMddTHHmmss
$logFile = '{0}-{1}.log' -f $dstRoot,$DataStamp
$transfers = @(
    [pscustomobject]@{
        Source = $cleanzoomURL
        Destination = $cleanZoomPath
    },
    [pscustomobject]@{
        Source = $zoomInstallerURL
        Destination = $zoomPath
    }
)
    if (!(Test-Path $dstRoot)) {
        New-Item -ItemType Directory -Path $dstRoot -Force
    } else {
        Remove-Item $dstRoot -Force -Recurse
        New-Item -ItemType Directory -Path $dstRoot -Force
    }
    
    Write-Verbose "Downloading Packages"
    $transfers | Start-BitsTransfer
    Write-Verbose "Successfully Downloaded Packages"
    
    Write-Verbose "Extracting CleanZoom"
    Expand-Archive -LiteralPath $cleanZoomPath -DestinationPath $dstRoot
    
    Write-Verbose "Running Clean Zoom"
    Start-Process -FilePath ($dstRoot + "\CleanZoom.exe") 
    Write-Verbose "Finished Running Clean Zoom"
    
    Write-Verbose "Installing Zoom Client"

    $MSIArguments = @(
        "/i"
        ('"{0}"' -f $zoomPath)
        "/qn"
        'zConfig="nogoogle=1"'
        'ZConfig="nofacebook=1"'
        "ZoomAutoUpdate=True"
        "zNoDesktopShortCut=True"
        "/L*v $logFile"
    )
   $msiReturn = Start-Process -FilePath "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow -PassThru
   
   Remove-Item -Path $dstRoot -Force -Recurse -ErrorAction SilentlyContinue

If (@(0,3010) -contains $msiReturn.exitcode) { 
    write-host "install successful"

} else {
    Write-Output "Error Installing Zoom"

}
