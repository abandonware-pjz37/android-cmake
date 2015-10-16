# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)
include("../common.cmake")

project(AndroidMouseAreaQml)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

hunter_add_package(Qt COMPONENTS qtdeclarative) # Qt5Quick
find_package(Qt5Quick REQUIRED) # Qt5::Quick

add_library(
    mousearea-qml
    SHARED
    main.cpp
    mousearea.qml
    mousearea.qrc
    shared.h
)

target_link_libraries(mousearea-qml Qt5::Quick)

set_target_properties(mousearea-qml PROPERTIES VERSION 1.0)

hunter_add_package(QtAndroidCMake)
list(APPEND CMAKE_MODULE_PATH "${QTANDROIDCMAKE_ROOT}")
include(AddQtAndroidApk)

add_qt_android_apk(
    TARGET mousearea-qml-apk
    BASE_TARGET mousearea-qml
    LAUNCH_TARGET mousearea-qml-launch
    PACKAGE_NAME mousearea.qml.qt
)

hunter_add_package(Android-SDK)
message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")
