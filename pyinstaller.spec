# -*- mode: python -*-
from PyInstaller.build import Analysis, PYZ, EXE, Tree

a = Analysis(['./src/onixcheck/__main__.py'],
             pathex=['c:\\dev\\onixcheck'],
             hiddenimports=[],
             hookspath=None,
             runtime_hooks=None)

for d in a.datas:
    if 'pyconfig' in d[0]:
        a.datas.remove(d)
        break

# Include all spellcheck dictionary files, as a folder named dict
xsd21 = Tree('./src/onixcheck/xsd2.1', prefix='xsd2.1')
xsd30 = Tree('./src/onixcheck/xsd3.0', prefix='xsd3.0')

pyz = PYZ(a.pure)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          xsd21,
          xsd30,
          name='onixcheck.exe',
          debug=False,
          strip=None,
          upx=True,
          console=True,
          version='version_info.txt'
          )
