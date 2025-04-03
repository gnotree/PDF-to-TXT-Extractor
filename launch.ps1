# launch.ps1 — CLI interface for PDF-to-TXT conversion
.\venv\Scripts\activate

Write-Host "`nPDF-to-TXT Extractor" -ForegroundColor Cyan
Write-Host "======================" -ForegroundColor Cyan

# Ask for PDF
$pdfPath = Read-Host "Enter the FULL path to your PDF file"

if (-Not (Test-Path $pdfPath)) {
    Write-Host "❌ File not found at: $pdfPath" -ForegroundColor Red
    exit
}

# Ask for output destination
$outputPath = Read-Host "Enter output TXT path or press Enter to save in same folder"

if ($outputPath -eq "") {
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($pdfPath)
    $parentDir = [System.IO.Path]::GetDirectoryName($pdfPath)
    $outputPath = Join-Path $parentDir "$fileName.txt"
    Write-Host "Output will be saved to: $outputPath" -ForegroundColor Yellow
}

# Run extraction
python extract_to_txt.py --pdf "$pdfPath" --output "$outputPath"
