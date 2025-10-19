cmake_minimum_required(VERSION 3.16)

project(AndroidProj LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

file(GLOB_RECURSE HEADERS   "${CMAKE_CURRENT_LIST_DIR}/src/*.hpp")
file(GLOB_RECURSE SOURCES   "${CMAKE_CURRENT_LIST_DIR}/src/*.cpp")
file(GLOB_RECURSE ABS_QML_FILES "${CMAKE_CURRENT_LIST_DIR}/src/*.qml")
file(GLOB_RECURSE ABS_XML_FILES "${CMAKE_CURRENT_LIST_DIR}/src/*.xml")
file(GLOB_RECURSE ABS_GRADLE_FILES "${CMAKE_CURRENT_LIST_DIR}/src/*.gradle")

set(QML_FILES "")
foreach(f ${ABS_QML_FILES})
    file(RELATIVE_PATH REL_PATH "${CMAKE_CURRENT_LIST_DIR}" "${f}")
    list(APPEND QML_FILES "${REL_PATH}")
endforeach()

set(XML_FILES "")
foreach(f ${ABS_XML_FILES})
    file(RELATIVE_PATH REL_PATH "${CMAKE_CURRENT_LIST_DIR}" "${f}")
    list(APPEND XML_FILES "${REL_PATH}")
endforeach()

set(GRADLE_FILES "")
foreach(f ${ABS_GRADLE_FILES})
    file(RELATIVE_PATH REL_PATH "${CMAKE_CURRENT_LIST_DIR}" "${f}")
    list(APPEND GRADLE_FILES "${REL_PATH}")
endforeach()

qt_add_executable(${PROJECT_NAME}
    ${HEADERS}
    ${SOURCES}
)

qt_add_qml_module(${PROJECT_NAME}
    URI ${PROJECT_NAME}
    VERSION 1.0

    QML_FILES
        ${QML_FILES}

    RESOURCES
        ${XML_FILES}
        ${GRADLE_FILES}
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
