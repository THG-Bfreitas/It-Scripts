# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/zoomperuser.ps1'))" 
# uninstall 

# Specify the exclude folder path
$excludeFolder = "C:\hilb\exclude\"

# Specify the log file path
$logFile = "C:\hilb\HilbRemediation.log"

# Check if the exclude folder exists
if (Test-Path -Path $excludeFolder -PathType Container) {
    # Get the creation date of the folder
    $creationDate = (Get-Item -Path $excludeFolder).CreationTime

    # Get the current date
    $currentDate = Get-Date

    # Calculate the number of days since the folder was created
    $daysSinceCreation = ($currentDate - $creationDate).Days


  # Log that the exclude folder is not older than 30 days
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logMessage = "$timestamp - Checking Exclude folder age ($excludeFolder)"
Write-Host $logMessage
Add-Content -Path $logFile -Value $logMessage


    # Check if the folder is older than 30 days
    if ($daysSinceCreation -gt 30) {
        # Delete the exclude folder
        Remove-Item -Path $excludeFolder -Recurse -Force

        # Create a new exclude folder
        New-Item -Path $excludeFolder -ItemType Directory | Out-Null

        # Log the actions
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logMessage = "$timestamp - Exclude folder ($excludeFolder) was older than 30 days. Deleted and recreated the folder."
        Write-Host $logMessage
        Add-Content -Path $logFile -Value $logMessage
    }
    else {
        # Log that the exclude folder is not older than 30 days
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logMessage = "$timestamp - Exclude folder ($excludeFolder) is not older than 30 days. No action taken."
        Write-Host $logMessage
        Add-Content -Path $logFile -Value $logMessage
    }
}
else {
    # Create the exclude folder if it doesn't exist
    New-Item -Path $excludeFolder -ItemType Directory | Out-Null

    # Log the creation of the exclude folder
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "$timestamp - Exclude folder ($excludeFolder) was not found. Created the folder."
    Write-Host $logMessage
    Add-Content -Path $logFile -Value $logMessage
}




# Create the folder C:\hilb\exclude if it doesn't exist
$excludeFolder = "C:\hilb\exclude"
if (-not (Test-Path -Path $excludeFolder -PathType Container)) {
    New-Item -Path $excludeFolder -ItemType Directory | Out-Null
    Write-Host "Created folder: $excludeFolder"
}


# Recursive function to search for the file and move the folder, logging the operations with timestamps
function SearchAndMoveFile($directory, $filename) {
    # Get all files in the current directory
    $files = Get-ChildItem -Path $directory -Filter $filename -File -ErrorAction SilentlyContinue -force


    # Check if the file was found in the current directory
    if ($files.Count -gt 0) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logMessage = "$timestamp - $filename found in directory: $($directory)"
        Write-Host $logMessage
        Write-Output $logMessage | Out-File -Append -FilePath $logFile

        $logMessage = "$timestamp - Full path: $($files.FullName)"
        Write-Host $logMessage
        Write-Output $logMessage | Out-File -Append -FilePath $logFile
        
        # Move the entire folder to C:\hilb\exclude
        $folderName = Split-Path -Path $files.FullName -Parent
        $destination = Join-Path -Path $excludeFolder -ChildPath (Split-Path -Leaf $folderName)
        Move-Item -Path $folderName -Destination $destination -Force
        $logMessage = "$timestamp - Moved folder to: $destination"
        Write-Host $logMessage
        Write-Output $logMessage | Out-File -Append -FilePath $logFile
    }

    # Recursively search subdirectories
    $subdirectories = Get-ChildItem -Path $directory -Directory -ErrorAction SilentlyContinue -force

    foreach ($subdirectory in $subdirectories) {
        SearchAndMoveFile $subdirectory.FullName $filename
    }

}


# Specify the starting directory
$startingDirectory = "C:\Users\"

#Searching for zoom
$filename = "zoom.exe"


# Specify the log file path
$logFile = "C:\hilb\HilbRemediation.log"

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logMessage = "$timestamp - $filename searching in directory: $($startingDirectory)"
Write-Host $logMessage
Write-Output $logMessage | Out-File -Append -FilePath $logFile


# Start the search from the specified directory
SearchAndMoveFile $startingDirectory $filename

$logMessage = "$timestamp - $filename search completed"
Write-Host $logMessage
Write-Output $logMessage | Out-File -Append -FilePath $logFile

#Searching for Chrome
$filename = "chrome.exe"

# Specify the log file path
$logFile = "C:\hilb\HilbRemediation.log"

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logMessage = "$timestamp - $filename searching in directory: $($startingDirectory)"
Write-Host $logMessage
Write-Output $logMessage | Out-File -Append -FilePath $logFile
SearchAndMoveFile $startingDirectory $filename


$logMessage = "$timestamp - $filename search completed"
Write-Host $logMessage
Write-Output $logMessage | Out-File -Append -FilePath $logFile


#Searching for firefox
$filename = "firefox.exe"


# Specify the log file path
$logFile = "C:\hilb\HilbRemediation.log"

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logMessage = "$timestamp - $filename searching in directory: $($startingDirectory)"
Write-Host $logMessage
Write-Output $logMessage | Out-File -Append -FilePath $logFile

SearchAndMoveFile $startingDirectory $filename


$logMessage = "$timestamp - $filename search completed"
Write-Host $logMessage
Write-Output $logMessage | Out-File -Append -FilePath $logFile
