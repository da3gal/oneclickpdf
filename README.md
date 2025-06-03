# OneClickPDF - Image to PDF Converter for Windows

## Overview

OneClickPDF is a lightweight Windows utility designed to provide a quick and seamless way to convert image files (JPG, JPEG, PNG, BMP, GIF, TIFF, WEBP) into PDF documents. The core feature is its integration into the Windows File Explorer context menu, allowing users to convert images with a simple right-click.

## Features

* **Direct Image to PDF Conversion:** Converts various common image formats to PDF.
* **Context Menu Integration:** Adds a "Convert to PDF with OneClickPDF" option to the right-click menu for supported image files in Windows Explorer.
* **Single Executable:** The core conversion logic is packaged into a single standalone executable.
* **User-Friendly Installer:** Comes with an installer for easy installation and uninstallation.
* **No External Dependencies (Post-Installation):** Once installed, the application runs without requiring users to install Python or other libraries.
* **User Feedback:** Provides simple success or error messages via dialog boxes.

## Technology Stack

* **Core Logic:**
    * **Python 3.13.2:** For the image processing and PDF conversion script.
    * **Pillow:** Python Imaging Library used for opening and identifying image files.
    * **img2pdf:** Python library used for efficient conversion of images to PDF without re-encoding.
    * **Tkinter:** Python standard GUI (Graphical User Interface) package, used here for displaying simple message boxes.
* **Packaging & Deployment:**
    * **PyInstaller:** Used to bundle the Python script and its dependencies into a single standalone executable.
    * **Inno Setup:** Used to create a user-friendly Windows installer.
* **Operating System:**
    * **Windows:** The application and installer are designed specifically for Windows.

## How It Works

The application's core is a Python script, which is packaged into an executable. An installer handles the deployment and Windows integration.

1.  **Python Conversion Script (`oneclickpdf.py`):**
    * The script is designed to be called from the command line with a single argument: the path to the image file.
    * It uses `Pillow` to open and validate the input image file.
    * The `img2pdf` library takes the image data (or path) and converts it directly into a PDF layout. This method is efficient as it typically avoids re-compressing already compressed image data (like JPEGs).
    * The output PDF file is saved in the same directory as the source image, with the same base name but a `.pdf` extension.
    * Basic error handling is implemented using `try-except` blocks, and feedback is provided to the user via `tkinter.messagebox`.
    * This script is compiled using PyInstaller.

2.  **Windows Context Menu Integration:**
    * The installer modifies the Windows Registry to add the "Convert to PDF with OneClickPDF" option.
    * Registry keys are created under `HKEY_CLASSES_ROOT\SystemFileAssociations\.ext\shell\ConvertToPDF` for each supported image extension (`.jpg`, `.png`, etc.).

## Installation

1.  **Download the `OneClickPDF_Setup.exe` file from the [Latest Release on GitHub here](https://github.com/da3gal/oneclickpdf/releases).**
2.  Run `OneClickPDF_Setup.exe`.
3.  Follow the on-screen instructions. Administrator privileges may be required to write to Program Files and modify the registry.
4.  Once installed, the "Convert to PDF with OneClickPDF" option will be available when you right-click on supported image files.

## Usage

1.  Locate an image file you wish to convert (e.g., `myimage.jpg`, `logo.png`).
2.  Right-click on the image file.
3.  From the context menu, select "Convert to PDF with OneClickPDF".
4.  A PDF file (e.g., `myimage.pdf`, `logo.pdf`) will be created in the same directory as the original image.
5.  A success or error message will be displayed.

## Possible Future Improvements

* Allow conversion of multiple selected images into a single PDF.
* Allow conversion of multiple selected images into individual PDFs.
* Provide an options dialog (e.g., to select output directory, PDF quality/compression).
* Support for more image formats.
* Option to password-protect the generated PDF.
* Localization for different languages.
