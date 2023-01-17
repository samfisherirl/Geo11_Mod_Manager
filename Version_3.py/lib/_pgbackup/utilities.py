from shutil import copytree
import os.path
import subprocess 
from pathlib import Path
from structured import path

#directory = os.path.dirname(__file__)
directory = os.path.dirname(path.rootfolder())

def dirnames():
  return directory

def installer(bits, dest):
    with open("log.txt", 'w') as f:
        f.write(str(bits))
        f.write(str(dest))
        f.write(str(directory))
        source = os.path.join(directory, 'geo_files', bits)
        f.write(str(source))
        
    copytree(source, dest, dirs_exist_ok=True)


POWERSHELL_PATH = r"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"  # 


cmd = "reg query \"HKCU\\Software\\Microsoft\\Windows NT\\CurrentVersion\\AppCompatFlags\\Compatibility Assistant\\Store\" /s"


def powershell(cmds):
    # ps_script_path = []
    result = subprocess.run([POWERSHELL_PATH, cmds], capture_output=True) 
  

    #result = subprocess.run(cmds, stdout = subprocess.PIPE, stderr = subprocess.PIPE, universal_newlines = True, capture_output=True) 

    
    return str(result.stdout.strip(), encoding='utf-8', errors='replace')

# powershell(cmd)


def VDFP(cmds):
    # ps_script_path = []
    try:
        result = subprocess.run(cmds, capture_output=True) 
  

    #result = subprocess.run(cmds, stdout = subprocess.PIPE, stderr = subprocess.PIPE, universal_newlines = True, capture_output=True) 

    
        return str(result.stdout.strip(), encoding='utf-8')
    except:
        print("error in vdfp powershell")