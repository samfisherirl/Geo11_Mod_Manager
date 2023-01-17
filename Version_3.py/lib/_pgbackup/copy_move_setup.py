import shutil
import sys
import os.path
from structured import path
from shutil import copytree
from structured.movefiles import xcopy

from structured import callcmdsigncheck as sc

# dirname = path.rootfolder()
dirname = path.dirname()
print(dirname)

geo_files = os.path.join(dirname, 'geo_files')


# copy files and folders to install location 

def write_log(install_game):
    
    with open(install_game.log, 'a', encoding='utf-8') as f:
        
        f.write(f'{install_game.name},{install_game.gamedir},{install_game.longpath},{install_game.id}\n')



def move_copy(install_game):
    try:
        val = str(sc.main(install_game.longpath))
    except:
        val = "64"
    install_game.bits = val
    # game_deets[0] = path, [1] = name
    #  Then, the code creates a new directory called source under geo_files.
    source = os.path.join(geo_files, val)
    print(source)
    
    dest = os.path.join(install_game.gamedir, 'geo11')
    # It then copies all of the contents from that directory into this newly created one.
    
    write_log(install_game)
    # source = os.path.join(geo_files, install_game.bits) 
    xcopy(dest, install_game.bits)

