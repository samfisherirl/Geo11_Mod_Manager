import subprocess
import os.path
import os
# from structured import path 
from structured import path
from pathlib import Path

parentdir = os.getcwd()
directory = path.dirname()
game_path = r"C:\Program Files (x86)\Android\android-sdk\build-tools\32.0.0\aapt.exe"


# noinspection PyShadowingNames
def sig(game_path):
    sig = os.path.join(parentdir, 'lib\\sigcheck64.exe')
    print(sig)
    result = subprocess.run([sig, '-a', game_path], capture_output=True)

    val = str(result.stdout.strip(), encoding='utf-8', errors='replace')

    return val


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
    if "32" in bits:
        return "32"
    if "64" in bits:
        return "64"
    return bits


if __name__ == '__main__':
    main(game_path)
