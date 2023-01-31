from structured import javascriptpywebview as js
from structured.sqlmodel import db, Game
import os.path
# This model uses the "people.db" database.

# db = SqliteDatabase('games.db') 

db.connect()
db.create_tables([Game])


def add_game(game, exe, path, longpath, i_d):
    try:
        Game.create(game=game, exe=exe, path=path, longpath=longpath, i_d=i_d, installed=0)
    except:
        pass


def loop_insert(lib):
    for i in lib[1]:
        add_game(str(i[0]), str(i[1]), str(i[1]), str(i[3]), str(i[4]))


def test():
    print('testing\n')
    gamers = Game.get(Game.id == '1').get()
    print(gamers.path)


def initial_retrieve():
    vals = ''
    for games in Game.select():
        val = js.Import.javascript(str(games.game),
                        str(games.exe), str(games.path), games.i_d)
        vals = vals + val
    db.close()
    return vals


def get_game_details(ids):
    current_game = Game.get(Game.i_d == ids)
    
    logger = "~\\Documents\\geo11.txt"
    # log = os.path.expanduser(logger)

    install_status = current_game.installed
    if install_status == 1:
        return 1

    class Install:
        longpath = current_game.longpath
        id = ids
        name = current_game.game
        gamedir = os.path.dirname(longpath) 
        bits = ''
        log = os.path.expanduser(logger)
        
    install_game = Install()
    current_game.installed = 1
    current_game.save()
    print("if installed, 1. If not, 0:")
    print(current_game.installed)

    
    return install_game


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
