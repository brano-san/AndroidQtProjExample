cmake_minimum_required(VERSION 3.16)

project(AndroidProj LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

file(GLOB_RECURSE HEADERS   "${CMAKE_CURRENT_LIST_DIR}/src/*.hpp")
file(GLOB_RECURSE SOURCES   "${CMAKE_CURRENT_LIST_DIR}/src/*.cpp")
file(GLOB_RECURSE QML_FILES "${CMAKE_CURRENT_LIST_DIR}/src/*.qml")

qt_add_executable(${PROJECT_NAME}
    ${HEADERS}
    ${SOURCES}
)

qt_add_qml_module(${PROJECT_NAME}
    URI ${PROJECT_NAME}
    VERSION 1.0

    QML_FILES
        src/android/Main.qml

    RESOURCES
        src/android/android/AndroidManifest.xml
        src/android/android/build.gradle
        src/android/android/res/values/libs.xml
        src/android/android/res/xml/qtprovider_paths.xml
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.${PROJECT_NAME}
    MACOSX_BUNDLE_BUNDLE_VERSION 1
    MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0"
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Quick
)
