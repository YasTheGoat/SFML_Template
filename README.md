# SFML_Template

To use thi template, you need to have installed:
  Mingw -(https://sourceforge.net/projects/mingw/files/Installer/mingw-get-setup.exe/download)
  
Simply download the project and then run the Setup_SFML.bat file.
You will be prompted to enter a name for your project.
Leave it for a couple of seconds and you will find your project outside yout current directory.

Once your project is ready, open the folder and run the build.bat file to debug or release.
Your cpp files can be anywhere in the src folder(recommended) but tou can create subfolders. If you absolutely want to have your code in another folder you will have to change the build.bat folder

```batch
if "%mode%"=="r" (
    echo setting up release files... 
    robocopy %cd% "BIN" /XD "dependencies" "src" "bin" ".vscode" /S NFL /NDL /NJH /NJS /nc /ns
                    ::find this line of code and change "src" by whatever folder name you want
    
    
    
    del "BIN\build.bat"
    del %CurrDirName%".exe"
    echo release files successfully created in the bin Folder!
)
```

If you have some experience with bat files you can also modify the build.bat file to meet your needs(add dependencies or improve it for exemple).

In the .vscode folder there is a tasks file that will alow you to simply use F5 when you are in vscode to quickly test your project.

ENJOY!
