#!/bin/bash

# Function to simulate Windows TIMEOUT with skip
countdown() {
    local seconds=10
    echo "----------------------------------------"
    echo "This might take a while depending on your computer's speed."
    echo -e "\n----------------------------------------"
    
    for ((i=$seconds; i>0; i--)); do
        printf "\rStarting in %2d seconds (press any key to skip)... " "$i"
        if read -n 1 -t 1 -s; then
            break
        fi
    done
}

# Check and Install CMake
if ! command -v cmake &> /dev/null; then
    echo "CMake could not be found. Installing..."
    sudo apt update && sudo apt install -y cmake
fi

# Check and Install Make
if ! command -v make &> /dev/null; then
    echo "Make not found. Installing build-essential..."
    sudo apt update && sudo apt install -y build-essential
fi

countdown

# Create build folder and compile
mkdir -p build
cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake --build build

echo "----------------------------------------"
echo "DONE! Build complete."
echo "----------------------------------------"

# Wait for ANY key press before exiting
echo "Press any key to close..."
read -n 1 -s
