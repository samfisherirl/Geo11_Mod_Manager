import sys
from cx_Freeze import setup, Executable


build_exe_options = {
    "packages": ["os", "sys", "tkinter"], 
    "includes": ["tkinter"] # <-- Include easy_gui
}

base = None
if sys.platform == "win32":
    base = "Win32GUI"


setup(  
        name = "Geo11_mod_manager",
        version = "0.1",
        description = "My GUI application!",
        # icon = "C:\\Users\\dower\\Documents\\virtual-reality.ico",
        #options = {"build_exe": build_exe_options},
        options = { "build_exe": {"include_files": ["libber/", "msgbox/", "geo_files/", "VDFP.exe", "sigcheck64.exe"] } },

        executables = [Executable("geo11_mm.py", base=base)])
                                                        