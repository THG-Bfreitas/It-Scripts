
$username = "rampart\thgadmin"
$password = ConvertTo-SecureString "n@kaJl3O0qv" -AsPlainText -Force
$Credentials = new-object System.Management.Automation.PSCredential($username, $password)

Rename-Computer -NewName rbp-l-dlupo -DomainCredential $Credentials -Force
