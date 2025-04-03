# PDF-to-TXT Extractor

This tool extracts plain text from very large PDFs (e.g. a 5000-page Bible or medical records), with support for both native text extraction and OCR for scanned image pages. It's optimized for fresh Windows systems and assumes no prior installations.

## Why This Tool?

PDFs, especially scanned books and medical files, are difficult to convert into clean text. This tool solves that by:
- Extracting text from PDFs directly (when possible)
- Automatically running OCR (Tesseract) for image-based pages
- Outputting a clean `.txt` file ready for reading or training an LLM

---

## 📦 System Requirements

- Windows 10, 11, or Server 2022/2025
- Internet access to install packages
- Admin rights to use `winget` (built into Windows)

---

## 🔧 Why These Tools?

### ✅ Winget
- Native to modern Windows
- No extra scripts or installers like Chocolatey
- Used here to install Python, Git, and Tesseract OCR engine

### ✅ Python 3.11
- Faster and more efficient than 3.10
- Widely supported by modern machine learning and OCR libraries

### ✅ Git
- Makes cloning the repository simple and clean

### ✅ Tesseract
- Industry-standard OCR engine
- Converts image-based pages into machine-readable text

---

## ⚙️ Step-by-Step Installation

### Step 1 – Download or Clone the Repository

```powershell
git clone https://github.com/yourusername/pdf-to-txt-extractor.git
cd pdf-to-txt-extractor


Or download the ZIP and extract manually.

#### Step 2 – Run the Setup Script
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
.\setup.ps1
