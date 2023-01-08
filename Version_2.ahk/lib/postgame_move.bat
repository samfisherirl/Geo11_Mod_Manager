@echo off
        Timeout /t 1
        Cls
        cd /d 
        cd %~dp0/
move /y "%CD%"\d3d11.dll "%CD%"\geo\
move /y "%CD%"\d3dcompiler_47.dll "%CD%"\geo\
move /y "%CD%"\d3dx.ini "%CD%"\geo\
move /y "%CD%"\d3dxdm.ini "%CD%"\geo\
move /y "%CD%"\nvapi64.dll "%CD%"\geo\
move /y "%CD%"\originaldx\*.dll  "%CD%"
move /y "%CD%"\originaldx\*.ini  "%CD%"
move /y "%CD%"\originaldx\*.dll  "%CD%"
        Cls
        timeout /t 1