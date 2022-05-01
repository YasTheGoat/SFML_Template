@echo off
set mode=%1
if "%mode%"=="" (
    echo No parameter was given after "build"
    set /p mode=Select a mode release or debug[r/d]:
)
if "%mode%"=="" exit 1
for %%I in (.) do set CurrDirName=%%~nxI
echo compiling cpp files...

for /r "%cd%" %%a in (*.cpp) do (
    echo compiling %%~nxa...
    g++ -I dependencies/include -c %%~a
    if ERRORLEVEL 1 call:errorfunc
)


echo compilation over.
echo linking files...
g++ *.o -o %CurrDirName% -L dependencies/lib -l sfml-graphics -l sfml-window -l sfml-system -l sfml-audio 
if ERRORLEVEL 1 call:errorfunc
echo linking over.
del *.o

echo Build finished successfully!

if "%mode%"=="r" (
    echo setting up release files... 
    robocopy %cd% "BIN" /XD "dependencies" "src" "bin" ".vscode" /S NFL /NDL /NJH /NJS /nc /ns
    del "BIN\build.bat"
    echo release files successfully created in the bin Folder!
)
if "%mode%"=="d" (
    echo.
    echo. 
    echo. 
    %CurrDirName%
)

del %CurrDirName%".exe" 


:errorfunc (
    del *.o > nul 2>&1 
    exit 0
)

