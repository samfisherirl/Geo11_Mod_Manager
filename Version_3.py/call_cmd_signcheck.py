import subprocess
import os.path

directory = os.path.dirname(os.path.dirname(__file__)) 
def sign():
  sig = os.path.join(directory, 'sigcheck64.exe')
  path = os.path.join(directory, 'output.json')
  result = subprocess.run([sig, '-a',  sig], capture_output=True)  # , "--pretty", ">output.json"
  print(str(result.stdout.strip(), encoding='utf-8', errors='replace'))

sign()

