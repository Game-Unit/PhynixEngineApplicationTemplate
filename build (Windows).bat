@echo off
echo ----------------------------------------
echo This might take a while depending on your internet speed and how quickly your computer can compile code
echo ----------------------------------------
TIMEOUT /T 10
cmake -G "Ninja" -B build -S . -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
ninja -C build
echo ----------------------------------------
echo DONE! you can find the compile files in the "build" folder as well as the file to run the program
echo ----------------------------------------
pause
