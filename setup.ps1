# setup.ps1 — PDF-to-TXT Extractor Setup Script (april-03-2025 v-1.0)

Write-Host "`nInstalling Python 3.11, Git, and Tesseract with winget..." -ForegroundColor Cyan

# Install dependencies using winget
winget install --id Python.Python.3.11 -e --source winget
winget install --id Git.Git -e --source winget
winget install --id Tesseract.Tesseract -e --source winget

# Add Python Scripts to PATH in this session
$env:Path += ";$env:ProgramFiles\Python311\Scripts;$env:ProgramFiles\Python311\"

# Detect if conda is on the system and usable
$condaPath = Get-Command conda -ErrorAction SilentlyContinue
$pythonCmd = "python"

if ($condaPath) {
    Write-Host "`n⚠️ Detected Conda in environment." -ForegroundColor Yellow
    $pythonVersionOutput = & conda run -n base python --version
    if ($pythonVersionOutput -like "*3.11*") {
        Write-Host "✅ Conda Python 3.11 is available. Proceeding with Conda..." -ForegroundColor Green
        $pythonCmd = "conda run -n base python"
    } else {
        Write-Host "❌ Conda Python version is not 3.11. Falling back to system Python." -ForegroundColor Red
    }
}

# Create virtual environment
Write-Host "`nCreating virtual environment 'venv'..." -ForegroundColor Cyan
Invoke-Expression "$pythonCmd -m venv venv"

# Activate and install dependencies
.\venv\Scripts\activate

Write-Host "`nInstalling Python libraries from requirements.txt..." -ForegroundColor Cyan
pip install --upgrade pip
pip install -r requirements.txt

Write-Host "`n✅ Setup complete. You can now run 'launch.ps1' to extract from a PDF." -ForegroundColor Green

# Ask to create terminal alias
$addAlias = Read-Host "`nAdd terminal alias 'pdf2txt' to launch the tool from any PowerShell session? [Y/N]"

if ($addAlias -eq "Y") {
    $profilePath = $PROFILE
    if (-not (Test-Path $profilePath)) {
        New-Item -Type File -Path $profilePath -Force
    }

    $launchPath = (Resolve-Path .\launch.ps1).Path
    $aliasCmd = "Set-Alias pdf2txt `"$launchPath`""

    if (-not (Get-Content $profilePath | Select-String -SimpleMatch $aliasCmd)) {
        Add-Content -Path $profilePath -Value "`n# PDF-to-TXT alias`n$aliasCmd"
        Write-Host "`nAlias 'pdf2txt' added to your PowerShell profile." -ForegroundColor Green
        Write-Host "Restart PowerShell to use the 'pdf2txt' command." -ForegroundColor Yellow
    } else {
        Write-Host "`nAlias already exists in profile." -ForegroundColor Yellow
    }
}
else {
    Write-Host "`nAlias not added. You can still run launch.ps1 manually." -ForegroundColor Cyan
}
