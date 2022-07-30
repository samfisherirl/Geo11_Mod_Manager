@echo off
Timeout /t 1 
cd /d 
cd %~dp0/

move /y "%CD%"\d3d11.dll "%CD%"\originaldx
move /y "%CD%"\d3dcompiler_47.dll "%CD%"\originaldx
move /y "%CD%"\d3dx.ini "%CD%"\originaldx
move /y "%CD%"\d3dxdm.ini "%CD%"\originaldx
move /y "%CD%"\nvapi64.dll "%CD%"\originaldx
move /y "%CD%"\geo\*.dll "%CD%"
move /y "%CD%"\geo\*.ini "%CD%"
cls
Timeout /t 1
