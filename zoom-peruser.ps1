# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/It-Scripts/main/zoom-peruser.ps1'))" 
taskkill /f /im zoom.exe

# Create the folder C:\hilb\exclude if it doesn't exist
$excludeFolder = "C:\hilb\exclude"
if (-not (Test-Path -Path $excludeFolder -PathType Container)) {
    New-Item -Path $excludeFolder -ItemType Directory | Out-Null
    Write-Host "Created folder: $excludeFolder"
}

# Specify the starting directory
$startingDirectory = "C:\Users\"

# Specify the filename to search for
$filename = "zoom.exe"

# Specify the log file path
$logFile = Join-Path -Path $excludeFolder -ChildPath "HilbRemediation.log"

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logMessage = "$timestamp - $filename searhing in directory: $($startingDirectory)"
Write-Host $logMessage
Write-Output $logMessage | Out-File -Append -FilePath $logFile


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

# Start the search from the specified directory
SearchAndMoveFile $startingDirectory $filename
