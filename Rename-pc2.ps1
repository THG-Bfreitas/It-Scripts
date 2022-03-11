$originalname = [System.Net.Dns]::GetHostName()
$username = “rampart\thgadmin”
$password = “n@kaJl3O0q&v"
$Credentials = New-Object System.Management.Automation.PSCredentical $Username,$Password
$hilbpcname = get-content C:\hilb\Hilb-pcname.txt
write-host $originalname is the original name
write-host Renaming pc to $hilbpcname

Rename-Computer -NewName "newname" -DomainCredential $Credentials -Force -restart

