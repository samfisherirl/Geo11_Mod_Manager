import winreg
#connecting to key in registry
access_registry = winreg.ConnectRegistry(None,winreg.HKEY_CURRENT_USER)
# HKEY_CURRENT_USER\Software\Valve\Steam
access_key = winreg.OpenKey(access_registry,r"Software\Valve\Steam\SteamPath")
#accessing the key to open the registry directories under
for n in range(20):
   try:
      x =winreg.EnumKey(access_key,n)
      print(x)
   except:
      break
