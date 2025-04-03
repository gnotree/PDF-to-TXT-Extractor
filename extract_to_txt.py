import fitz  # PyMuPDF
import pytesseract
from PIL import Image
from tqdm import tqdm
import argparse
import io

# Optional: set manually if needed
# pytesseract.pytesseract.tesseract_cmd = r"C:\Program Files\Tesseract-OCR\tesseract.exe"

def extract_text_from_page(page):
    text = page.get_text()
    if text.strip():
        return text
    pix = page.get_pixmap(dpi=300)
    img = Image.open(io.BytesIO(pix.tobytes()))
    return pytesseract.image_to_string(img)

def extract_text_from_pdf(pdf_path, output_path):
    doc = fitz.open(pdf_path)
    all_text = []

    for i in tqdm(range(len(doc)), desc="Processing pages"):
        try:
            page_text = extract_text_from_page(doc[i])
            all_text.append(page_text)
        except Exception as e:
            all_text.append(f"\n[ERROR on page {i}]: {str(e)}\n")

    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(all_text))

    print(f"\n✅ Extraction complete. Output saved to {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert PDF to TXT with OCR fallback")
    parser.add_argument("--pdf", required=True, help="Input PDF path")
    parser.add_argument("--output", default="output.txt", help="Output TXT path")
    args = parser.parse_args()
    extract_text_from_pdf(args.pdf, args.output)
