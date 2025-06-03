import sys
import os
from PIL import Image
import img2pdf
import tkinter as tk
from tkinter import messagebox

def show_message(title, message, type="info"):
    """Helper function to show a message box."""
    root = tk.Tk()
    root.withdraw() # Hide the main tkinter window
    if type == "error":
        messagebox.showerror(title, message)
    else:
        messagebox.showinfo(title, message)
    root.destroy()

def convert_image_to_pdf(image_path):
    try:
        # Check if the file is a supported Pillow image
        img = Image.open(image_path)
        img_format = img.format
        img.close() # Close the file after checking

        # Define the output PDF filename
        pdf_filename = os.path.splitext(image_path)[0] + ".pdf"

        # Convert the image to PDF
        with open(pdf_filename, "wb") as f:
            # img2pdf.convert() can take a list of file paths or image bytes
            # For a single file, we can use its path directly
            f.write(img2pdf.convert(image_path))
        
        show_message("Success", f"Successfully converted '{os.path.basename(image_path)}' to '{os.path.basename(pdf_filename)}'.")
        return True

    except FileNotFoundError:
        show_message("Error", f"Error: File not found at '{image_path}'.", type="error")
        return False
    except img2pdf.PossibleDRMError:
        show_message("Error", f"Error: Possible DRM protection on '{os.path.basename(image_path)}' or the file is corrupted.", type="error")
        return False
    except UnidentifiedImageError: # PIL.UnidentifiedImageError
        show_message("Error", f"Error: Cannot identify image file '{os.path.basename(image_path)}'. It might be corrupted or not a supported image format.", type="error")
        return False
    except Exception as e:
        show_message("Error", f"An unexpected error occurred while converting '{os.path.basename(image_path)}':\n{e}", type="error")
        return False

if __name__ == "__main__":
    if len(sys.argv) > 1:
        input_path = sys.argv[1] # Get the file path from the command line argument
        # Make sure Pillow can identify the image type first
        try:
            with Image.open(input_path) as img_test:
                pass # Successfully opened
            convert_image_to_pdf(input_path)
        except UnidentifiedImageError:
             show_message("Error", f"Error: Cannot identify image file '{os.path.basename(input_path)}'. It might be corrupted or not a supported image format by Pillow.", type="error")
        except FileNotFoundError:
            show_message("Error", f"Error: Input file not found: '{input_path}'.", type="error")
        except Exception as e:
            show_message("Error", f"An unexpected error occurred: {e}", type="error")

    else:
        # This part is mostly for direct execution testing, not for context menu usage
        show_message("Usage Information", "This program is intended to be used via the right-click context menu on an image file.\n\nOr, run from command line: python image_to_pdf_converter.py <path_to_image>", type="info")
        # For manual testing, you can uncomment the line below and change the path
        # convert_image_to_pdf("C:/path/to/your/image.jpg")