New-Item -Path "c:\" -Name "hilb" -ItemType "directory" -ErrorAction SilentlyContinue

# Download AT Installer to 'C:\HILB\'
Invoke-WebRequest -Uri "http://HelpdeskSupport841847805.servicedesk.atera.com/GetAgent/Msi/?customerId=120&integratorLogin=bfreitas%40hilbgroup.com&customerName=Rampart%20VDA" -OutFile "C:\HILB\setup.msi"
#Sleep for download to complete
Start-sleep -seconds 10

# Silently Install the Application
Start-Process msiexec.exe -Wait -ArgumentList "/i C:\hilb\setup.msi /qn"
