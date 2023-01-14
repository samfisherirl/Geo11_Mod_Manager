from shutil import copytree
import os.path
import subprocess

directory = os.path.dirname(__file__)

def dirnames():
  return directory

def installer(bits, dest):
    source = os.path.join(directory, 'geo_files', bits)
    copytree(source, dest, dirs_exist_ok=True)




def powershell(cmds):
    # POWERSHELL_PATH = r"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"  # 
    # cmd = "reg query \"HKCU\\Software\\Microsoft\\Windows NT\\CurrentVersion\\AppCompatFlags\\Compatibility Assistant\\Store\" /s"
    # ps_script_path = []
  

    result = subprocess.run(cmds, stdout = subprocess.PIPE, stderr = subprocess.PIPE, universal_newlines = True) 

    
    return str(result)

