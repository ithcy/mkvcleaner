import logging
import os
import subprocess
import sys
from langcodes import *
from mkvcleanerconfig import mkvcleanerconfig

def process_file(file_path, track_id=1):
    try:
        mkvtoolnix_path = mkvcleanerconfig.get('mkvtoolnix_path', 'C:\\Program Files\\MKVToolNix')
        mkvtoolnix = f'{mkvtoolnix_path}{os.sep}mkvpropedit.exe'
        result = subprocess.run([
            mkvtoolnix,
            '-q', file_path,
            '-d', 'title',
            '-e', f'track:v{track_id}', '-d', 'name',
            '-e', f'track:v{track_id}', '-s', 'language=und',
            '-e', f'track:a{track_id}', '-d', 'name',
        ])

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
    app_data_folder = os.path.join(os.getenv('LOCALAPPDATA'), 'mkvcleaner')
    log_file = os.path.join(app_data_folder, 'mkvcleaner.log')

    logging.basicConfig(
        filename=log_file,
        level=logging.DEBUG,
        format='%(asctime)s - %(levelname)s - %(message)s',
        datefmt='%Y-%m-%d %H:%M:%S'
    )

    # Process each argument provided
    for arg in sys.argv[1:]:
        logging.debug(f'Trying {arg}')
        if os.path.isfile(arg):
            if arg.endswith(".mkv"):
                process_file(arg)
        elif os.path.isdir(arg):
            process_folder(arg)

    if mkvcleanerconfig.get('pause_before_exit', True):
        x = input("\nPress Enter to exit:")
    sys.exit()


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: mkvcleaner <folder_or_file_path1> [<folder_or_file_path2> ...]")
    else:
        main()
