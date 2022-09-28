
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/fslogixupdate.ps1'))" 
# uninstall 


cd 'C:\Program Files\FSLogix\Apps'

$current = "2.9.8228.50276"
$version = .\frx version
$version | Set-Content C:\hilb\fslogixversion.log
$FSVER = Get-Content C:\hilb\fslogixversion.log | Select -First 1


$CharArray =$FSVER.Split(":")
$CharArray[1]
$FSVER = $CharArray[1]
$FSVER = $FSVER.Substring(1)
$FSVER

if ($FSVER -eq $current) {write-host $FSVER Current} else  {
Write-host FSlogix is out of date running $FSVER
Write-host Installing updates

#download file
Invoke-RestMethod -Uri https://download.microsoft.com/download/d/1/9/d190de51-f1c1-4581-9007-24e5a812d6e9/FSLogix_Apps_2.9.8228.50276.zip  -OutFile C:\hilb\FSLogix_Apps_2.9.8228.50276.zip

#extract Zip
Expand-Archive -LiteralPath "C:\hilb\FSLogix_Apps_2.9.8228.50276.zip" -DestinationPath C:\hilb\FSLogix_Apps_2.9.8228.50276\ -force

$software = "Microsoft FSLogix Apps*"
$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null
$installed | Out-File -FilePath C:\hilb\FSloGixLog.txt -Append

Start-Process C:\hilb\FSLogix_Apps_2.9.8228.50276\x64\Release\FSLogixAppsSetup.exe -Args "/install /quiet /norestart"


$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null
$installed | Out-File -FilePath C:\hilb\FSloGixLog.txt -Append


}
#Rechecking Version
cd 'C:\Program Files\FSLogix\Apps'

$current = "2.9.8228.50276"
$version = .\frx version
$version | Set-Content C:\hilb\fslogixversion.log
$FSVER = Get-Content C:\hilb\fslogixversion.log | Select -First 1


$CharArray =$FSVER.Split(":")
$CharArray[1]
$FSVER = $CharArray[1]
$FSVER = $FSVER.Substring(1)
$FSVER
if ($FSVER -eq $current) {write-host $FSVER Current} else  { Write-host Installation Failed}
