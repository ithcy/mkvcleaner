import os
import subprocess
import sys

def process_file(file_path):
    try:
        # Example: Run a subprocess command to process the file
        result = subprocess.run(['mkvpropedit.exe', '']

        print(f"Processed file: {file_path}")
    except Exception as e:
        print(f"Error processing file {file_path}: {e}")

def process_folder(folder_path):
    try:
        # Walk through the folder recursively
        for root, dirs, files in os.walk(folder_path):
            for file in files:
                if file.endswith(".mkv"):
                    file_path = os.path.join(root, file)
                    process_file(file_path)
    except Exception as e:
        print(f"Error processing folder {folder_path}: {e}")

def main():
    # Process each argument provided
    for arg in sys.argv[1:]:
        if os.path.isfile(arg):
            if arg.endswith(".mkv"):
                process_file(arg)
        elif os.path.isdir(arg):
            process_folder(arg)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: stripmkvtitles.py <folder_or_file_path1> [<folder_or_file_path2> ...]")
    else:
        main()
