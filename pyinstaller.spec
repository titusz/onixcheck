# -*- mode: python -*-

from pathlib import Path

block_cipher = None

# Get current working directory
ROOT_DIR = Path('.').resolve()

a = Analysis(
    [str(ROOT_DIR / 'src' / 'onixcheck' / '__main__.py')],
    pathex=[str(ROOT_DIR)],
    binaries=[],
    datas=[],
    hiddenimports=[],
    hookspath=[],
    runtime_hooks=[],
    excludes=[],
    cipher=block_cipher
)

# Include all schema files (whole directory, so schema folders added later are bundled too)
schemas = Tree('./src/onixcheck/schema', excludes=['__pycache__', '*.py'])

pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          schemas,
          name='onixcheck.exe',
          debug=False,
          strip=False,
          upx=True,
          console=True , version='version_info.txt')
