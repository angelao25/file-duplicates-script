# File Duplicate Finder

## *Overview*
This Ruby script scans a directory for image files, calculates their MD5 hashes, and identifies duplicates based on identical hashes. It generates a report listing all duplicate images, allowing you to decide how to handle them. The script is useful for organizing photo collections, cleaning up redundant files, or verifying unique content. It basically checks regardless of the file name, it compares the md5 hashes, which allows me to identify duplicates and deal with them as I want.

## *Features*
- Supports common image formats: `.jpg`, `.jpeg`, `.png`, `.avif` (customizable).
- Calculate MD5 hashes for reliable duplicate detection.
- Provides a clear report of duplicate files with their paths and hashes.
- Handles errors gracefully (e.g., unreadable files).
- No file modifications - purely informational.

## *Requirements*
- Ruby (tested with Ruby 2.7+, but should work with most versions).
- No external gems required - uses only the standard `digest` library.

## Installation
1. Clone this repository:
   ```bash
     git clone https://github.com/angelao25/file-duplicates-script.git
   ```
2. Navigate to the project directory:
```bash
  cd file-duplicates-finder/
```

## Usage
1. Place the script (`file-check-integrity.rb`) in the directory containing your images.
2. Run the script:
```bash
ruby file-check-integrity.rb
```
3. Review the output, which will list any duplicate images by their MD5 hash and file paths.

## Example Output

```
Scanning 73 image files...

Duplicate images found:
======================

MD5 Hash: 52216af1881322194c1b4a0bc240192f
1. image-1.jpg
2. image-2.jpg
---

Total sets of duplicates: 1
Total duplicate files: 2
```

## Customization
- *File Extensions*: Modify the Dir.glob("*.{jpg,jpeg,png,avif}") line to include other file formats depending on your needs.
- *Error Handling**: The script skips unreadable files but can be extended tolog issues.



