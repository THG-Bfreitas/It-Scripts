### Universal Installer Created by Bfreitas 07/12/21 Contact for help####
#### Edit the Vars to utilize the script for any installer. ####
###Envoke Via CMD###
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/THG-Installer.PS1'))" 


###### Vars#####
$Path="C:\temp"
$ = "SentinelInstaller-x64_windows_64bit_v4_6_14_304.exe"
$URL = "https://raw.githubusercontent.com/THG-Bfreitas/IRfiles/master/SentinelInstaller-x64_windows_64bit_v4_6_14_304.exe"
$OutputURL = "C:\temp\SentinelInstaller-x64_windows_64bit_v4_6_14_304.exe"
$Switches = "/qn"
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
C:\temp\SentinelInstaller-x64_windows_64bit_v4_6_14_304.exe /SITE_TOKEN=eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0wMTQuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImQzNDY1MDVjM2U3M2RmNjEifQ== /SILENT

Stop-Transcript
