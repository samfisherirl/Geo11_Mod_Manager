import subprocess
import os.path

from pathlib import Path
directory = Path(__file__).parent.parent.parent
game_path = "C:\\Program Files (x86)\\Adobe\\Adobe Creative Cloud Experience\\CCXProcess.exe"

def sig(game_path): 
  sig = os.path.join(directory, 'sigcheck64.exe')
  
  result = subprocess.run([sig, '-a',  game_path], capture_output=True)
  
  print(str(result.stdout.strip(), encoding='utf-8'))# , "--pretty", ">output.json" 
  return (str(result.stdout.strip(), encoding='utf-8'))

def get_bits(output):
  lines = output.splitlines()
  for i in lines:
    if "MachineType" in i:
      bits = i.split()
      return str(bits[1])

def main(game_path):
  output = sig(game_path)
  print(output)
  bits = get_bits(output)
  print(bits)
  return bits
  

  
  
if __name__ == '__main__':
  main(game_path)