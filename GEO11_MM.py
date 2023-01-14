import os
import webview

import run


from time import sleep
from structured import copy_move_setup
import run

###########################################
###########################################

dirname = os.path.dirname(__file__)

###########################################
###########################################

def on_bridge(window):
    # Fire the onbridge function which indicates pywebview is ready
    window.evaluate_js("if(window.onbridge){window.onbridge();}")

     


##########################################
#############Javascript_Entry#############
##########################################



class Api:
    def importsteam(self):
        response = run.importsteam()
        return response

    def install(self, id):
        run.install_process(id)
        
    def printer(self, val):
        print(val)
        return val


# Api.install('', 63) 

# test install above uncomment

##########################################
#############Start Pywebview Html#########
##########################################



api = Api()
window = webview.create_window('GEO11',
                            'libber\index.html',
                            js_api=api,
                            width=1250,
                            height=900)
webview.start(on_bridge, window)













##################################################
##################1/14/22 below###################
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

##########################################
##########################################
##########################################


#        def importsteam():
#            try:
#                test = SqL.test()
#                insert_html = SqL.initial_retrieve()
#                print('log place 1')
#                print(insert_html[1]) 
#        
#            except:
#                lib = parse.main()  # parse steam library
#                SqL.loop_insert(lib)  # save to sql
#                insert_html = js.Import.run(lib)
#                print("\nError: Database already exists")
#            response = {'message': insert_html}
#            return response


#        def install_process(id):
#
#            msgbox("Installing...")
#            try:
#                install_game = SqL.get_game_details(id)
#            except: 
#                msgbox("Error, game not found")
#            if install_game == 1:
#                msgbox("this game is already installed")
#            else:
#            # game_deets[0] = path, [1] = name
#                saucedest = move_copy(install_game)
#        
#                utilities.installer(saucedest[0], saucedest[1])
#        
#                msgbox("Complete! \nFind the Geo11 Launcher to play. ")

