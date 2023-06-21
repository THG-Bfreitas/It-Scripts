#powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/guestrename.ps1'))" 


# Get the SID of the built-in Guest account
$guestAccountSid = (New-Object System.Security.Principal.NTAccount("Guest")).Translate([System.Security.Principal.SecurityIdentifier]).Value

# Rename the Guest account
Rename-LocalUser -SID $guestAccountSid -NewName "hilbguests"

# Verify the rename operation
$renamedAccount = Get-LocalUser | Where-Object { $_.SID -eq $guestAccountSid }
if ($renamedAccount -and $renamedAccount.Name -eq "hilbguests") {
    Write-Host "The built-in Guest account has been successfully renamed to 'hilbguests'."
} else {
    Write-Host "Failed to rename the built-in Guest account."
}
