# PDF-to-TXT Extractor

A command-line tool to extract clean, readable text from massive PDFs (like the 5000-page Bible or medical documents). Supports both native PDF extraction and OCR using Tesseract for scanned/image-based PDFs.

---

## Why This Tool?

PDFs—especially scanned books or health records—are often difficult to convert into useful text formats. This tool solves that by:
- Extracting embedded text where possible using PyMuPDF
- Falling back to OCR via Tesseract for scanned images
- Dumping everything into a plain `.txt` file

---

## System Requirements

- Windows 10, 11, or Server 2022/2025
- Winget (built into Windows) for package installation
- Admin rights for setup
- Python 3.11, Git, and Tesseract (installed automatically)

---

## Why These Tools?

- **Winget**: Native to Windows. Eliminates the need for external package managers like Chocolatey.
- **Python 3.11**: Modern, faster, and fully compatible with the tool's dependencies.
- **Git**: Makes downloading and maintaining this project dead simple.
- **Tesseract**: OCR engine used to extract text from image-based PDF pages.

---

## Step-by-Step Installation

### 1. Clone the Repository or Download ZIP

```powershell
git clone https://github.com/yourusername/pdf-to-txt-extractor.git
cd pdf-to-txt-extractor
