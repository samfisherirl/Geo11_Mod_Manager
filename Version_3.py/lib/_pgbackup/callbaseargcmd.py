from structured import VParse as V
import os.path
import shutil
import json
import time

import subprocess
global dirname
dirname = os.path.dirname(__file__)
directory = os.path.dirname(__file__)

appinfo = r'C:\Program Files (x86)\Steam\appcache\appinfo.vdf'

def dirnam(path):
    global dirname
    dirname = path
    return dirname
# class Library():
#     # profile = data['Datasets'][400]['Data']['appinfo']
#     def __init__(self, exe, dir, path, name):
#         self.exe = exe
#         self.name = name
#         self.dir = dir
#         # `self` is a reference to the current instance of the class.
#         self.path = path

def main():
    global dirname
    dirname = dirnam(os.path.dirname(__file__))
    list = []
# Checking if the appinfo.vdf file is in the directory.
    if V.moveV(directory):

        time.sleep(0.2)
        # Calling the cmd4 function in the VParse.py file.
        list = V.cmd4(directory)
        gamedic = V.parser(list)  # Parsing the list of games and their information.
        
        # Creating a list of objects.
        lib = V.constructor(gamedic)
        # A list of all the paths to the games.
        paths = V.callLibrary(lib)
        if paths == False:
            print('\n\nNo paths found.')
            time.sleep(5)
            return
# Checking if the path to the game is valid.
        lib = V.pathValidator(paths, lib)
        with open('output1.txt', 'w') as f:
            f.write(str(lib))
        # # Writing the data to a file.
        V.writer(lib, directory)
        print('\n\n\nComplete! Open the text file next to this app just generated. Find Output.txt')
        time.sleep(5)
    else:
        print('\n\nClosing now. No appinfo.vdf file found.')

    ########last_working############## The last working code.
    
    # list = []
    # V.moveV(directory)
    # time.sleep(0.5)
    # # Calling the cmd4 function in the VParse.py file.
    
    # list = V.cmd4(directory)
    # gamedic = V.parser(list)
    # val = V.constructor(gamedic)
    # V.writer(gamedic, directory)
    # V.writer(ar)
    ###############################################


# f'{VDFexe} {appinfo} --pretty >output.json'
# 
# # A special variable in Python that gets assigned the name of the module.
if __name__ == "__main__":
    main()
