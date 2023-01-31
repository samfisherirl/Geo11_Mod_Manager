import os

parentdir = os.getcwd()

print(parentdir)

import webview
import clr
import pythonnet

from structured import run


from time import sleep
from structured import copy_move_setup

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
                            'lib\\index.html',
                            js_api=api,
                            width=1250,
                            height=900)
webview.start(on_bridge, window)










 
