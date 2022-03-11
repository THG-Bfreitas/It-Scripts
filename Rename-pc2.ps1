$originalname = [System.Net.Dns]::GetHostName()

$username = “rampart\thgadmin”
$password = ConvertTo-SecureString "n@kaJl3O0q&v" -AsPlainText -Force
$Credentials = new-object System.Management.Automation.PSCredential($username, $password)

$hilbpcname = get-content C:\hilb\Hilb-pcname.txt
write-host $originalname is the original name
write-host Renaming pc to $hilbpcname

Rename-Computer -NewName $hilbpcname -DomainCredential $Credentials -Force -restart
