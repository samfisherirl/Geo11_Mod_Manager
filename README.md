# Geo11_Mod_Manager 

1/7/23  = > new release

https://github.com/samfisherirl/VDF-Steam-Library-Parse-and-Validate


![image](https://user-images.githubusercontent.com/98753696/211889864-aa63f2ad-6c87-4ca6-a830-5e1a3598c5c0.png)
 
#  GEO11 MOD MANAGER V3 


- this will auto-import most* steam games
- the launcher will move all the geo11 files into the games directory
- launch the game, and launch @artum  vrscreencap, each step waiting for the previous to finish. 
- when the game closes, vrscreencap will close and the files will be removed from the dir for 2d play. 

the big upgrade is automatic steam library importer which was a long process. this will be usable for other mods and is modular. ATM this is the only way to select a game. there are mislabeled tables, and its rough around teh edges, but functional. other libraries and custom game imports will be added. 

https://github.com/samfisherirl/Geo11_Mod_Manager/releases/download/v3/GEO11_MOD_MANAGER.v3.Test.7z

- Launch geo11_mm.exe from the folder of the same name
- click the green arrow next to any game you'd like to setup geo11 on
- sigcheck will confirm bits of 32 or 64 
- upon completion, or anytime, use the Geo11 Launcher to launch any geo11 game installed with the mod manager
- the game list is stored in the documents folder, move the launcher any where you'd like but keep the folder next to it. 
 

-geo11 files get stored in the game's directory (C:/game/geo11/)
-vrscreencap is the sole application for vr, katanga will be added
-other game libraries and browse for game will be added. 
-lots to do, but initial feedback is helpful to make sure I dont dump time into bad design/function

i hate to shill, but im going for a new job and any star or follow github.com/samfisherirl  goes directly to my resume  😉 
 
 
This project was on pause while I work on a Steam library importer and just all around migration to coding python. That has come to a close, and I'm working on a new release (v3) and that is in the test section of releases. Updates will come with a full v3 out expected before 1.30.22

Update -  works with Katanga launcher. https://streamable.com/kov060

All credit to Artum for his vr screen cap - https://github.com/artumino/VRScreenCap 

All credit to  davegl1234 & Bo3b for geo11 - https://www.mtbs3d.com/phpbb/viewtopic.php?t=26264

[Download here.](https://github.com/samfisherirl/Geo11_Mod_Manager/releases) 

This is designed as support for 3dfix, right now geo11 requires manual loading and unloading for 2d games. I saw an opportunity to help the community in a small way, and maybe bolster the geo11 team's efforts on their great release.

I am not affiliated with the Geo11 team, just a fan.

This app will take the Geo11 files such as dxd11.dll and move to a "geo" folder in the game's directory. It will also launch HelixVision/Kananga/VirtualDesktop as an option. 

It creates a desktop shortcut, when clicked, it will move the game's original "dxd11.dll" files to "/originaldx" and load geo11 dxd11 files. . Creating a VR specific launcher/shortcut.

https://streamable.com/3wo845
 ![image](https://user-images.githubusercontent.com/98753696/187366004-54357a0e-dbc2-4be6-a14d-b46d06bfc190.png)
