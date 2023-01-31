
import os
import sys
from structured import path
import shutil
import json
import os.path
from pathlib import Path
from structured import settingstest as S
from structured import librarypaths as LP
from structured import utilities as U

dir = os.getcwd()

base_dir = os.getcwd()

with open("vparse.txt", "w") as f:
    f.write(str(dir))
    f.write(str(base_dir))
 

appinfo = S.appinfo()



def verify_vdf_location(directory):
    # global appinfo, dirname 
    
    try:
        if os.path.exists(appinfo):
            path = os.path.join(directory, 'appinfo.vdf')
            shutil.copy(appinfo, path)
            return True
    except:
        if os.path.exists(os.path.join(directory, 'appinfo.vdf')):
            path = os.path.join(directory, 'appinfo.vdf')    
            return True
        else:
            print(
            r'file not found in \'C:\Program Files (x86)\Steam\appcache\appinfo.vdf\'\nTry placing it in the same directory as this application.\nIf you already have, ignore this error.') 
            return False


def call_vdfp():
    # Joining the directory and the VDFP.exe file.
    VDFexe = os.path.join(dir, 'lib\\VDFP.exe')
    with open('appinfo.json', 'w') as f:
        f.write(VDFexe)
    out = os.path.join(dir, 'output.json')
    cmds = [str(VDFexe), str(appinfo), '-p']
    val = U.VDFP(cmds)
    
    #print(appinfo)
    #result = subprocess.run([VDFexe, appinfo, '-p'], capture_output=True)  

    # It's converting the output of the command to a string.
    # val = result
    #with open('out.json', 'w') as f:
    #    f.write(val)
    vals = json.loads(val)
    list = vals['datasets']
    return list


def parse_json(list):
    global gameLib 
    gameLib = []
    game = {}
    # data format
    # list of games
    # games have attributes (dict)
    # this separates games, dupes and vals
    dot = '.'
    x = 0
    iterator = ['name', 'path', 'exe', 'longpath', 'id']

    for i in list:
        x = x + 1
        try:
            exe = i['data']['appinfo']['config']['launch']
        except:
            continue
        try:
            wd = i['data']['appinfo']['config']['installdir']
            wd.replace('/', '\\')
            name = i['data']['appinfo']['common']['name']
            name.replace('/', '\\')
        except:
            continue
        z = 0
        for i, z in enumerate(exe.items()):
            try:
                executable = exe[str(i)]['executable']
                executable = executable.replace('/', '\\')
            except:
                continue
            if ".exe" in executable:
                p = 'C:\\program files\\Steam\common\\'
                holder = [
                    wd,
                    name,
                    executable,
                    'xxxx',
                    x
                ]

                for t, y in zip(iterator, holder):
                    try:
                        # game.update({f"{i}": f"{y}" })
                        game.update({f'{t}': f'{y}'})
                        # writer(iterator, holder, x)
                    except:
                        break

                gameLib.append(game)
                # writer(iterator, holder, x)
                game = {}
            # exes = exe['0']['executable']
            # holder = [wd, name, i['executable']]
            else:
                continue
            dot = dot + '.'
    return gameLib



class Library:
    def __init__(self, exe, path, name, longpath, id):
        self.exe = str(exe)
        self.path = str(path)
        self.name = str(name)
        self.longpath = str(longpath)
        self.id = int(id)
 

def class_constructor(gameLib):
    global appinfo, dirname 
    # create library objects,
    # using a list to keep track
    lib = []
    x = 0
    for i in gameLib:
        lib.append(Library(i['exe'], i['path'], i['name'], 'xxxx', i['id']))
    x = x + 1
    return lib





def call_lib(lib, directory):
    library = LP.check_path(directory)
    if library == False:
        print('\n\nno library found\n===>C:\\Program Files (x86)\\Steam\\config\\libraryfolders.vdf\n\nMove this file adjacent to this app and try again.')
        return False
    else:
        library = LP.grab_paths()
    print(str(library))
    print(lib[9].path + lib[9].exe)
    return library


def path_validation(paths, lib): 
    global matched
    matched = []
    dupe = []
    for i in lib:
        for path in paths: 
            post = i.path + "\\" + i.exe
            x = path + post.replace('\\\\', '\\')
            if os.path.exists(x) and i.name not in dupe:
                i.longpath = x
                matched.append([i.name, i.exe, i.path, i.longpath, i.id])
                dupe.append(i.name)
    print('finished')
    print(str(matched))
    return [lib, matched]
    # exampled output times 1k 
    #  path: 'C:\\program files\\Steam\\# It's a string.
    # common\\\\Half-Life\\hlds.exe'
    #   exe:  'hlds.exe'
    #   name: 'Half-Life Dedicated Server'
    #


# f'{VDFexe} {appinfo} --pretty >output.json'
 

def writer(lib, directory):
    global appinfo, dirname 
    log = os.path.join(directory, 'output.txt')
    csv = os.path.join(directory, 'output.csv')
    try:
        os.path.remove(log)
        os.path.remove(csv)
    except:
        print("log4")
    with open(log, 'w', encoding='utf-8') as f:
        with open(csv, 'w', encoding='utf-8') as g:
            f.write('here are your matched paths, next update includes name. ')
            x = 0
            for i in lib[1]:

                ## i.name, i.exe, i.path, i.longpath
                f.write(str('||' + i[3] + '|' + i[0] + '|' + i[1] + '|' + i[2] + '|'))
                f.write('\n')
                g.write(str('||' + i[3] + '|' + i[0] + i[1] + '|' + i[2] + '|'))
                g.write('\n')
                # for key, val in i.items():
                #     g.write(("\n   " + key + ': ' + val + '\n'))
                #     g.write('\n')
                #     f.write((key + "\n" + val + "\n"))
                #     f.write('\n')

 
