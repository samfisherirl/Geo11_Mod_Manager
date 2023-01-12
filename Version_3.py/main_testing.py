import os

import webview

import sqlbuilder as SqL
from lib import javascript_pywebview as js
from lib import parse
from time import sleep

###########################################
###########################################

dirname = os.path.dirname(__file__)


###########################################
###########################################

def on_bridge(window):
    # Fire the onbridge function which indicates pywebview is ready
    window.evaluate_js("if(window.onbridge){window.onbridge();}")


##########################################
#############IMPORT_STEAM_TEST############
##########################################

def importsteamtest():
    # database_exist = check_db_exist()
    # print(database_exist[1])
    try:
        test = SqL.test()
        insert_html = SqL.initial_retrieve()
    except:
        lib = parse.main()  # parse steam library
        SqL.loop_insert(lib)  # save to sql
        insert_html = js.Import.run(lib)
        print("\nError: Database already exists")
    response = {'message': insert_html}
    return response


##########################################
##########################################
##########################################


def importsteam():
    # database_exist = check_db_exist()
    # print(database_exist[1])
    try:
        test = SqL.test()
        insert_html = SqL.initial_retrieve()

    except:
        lib = parse.main()  # parse steam library
        SqL.loop_insert(lib)  # save to sql
        insert_html = js.Import.run(lib)
        print("\nError: Database already exists")
    response = {'message': insert_html}
    return response


class Api:
    def importsteam(self):
        response = importsteam()
        return response

    def install(self, id):
        SqL.install(id)

    def printer(self, val):
        print(val)
        return val


api = Api()
window = webview.create_window('GEO11',
                            'lib\index.html',
                            js_api=api,
                            width=1250,
                            height=900)
webview.start(on_bridge, window, debug=True)

##################################################
##################readme/notes####################
##################################################

# def checker(window):
# pass
# lib = parse.main()
# vals = ''
# for i in lib[0]:
#     vals = vals + str(js.javascript(str(i.name), str(i.exe), str(i.path)))

# try:
#     elements = window.get_elements('tabler')
#     elements[0]['innerHTML'] = vals

# except:
#     pass
# # lib = parse.main()
# vals = ''
# for i in lib[0]:
#     if i.longpath != 'xxxx':
#         val = js.javascript(str(i.name), str(i.exe), str(i.path))
#         vals = vals + val

# try:
#     elements = window.get_elements('tabler')
#     elements[0]['innerHTML'] = vals

# except:
#     print('')

# time.sleep(0.1)
# storage = vals
