# launch.ps1 — CLI interface to run extract_to_txt.py with prompts
.\venv\Scripts\activate

Write-Host "`nPDF-to-TXT Extractor" -ForegroundColor Cyan
Write-Host "======================" -ForegroundColor Cyan

# Prompt for PDF file
$pdfPath = Read-Host "Enter the FULL path to your PDF file (e.g. C:\Users\You\Documents\myfile.pdf)"

# Verify file exists
if (-Not (Test-Path $pdfPath)) {
    Write-Host "Error: File not found at $pdfPath" -ForegroundColor Red
    exit
}

# Prompt for output location
$outputPath = Read-Host "Enter output TXT path or press Enter to save in the same folder"

if ($outputPath -eq "") {
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($pdfPath)
    $parentDir = [System.IO.Path]::GetDirectoryName($pdfPath)
    $outputPath = Join-Path $parentDir "$fileName.txt"
    Write-Host "Output will be saved to: $outputPath" -ForegroundColor Yellow
}

# Run the Python script
python extract_to_txt.py --pdf "$pdfPath" --output "$outputPath"
