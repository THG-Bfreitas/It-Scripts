#dynamic computer rename
$THGDomainuser = $(Get-WMIObject -class Win32_ComputerSystem | select username).username | split-path -Leaf
$THGDomainuser
$Dontuse =  "system"
new-item C:\hilb -itemtype directory -ErrorAction SilentlyContinue
$currentpcname = [System.Net.Dns]::GetHostName()
#Set the Agency 3 Digit Code
$THGSHORT =   "rpb"
cls
If((gwmi win32_computersystem -ea 0).pcsystemtype -ne 2)
{Write-Host "Machine is a Desktop" 
$computertype = "-D-" }
Else
{Write-Host "Machine is a Laptop" 
$computertype = "-L-" }

if(-not($THGDomainuser -eq $Dontuse)){

 Write-host "$($THGDomainuser) is being used as the username" }
 else
 { Write-host Found Invalid Username $dontuse Exiting script
EXIT 
}

$thgnew = $THGSHORT+$computertype+$THGDomainuser
$thgnew | Out-file C:\hilb\Hilb-pcname.txt
$currentpcname
write-host $thgnew is being set as computer name. Comptuer name will change on reboot.

#Rename-Computer -NewName $THGNew
