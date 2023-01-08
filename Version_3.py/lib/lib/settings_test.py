import os
import os.path


#################################################
# need to find proper global declaration of paths
################################################# 
class Dir:
    def dirname(self):
        directory = os.path.dirname(__file__)
        return directory

    def checker(self):
        appinfo = r'C:\Program Files (x86)\Steam\appcache\appinfo.vdf'
        if not os.path.exists(appinfo):
            return os.path.join(directory, 'appinfo.vdf')
        else:
            return appinfo


directory = Dir.dirname('')
appinfo = r'C:\Program Files (x86)\Steam\appcache\appinfo.vdf'
appinfo = Dir.checker('') 
