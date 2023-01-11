import os
import os.path
from lib import reg_query as GetSteam
import time

#################################################
# get steam paths from list of installs on reg
# combine in loop with appinfo
# return proper appinfo install path
################################################# 
class Dir:
    def dirname():
        directory = os.path.dirname(__file__)
        return directory

    def checker(appinfo):
        if not os.path.exists(appinfo):
            return os.path.join(appinfo, 'appinfo.vdf')
        else:
            return appinfo

    def loop_addys(path):
        
        pather = os.path.join(path, 'appcache\\appinfo.vdf')
        if os.path.exists(pather):
                    return True, pather, path
        else:
            False, pather, path

def main():
    
    list_of_steam_addys = GetSteam.main()
    for i in list_of_steam_addys:
        try:
            ifexist = Dir.loop_addys(i.strip("steam.exe"))
            if ifexist[0]:  # if exist
                appinfo = ifexist[1]
                steam = ifexist[2] # path return
                break
            else:
                continue
        except:
            continue
    
    #directory = Dir.dirname()
    #appinfo = Dir.checker(appinfo)

    return appinfo, steam





if __name__ == "__main__":
    print(str(main()))
    time.sleep(0.1)

    