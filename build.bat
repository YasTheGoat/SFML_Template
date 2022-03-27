@echo off
for %%I in (.) do set CurrDirName=%%~nxI
set /p mode=Debug or Release(d/r):
echo compiling cpp files...
g++ -I dependencies/include -c src/*.cpp
echo compilation over!
echo building executable file...
g++ *.o -o %CurrDirName% -L dependencies/lib -l sfml-graphics -l sfml-window -l sfml-system -l sfml-audio
echo executable file successfully created!
del *.o

if "%mode%"=="r" echo setting up release files... & robocopy %cd% "bin" /XD "dependencies" "src" "bin" ".vscode" /S NFL /NDL /NJH /NJS /nc /ns & del "bin\build.bat" & del %CurrDirName%".exe" &  echo release files successfully created(check the bin folder)!

echo Build finished!
if "%mode%"=="d" %CurrDirName%
cmd /k