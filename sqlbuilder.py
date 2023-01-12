from lib import javascript_pywebview as js
from sqlmodel import db, Game

# This model uses the "people.db" database.

# db = SqliteDatabase('games.db') 

db.connect()
db.create_tables([Game])


def add_game(game, exe, path, longpath, i_d):
    try:
        Game.create(game=game, exe=exe, path=path, longpath=longpath, i_d=i_d)
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


def install(id):
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
