import os
import sys
from pathlib import Path

dirname = Path(__file__).parent.parent.parent
base_dir = Path(__file__).parent.parent.parent
print(base_dir)

root_folder = os.path.abspath(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
#sys.path.append(root_folder)

print(root_folder)

def dirname():
  return dirname

def rootfolder():
  return root_folder

############################
# ########################
# base_dir = Path(__file__).parent