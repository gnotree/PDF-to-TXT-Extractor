# setup.ps1 — PDF-to-TXT Extractor Bootstrap Script (Windows 10/11/Server 2025)
# Uses winget to install Python 3.11, Git, and Tesseract OCR

Write-Host "`n📦 Installing system dependencies with winget..." -ForegroundColor Cyan

# Install Python 3.11, Git, and Tesseract using native Windows package manager
winget install --id Python.Python.3.11 -e --source winget
winget install --id Git.Git -e --source winget
winget install --id Tesseract.Tesseract -e --source winget

# Refresh session environment (for virtualenv activation)
$env:Path += ";$env:ProgramFiles\Python311\Scripts;$env:ProgramFiles\Python311\"

Write-Host "`n🐍 Creating isolated Python environment..." -ForegroundColor Cyan
python -m venv venv
.\venv\Scripts\activate

Write-Host "`n⬆️ Upgrading pip and installing required Python libraries..." -ForegroundColor Cyan
pip install --upgrade pip
pip install -r requirements.txt

Write-Host "`n✅ Setup complete. You're ready to extract text from your PDFs." -ForegroundColor Green
Write-Host "`nTo begin: run extract_to_txt.py with your PDF." -ForegroundColor Yellow
