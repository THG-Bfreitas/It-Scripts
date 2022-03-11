$originalname = [System.Net.Dns]::GetHostName()
$hilbpcname = get-content C:\hilb\Hilb-pcname.txt
write-host $originalname is the original name
write-host Renaming pc to $hilbpcname
$username = $env:UserName
write-host $username
Rename-Computer -NewName $hilbpcname
