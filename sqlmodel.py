from os.path import exists
import os

from peewee import *
from lib import javascript_pywebview as js

 # This model uses the "people.db" database.

db = SqliteDatabase('games.db') 

class Game(Model):
    game = CharField()
    exe = CharField()
    path = CharField()
    longpath = CharField()
    i_d = IntegerField()
    
    class Meta:
        database = db

    
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