#sqlbuilder

from peewee import *


db = SqliteDatabase('games.db')


class Game(Model):
    game = CharField()
    exe = CharField()
    path = CharField()
    longpath = CharField()
    i_d = IntegerField()
    
    class Meta:
        database = db # This model uses the "people.db" database.


def add_game(game, exe, path, longpath, i_d):
    try:
        Game.create(game=game, exe=exe, path=path, longpath=longpath, i_d=i_d)
    except IntegrityError:
        pass

def loop_insert(lib):
    for i in lib:
        add_game(i.name, i.exe, i.path, i.longpath, i.id)

db.connect()
db.create_tables([Game])

