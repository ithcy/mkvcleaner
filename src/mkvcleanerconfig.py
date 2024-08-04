import os
import json

class Config:
    def __init__(self, filepath):
        app_data_folder = os.path.join(os.getenv('LOCALAPPDATA'), 'mkvcleaner')
        config_file = os.path.join(app_data_folder, filepath)
        with open(config_file, 'r') as f:
            self.config = json.load(f)

    def get(self, key, default=None):
        return self.config.get(key, default)

mkvcleanerconfig = Config('config.json')
