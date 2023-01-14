from shutil import copytree
import os.path


directory = os.path.dirname(__file__)


def installer(bits, dest):
    source = os.path.join(directory, 'geo_files', bits)
    copytree(source, dest, dirs_exist_ok=True)