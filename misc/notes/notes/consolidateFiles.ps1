# Define source and destination directories
$sourceDir = "C:\Users\rebec\Downloads\modeling\files"
$destinationDir = "C:\Users\rebec\Downloads\modeling\filesNew"

# Check if the destination directory exists, if not, create it
if (!(Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir
}

# Get all .pdf files from all subdirectories in the source directory
$pdfFiles = Get-ChildItem -Path $sourceDir -Recurse -Filter *.pdf

# Copy each .pdf file to the destination directory
foreach ($file in $pdfFiles) {
    Copy-Item -Path $file.FullName -Destination $destinationDir
}

Write-Host "All .pdf files have been copied to $destinationDir"