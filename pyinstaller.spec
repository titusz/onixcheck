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

# Include all schema files
biblon = Tree('./src/onixcheck/schema/biblon', prefix='biblon')
google = Tree('./src/onixcheck/schema/google', prefix='google')
rng30 = Tree('./src/onixcheck/schema/rng3.0', prefix='rng3.0')
rng31 = Tree('./src/onixcheck/schema/rng3.1', prefix='rng3.1')
xsd21 = Tree('./src/onixcheck/schema/xsd2.1', prefix='xsd2.1')
xsd30 = Tree('./src/onixcheck/schema/xsd3.0', prefix='xsd3.0')
xsd31 = Tree('./src/onixcheck/schema/xsd3.1', prefix='xsd3.1')

pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          biblon,
          google,
          rng30,
          rng31,
          xsd21,
          xsd30,
          name='onixcheck.exe',
          debug=False,
          strip=False,
          upx=True,
          console=True , version='version_info.txt')
