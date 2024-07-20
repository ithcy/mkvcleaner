import json
import os
import subprocess
import sys
from pathlib import Path
import tomlkit
from terminology import *
from langcodes import *


def process_file(file_path, settings, track_id=1):
    try:
        # Example: Run a subprocess command to process the file
        result = subprocess.run([
            settings['mkvpropedit_path'],
            '-q', file_path,
            '-d', 'title',
            '-e', f'track:v{track_id}', '-d', 'name',
            '-e', f'track:v{track_id}', '-s', 'language=und',
            '-e', f'track:a{track_id}', '-d', 'name',
        ])

        print(f"Processed file: {file_path}")
    except Exception as e:
        print(f"Error processing file {file_path}: {e}")

def process_folder(folder_path, settings):
    try:
        # Walk through the folder recursively
        for root, dirs, files in os.walk(folder_path):
            for file in files:
                if file.endswith(".mkv"):
                    file_path = os.path.join(root, file)
                    process_file(file_path, settings)
    except Exception as e:
        print(f"Error processing folder {folder_path}: {e}")

def main():
    with open(Path(__file__).with_name('config.toml'), 'rb') as f:
        config = tomlkit.load(f)
        settings = config['defaults']

    # Process each argument provided
    for arg in sys.argv[1:]:
        if os.path.isfile(arg):
            if arg.endswith(".mkv"):
                process_file(arg, settings)
        elif os.path.isdir(arg):
            process_folder(arg, settings)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: stripmkvtitles.py <folder_or_file_path1> [<folder_or_file_path2> ...]")
    else:
        main()
