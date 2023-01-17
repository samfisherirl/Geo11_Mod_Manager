import subprocess
import os.path
import sys
parentdir = os.getcwd()
dirname = os.path.dirname(__file__)

gamedir = os.path.join(dirname, 'geo_files')

bits = '64'

def xcopy(gamedir, bits):
    zipper = os.path.join(parentdir, 'lib\\7za.exe')
    geo = os.path.join(parentdir, f'lib\\{bits}.7z')
    try:
      os.mkdir(gamedir)
    except:
      print()
    
    result = subprocess.run([zipper, 'x', geo, f'-o{gamedir}', '-y'], capture_output=True)
    
    print(str(result.stdout.decode('utf-8')))


def main():
    xcopy(gamedir, bits)
    

if __name__ == '__main__':
    main()