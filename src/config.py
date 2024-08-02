import os
import tomlkit

class Config:
    def __init__(self, filepath):
        app_data_folder = os.path.join(os.getenv('LOCALAPPDATA'), 'mkvcleaner')
        config_file = os.path.join(app_data_folder, filepath)
        with open(config_file, 'rb') as f:
            self.config = tomlkit.load(f)

    def get(self, key, default=None):
        return self.config.get(key, default)

config = Config('config.toml')
