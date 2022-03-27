@echo off
for %%I in (.) do set CurrDirName=%%~nxI
set /p mode=Debug or Release(d/r):
g++ -I dependencies/include -c src/*.cpp
g++ *.o -o %CurrDirName% -L dependencies/lib -l sfml-graphics -l sfml-window -l sfml-system -l sfml-audio
del *.o

if "%mode%"=="r" robocopy %cd% "bin" /XD "dependencies" "src" "bin" ".vscode" /S & del "bin\build.bat" & del "bin\Setup_SFML.bat" & del %CurrDirName%".exe" & del "bin\.gitignore" & del "bin\.gitattributes"

cmd /k