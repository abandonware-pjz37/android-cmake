# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)
include("../common.cmake")

project(AndroidQtHelloGL2)

set(CMAKE_AUTOMOC ON)

hunter_add_package(Qt)

find_package(Qt5Widgets REQUIRED)

add_library(
    hellogl2
    SHARED
    glwidget.cpp
    glwidget.h
    logo.cpp
    logo.h
    main.cpp
    mainwindow.cpp
    mainwindow.h
    window.cpp
    window.h
)

target_link_libraries(hellogl2 Qt5::Widgets GLESv2)

set_target_properties(hellogl2 PROPERTIES VERSION 1.0)

hunter_add_package(QtAndroidCMake)
list(APPEND CMAKE_MODULE_PATH "${QTANDROIDCMAKE_ROOT}")
include(AddQtAndroidApk)

add_qt_android_apk(
    TARGET hellogl2-apk
    BASE_TARGET hellogl2
    LAUNCH_TARGET hellogl2-launch
)

hunter_add_package(Android-SDK)
message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")
