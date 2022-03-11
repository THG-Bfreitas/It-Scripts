$originalname = [System.Net.Dns]::GetHostName()
$hilbpcname = get-content C:\hilb\Hilb-pcname.txt
write-host $originalname is the original name
write-host Renaming pc to $hilbpcname
Rename-Computer -NewName $hilbpcname
