### Universal Installer Created by Bfreitas 07/12/21 Contact for help####
#### Edit the Vars to utilize the script for any installer. ####
###Envoke Via CMD###
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/THG-Installer.PS1'))" 


###### Vars#####
$Path="C:\temp"
$MSI = "Splashtop_Streamer_Windows_DEPLOY_INSTALLER_v3.4.8.4_T52TXZYP54PX.exe"
$URL = "https://raw.githubusercontent.com/THG-Bfreitas/IRfiles/master/Splashtop_Streamer_Windows_DEPLOY_INSTALLER_v3.4.8.4_T52TXZYP54PX.exe"
$OutputURL = "C:\temp\Splashtop_Streamer_Windows_DEPLOY_INSTALLER_v3.4.8.4_T52TXZYP54PX.exe"
$Switches = "/qn"
$Msilogfile = "Splashtop_Streamer_Windows_DEPLOY_INSTALLER_v3.4.8.4_T52TXZYP54PX.exe.txt"
$scriptlogfile ="scriptlogs.txt"



####Decentralized Logging due to remote installation
Start-Transcript -Path $path\$scriptlogfile
Write-Host "everything will end up in $path\$scriptlogfile"

Write-host "Checking for folder"
####Folder check#####
if (!(Test-Path $Path))
{
New-Item -itemType Directory -Path $Path -Name $FolderName
}
else
{
cls
write-host "Folder already exists"
}
Write-host "Downloading $url"
##Download File Via $URL
Invoke-WebRequest -Uri "$URL" -OutFile "$outputURL"

Write-host "Starting MSI installation"
##Executing EXE
C:\temp\Splashtop_Streamer_Windows_DEPLOY_INSTALLER_v3.4.8.4_T52TXZYP54PX.exe prevercheck /S /I confirm_d=0,ignoressl=1,hidewindow=1

Stop-Transcript
