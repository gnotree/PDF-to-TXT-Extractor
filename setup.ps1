# setup.ps1 — handles system Python or Conda Python safely

Write-Host "`nInstalling Python, Git, and Tesseract with winget..." -ForegroundColor Cyan

# Ensure winget installs core dependencies
winget install --id Python.Python.3.11 -e --source winget
winget install --id Git.Git -e --source winget
winget install --id Tesseract.Tesseract -e --source winget

# Check if Conda is installed and on PATH
$condaPath = Get-Command conda -ErrorAction SilentlyContinue
$pythonCmd = "python"

if ($condaPath) {
    Write-Host "`n⚠️ Detected Conda in environment." -ForegroundColor Yellow
    # Use conda python only if it's version >= 3.11
    $condaVersion = conda info --base
    $pythonVersionOutput = & conda run -n base python --version
    if ($pythonVersionOutput -like "*3.11*") {
        Write-Host "✅ Conda Python 3.11 is available. Proceeding with Conda..." -ForegroundColor Green
        $pythonCmd = "conda run -n base python"
    } else {
        Write-Host "❌ Conda environment is not using Python 3.11. Falling back to system Python." -ForegroundColor Red
    }
}

# Create and activate virtualenv using selected python
Write-Host "`nCreating Python virtual environment..." -ForegroundColor Cyan
Invoke-Expression "$pythonCmd -m venv venv"

.\venv\Scripts\activate

Write-Host "`nInstalling required Python libraries..." -ForegroundColor Cyan
pip install --upgrade pip
pip install -r requirements.txt

Write-Host "`n✅ Setup complete. Run 'launch.ps1' to begin." -ForegroundColor Green
