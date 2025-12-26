cmake_minimum_required(VERSION 3.8)
project(PhynixEngineApplicationTemplate CXX C)

set(CMAKE_CXX_STANDARD 23)

include(FetchContent)

FetchContent_Declare(
    phynixengine
    GIT_REPOSITORY https://github.com/Game-Unit/PhynixEngine.git
    GIT_TAG v1
)

FetchContent_MakeAvailable(phynixengine)

add_executable( ${PROJECT_NAME} WIN32
    main.cpp
)

target_include_directories(${PROJECT_NAME} PRIVATE
    "${phynixengine_SOURCE_DIR}/Engine"
    "${phynixengine_SOURCE_DIR}/External Dependancys/GameNetworkingSockets/include"
)

target_link_directories(${PROJECT_NAME} PRIVATE
    "${phynixengine_SOURCE_DIR}/External Dependancys/GameNetworkingSockets/lib"
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    PhynixEngine
    raylib
    winmm
    gdi32
    opengl32
    shell32
    box2d
    GameNetworkingSockets
    rlimgui
)

# 1. Copy the Engine DLL
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "$<TARGET_FILE:PhynixEngine>"
        "$<TARGET_FILE_DIR:${PROJECT_NAME}>"
)

# 2. Copy the Networking DLL (from the source folder)
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${phynixengine_SOURCE_DIR}/External Dependancys/GameNetworkingSockets/lib/GameNetworkingSockets.dll"
        "$<TARGET_FILE_DIR:${PROJECT_NAME}>"
)
