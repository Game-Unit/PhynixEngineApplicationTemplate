@echo off
setlocal enabledelayedexpansion

echo Checking dependencies...

:: Check for CMake
where cmake >nul 2>nul
if %errorlevel% neq 0 (
    echo CMake not found. Installing via winget...
    winget install kitware.cmake --silent --accept-source-agreements --accept-package-agreements
    if %errorlevel% neq 0 (echo Failed to install CMake. Please install it manually. & pause & exit)
    :: Refresh path for the current session
    set "PATH=%PATH%;%ProgramFiles%\CMake\bin"
) else (
    echo [OK] CMake is already installed.
)

:: Check for Ninja
where ninja >nul 2>nul
if %errorlevel% neq 0 (
    echo Ninja not found. Installing via winget...
    winget install Ninja-build.Ninja --silent --accept-source-agreements --accept-package-agreements
    if %errorlevel% neq 0 (echo Failed to install Ninja. Please install it manually. & pause & exit)
) else (
    echo [OK] Ninja is already installed.
)

echo ----------------------------------------
echo This might take a while depending on your internet speed...
echo ----------------------------------------
TIMEOUT /T 5

:: Run Build Commands
cmake -G "Ninja" -B build -S . -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
if %errorlevel% neq 0 (echo CMake configuration failed. & pause & exit)

ninja -C build
if %errorlevel% neq 0 (echo Build failed. & pause & exit)

echo ----------------------------------------
echo DONE! You can find the compiled files in the "build" folder.
echo ----------------------------------------
pause
