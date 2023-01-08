# -*- mode: python ; coding: utf-8 -*-


block_cipher = None


a = Analysis(
    ['C:/Users/dower/OneDrive/#geo11_rewrite/main.py'],
    pathex=[],
    binaries=[('C:/Users/dower/OneDrive/#geo11_rewrite/lib/VDFP.exe', '.')],
    datas=[('C:/Users/dower/OneDrive/#geo11_rewrite/javascript_pywebview.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/settings.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/assets', 'assets/'), ('C:/Users/dower/OneDrive/#geo11_rewrite/lib', 'lib/')],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)
pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='Geo11',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='Geo11',
)
