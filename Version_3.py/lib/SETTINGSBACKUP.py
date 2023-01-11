import os  
def main():
    # need to find proper global declaration of paths 
    #################################################
    global appinfo, directory, dirname
    directory = os.path.dirname(__file__) 
    dirname = os.path.dirname(__file__)
    appinfo = r'C:\Program Files (x86)\Steam\appcache\appinfo.vdf'
    #################################################
    # need to find proper global declaration of paths
    ################################################# 
    appinfo = r'C:\Program Files (x86)\Steam\appcache\appinfo.vdf'

     
    dirname = os.path.dirname(__file__)

    # need to find proper global declaration of paths
    return dirname
    
    
if __name__ == "__main__":
    main()