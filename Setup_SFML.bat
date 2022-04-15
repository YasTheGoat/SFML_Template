@echo off
set /p name=Enter project name:
echo setting up %name%...
mkdir "../"%name%
echo project folder created successfully!
echo copy pasting dependencies...
robocopy "%cd%/project" "../"%name% /S
del "../"%name%"/Setup_SFML.bat"
echo dependencies copied successfully!
echo over.
cmd /k