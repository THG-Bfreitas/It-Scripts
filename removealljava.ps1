# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/removealljava.ps1'))" 
# uninstall 

#
$RegUninstallPaths = @(
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
    'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
)

$VersionsToKeep = @('5654654654654')

Get-CimInstance -ClassName 'Win32_Process' | Where-Object {$_.ExecutablePath -like '*Program Files\Java*'} | 
    Select-Object @{n='Name';e={$_.Name.Split('.')[0]}} | Stop-Process -Force
 
Get-process -Name *iexplore* | Stop-Process -Force -ErrorAction SilentlyContinue

$UninstallSearchFilter = {($_.GetValue('DisplayName') -like '*Java*') -and (($_.GetValue('Publisher') -eq 'Oracle Corporation')) -and ($VersionsToKeep -notcontains $_.GetValue('DisplayName'))}

# Uninstall unwanted Java versions and clean up program files
 
foreach ($Path in $RegUninstallPaths) {
    if (Test-Path $Path) {
        Get-ChildItem $Path | Where-Object $UninstallSearchFilter | 
       foreach { 
           
        Start-Process 'C:\Windows\System32\msiexec.exe' "/X$($_.PSChildName) /qn" -Wait
    
        }
    }
}
