import shutil
import sys
import os.path
from structured import path

from structured import callcmdsigncheck as sc

# dirname = path.rootfolder()
dirname = path.rootfolder()
print(dirname)

geo_files = os.path.join(os.path.dirname(dirname), 'geo_files')


# copy files and folders to install location 

def write_log(install_game):
    
    with open(install_game.log, 'a', encoding='utf-8') as f:
        
        f.write(f'{install_game.name},{install_game.gamedir},{install_game.longpath},{install_game.id}\n')



def move_copy(install_game):
    
    install_game.bits = str(sc.main(install_game.longpath))
    
    # game_deets[0] = path, [1] = name
    #  Then, the code creates a new directory called source under geo_files.
    source = os.path.join(geo_files, install_game.bits)
    print(source)
    
    dest = os.path.join(install_game.gamedir, 'geo11')
    # It then copies all of the contents from that directory into this newly created one.
    
    write_log(install_game)
    
    return str(install_game.bits), dest

