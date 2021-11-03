### Universal Installer Created by Bfreitas 07/12/21 Contact for help####
#### Edit the Vars to utilize the script for any installer. ####
###Envoke Via CMD###
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/THG-Installer.PS1'))" 


###### Vars#####
$Path="C:\temp"
$MSI = "SentinelInstaller_windows_64bit_v4_6_14_304.msi"
$URL = "https://raw.githubusercontent.com/THG-Bfreitas/IRfiles/0b1d75d5c4f7fbc73fd3e4541b4e6b6c9014f9a7/SentinelInstaller_windows_64bit_v4_6_14_304.msi"
$OutputURL = "C:\temp\SentinelInstaller_windows_64bit_v4_6_14_304.msi"
$Switches = "/qn"
$Msilogfile = "SentinelInstaller_windows_64bit_v4_6_14_304.msi.txt"
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
##Executing MSI 
#msiexec /i $path\$msi /l*v $path\$msilogfile $Switches 

Stop-Transcript
