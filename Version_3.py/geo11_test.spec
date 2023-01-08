# -*- mode: python ; coding: utf-8 -*-


block_cipher = None


a = Analysis(
    ['C:/Users/dower/OneDrive/#geo11_rewrite/main_testing.py'],
    pathex=[],
    binaries=[],
    datas=[('C:/Users/dower/OneDrive/#geo11_rewrite/javascript_pywebview.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/settings.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/sql_exist.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/sqlbuilder.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/sqlmodel.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/lib/assets', 'assets/'), ('C:/Users/dower/OneDrive/#geo11_rewrite/lib/__init__.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/lib/index.html', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/lib/javascript_pywebview.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/lib/library_paths.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/lib/parse.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/lib/settings_test.py', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/lib/VDFP.exe', '.'), ('C:/Users/dower/OneDrive/#geo11_rewrite/lib/VParse.py', '.')],
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
    name='geo11_test',
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
    name='geo11_test',
)
