import sys
from cx_Freeze import setup, Executable


build_exe_options = {
    "packages": ["os", "sys"], 
    "includes": ["tkinter", "pysimplegui"] # <-- Include easy_gui
}

base = None
if sys.platform == "win32":
    base = "Win32GUI"


setup(  
        name = "Geo11_MM",
        version = "0.1",
        description = "My GUI application!",
        icon = "C:\\Users\\dower\\Documents\\virtual-reality.ico",
        #options = {"build_exe": build_exe_options},
        options = { "build_exe": {"include_files":["lib/", "VDFP.exe"] } },

        executables = [Executable("geo11_mm.py", base=base)])
                                                        