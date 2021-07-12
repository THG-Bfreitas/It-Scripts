###Envoke Via CMD###
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" 


###### Vars#####
$Path="C:\temp"
$MSI = "Sagitta.launcher.msi"
$URL = "https://support2.vertafore.com/Repository/Documentation/DWN311/Sagitta.Launcher.msi"
$OutputURL = "C:\temp\Sagitta.launcher.msi"
$Switches = "/qn"
$Msilogfile = "Sagitta.launcher.log.txt"

####Decentralized Logging due to remote installation
$Logfile = "C:\Temp\Logs\$(gc env:computername).log"

Function LogWrite
{
   Param ([string]$logstring)

   Add-content $Logfile -value $logstring
}


####Folder check#####
if (!(Test-Path $Path))
{
New-Item -itemType Directory -Path $Path -Name $FolderName
}
else
{
cls
write-host "Folder already exists"
}

##Download File Via $URL
Invoke-WebRequest -Uri "$URL" -OutFile "$outputURL"

##Executing MSI 
msiexec /i $path\$msi /l*v $path\$msilogfile $Switches 

