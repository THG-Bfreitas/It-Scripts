### Universal Installer Created by Bfreitas 07/12/21 Contact for help####
#### Edit the Vars to utilize the script for any installer. ####
###Envoke Via CMD###
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/THG-EXE-Installer.PS1'))" 


###### Vars#####
$Path="C:\temp"
$exe = "QualysCloudAgent.exe"
$URL = "https://raw.githubusercontent.com/THG-Bfreitas/IRfiles/master/SentinelInstaller-x64_windows_64bit_v4_6_14_304.exe"
$OutputURL = "C:\temp\QualysCloudAgent.exe"
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

Write-host "Starting EXE installation"
##Executing EXE
QualysCloudAgent.exe CustomerId={0fc184d4-664e-73f8-82c6-ef818818f7ca} ActivationId={9516aef8-b335-4e0e-a8b0-f0365452f452} WebServiceUri=https://qagpublic.qg3.apps.qualys.com/CloudAgent/


Stop-Transcript
