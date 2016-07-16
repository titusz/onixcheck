REM build from system python2.7 with  pyinstaller v3.1 & setuptools 19.2
REM see: https://github.com/pyinstaller/pyinstaller/issues/1773
pyinstaller --clean -F -n onixcheck.exe --version-file version_info.txt --win-private-assemblies --win-no-prefer-redirects pyinstaller.spec
