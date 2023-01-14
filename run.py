import os.path

dirname = os.path.dirname(__file__)

from pathlib import Path

dirname = Path(__file__).parent.parent.parent

with open("logger.txt", "w") as f:
    f.write(str(dirname))
    f.write("\n")
    f.write(str(os.path.join(dirname, "libber\\msgbox.exe")))
    
from structured import path
import subprocess
from structured import sqlbuilder as SqL
from structured import javascriptpywebview as js
from structured import parse
from structured.copy_move_setup import move_copy 
import utilities

    


def directory():
    return dirname

def msgbox(msg):
    msgbox = os.path.join(dirname, "libber\\msgbox.exe")
    subprocess.call([msgbox, f"{msg}"])


def importsteam():
    try:
        test = SqL.test()
        insert_html = SqL.initial_retrieve()
        print('log place 1')
        print(insert_html[1]) 
        
    except:
        lib = parse.main()  # parse steam library
        SqL.loop_insert(lib)  # save to sql
        insert_html = js.Import.run(lib)
        print("\nError: Database already exists")
    response = {'message': insert_html}
    return response


def install_process(id):

    msgbox("Installing...")
    try:
        install_game = SqL.get_game_details(id)
    except: 
        msgbox("Error, game not found")
    if install_game == 1:
        msgbox("this game is already installed")
    else:
    # game_deets[0] = path, [1] = name
        saucedest = move_copy(install_game)
        
        utilities.installer(saucedest[0], saucedest[1])
        
        msgbox("Complete! \nFind the Geo11 Launcher to play. ")
