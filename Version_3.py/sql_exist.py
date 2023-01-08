from os.path import exists
import os

from peewee import *
from lib import javascript_pywebview as js
from sqlmodel import db, Game




def check_db_exist():
    try:
        file_exists = exists('games.db')
        if file_exists:
            file_size = os.path.getsize('games.db')
            if file_size > 3000:
                return True, file_size
            else:
                return False, 'too small'
        else:
            return False, 'does not exist'
    except:
        return False, 'error'


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