from os.path import exists
import os

from peewee import *
from lib import javascript_pywebview as js
from sqlmodel import db, Game
# This model uses the "people.db" database.

# db = SqliteDatabase('games.db') 
def connect():
    db.connect()
    db.create_tables([Game])

def add_game(game, exe, path, longpath, i_d):
    try:
        Game.create(game=game, exe=exe, path=path, longpath=longpath, i_d=i_d)
    except:
        pass
    db.close()


def loop_insert(lib):
    db.connect()

    for i in lib[0]:
        add_game(i.name, i.exe, i.path, i.longpath, i.id)
    db.close()



def initial_retrieve():
    db.connect()
    vals = ''
    try:
        for games in Game.select(): 
            val = js.Import.javascript(str(games.game), str(games.exe), str(games.path), games.i_d)
            vals = vals + val
    except:
        vals = False
    db.close()
    return vals


def install(id):
    db.connect()
    path = Game.get(Game.i_d == id).longpath
    print(path)
    db.close()  

    
# try:
#   print(Game.get(Game.i_d == '66').exe)
#   print(Game.get(Game.i_d == '22').exe)
#   print(Game.get(Game.i_d == '88').exe)
#   print(Game.get(Game.i_d == '11').exe)
# except:
#   pass


# try:
#   print(Game.get(Game.i_d == '11').exe)
# except:
#   pass


# try:
#   print(Game.get(Game.i_d == '88').exe)
# except:
#   pass