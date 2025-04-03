# Installs Python 3.11, Git, and Tesseract using winget
Write-Host "`nInstalling system dependencies with winget..." -ForegroundColor Cyan
winget install --id Python.Python.3.11 -e --source winget
winget install --id Git.Git -e --source winget
winget install --id Tesseract.Tesseract -e --source winget

$env:Path += ";$env:ProgramFiles\Python311\Scripts;$env:ProgramFiles\Python311\"

Write-Host "`nCreating Python virtual environment..." -ForegroundColor Cyan
python -m venv venv
.\venv\Scripts\activate

Write-Host "`nInstalling Python requirements..." -ForegroundColor Cyan
pip install --upgrade pip
pip install -r requirements.txt

Write-Host "`nSetup complete. Run 'launch.ps1' to extract from PDF." -ForegroundColor Green
