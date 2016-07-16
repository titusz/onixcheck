# -*- mode: python -*-

block_cipher = None


a = Analysis(['src\\onixcheck\\__main__.py'],
             pathex=['C:\\dev\\onixcheck'],
             binaries=None,
             datas=None,
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=True,
             win_private_assemblies=True,
             cipher=block_cipher)

# Include all schema files
biblon = Tree('./src/onixcheck/schema/biblon', prefix='biblon')
google = Tree('./src/onixcheck/schema/google', prefix='google')
rng30 = Tree('./src/onixcheck/schema/rng3.0', prefix='rng3.0')
xsd21 = Tree('./src/onixcheck/schema/xsd2.1', prefix='xsd2.1')
xsd30 = Tree('./src/onixcheck/schema/xsd3.0', prefix='xsd3.0')

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
          xsd21,
          xsd30,
          name='onixcheck.exe',
          debug=False,
          strip=False,
          upx=True,
          console=True , version='version_info.txt')
