@echo off
set mode=%1
if "%mode%"=="" echo No parameter was given after "build" & set /p mode=Select a mode release or debug(r or d):
if "%mode%"=="" exit 1
for %%I in (.) do set CurrDirName=%%~nxI
echo compiling cpp files...

for %%f in (src/*.cpp) do echo compiling %%~nf... & g++ -I dependencies/include -c src/%%~nf.cpp & if ERRORLEVEL 1 call:errorfunc
echo compilation over.
echo linking files...
g++ *.o -o %CurrDirName% -L dependencies/lib -l sfml-graphics -l sfml-window -l sfml-system -l sfml-audio & if ERRORLEVEL 1 call:errorfunc
echo linking over.
del *.o

if "%mode%"=="r" echo setting up release files... & robocopy %cd% "bin" /XD "dependencies" "src" "bin" ".vscode" /S NFL /NDL /NJH /NJS /nc /ns & del "bin\build.bat" & del %CurrDirName%".exe" &  echo release files successfully created(check the bin folder)!
if "%mode%"=="d" echo. & echo. & echo. & echo Programe Output: & %CurrDirName%
echo Build finished successfully!

:errorfunc
del *.o > nul 2>&1
del %CurrDirName%.exe > nul 2>&1
exit 0