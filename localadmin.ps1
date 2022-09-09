# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/localadmin.ps1'))" 
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
$user = (Get-CimInstance -ClassName Win32_ComputerSystem).Username
Write-host "Adding $($user) to Administrators group"

Add-LocalGroupMember -Member $($user) -Group Administrators 
