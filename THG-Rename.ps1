
$username = "rampart\thgadmin"
$password = ConvertTo-SecureString "" -AsPlainText -Force
$Credentials = new-object System.Management.Automation.PSCredential($username, $password)

Rename-Computer -NewName rbp-l-dlupo -DomainCredential $Credentials -Force
