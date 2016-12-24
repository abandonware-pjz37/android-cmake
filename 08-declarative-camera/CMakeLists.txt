# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)
include("../common.cmake")

project(AndroidDeclarativeCamera)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

hunter_add_package(Qt COMPONENTS qtdeclarative) # Qt5Quick
find_package(Qt5Quick REQUIRED) # Qt5::Quick

add_library(
    declarative-camera
    SHARED
    # cpp source
    qmlcamera.cpp
    # qrc
    declarative-camera.qrc
    # qrc content
    CameraButton.qml
    CameraListButton.qml
    CameraListPopup.qml
    CameraPropertyButton.qml
    CameraPropertyPopup.qml
    FocusButton.qml
    PhotoCaptureControls.qml
    PhotoPreview.qml
    Popup.qml
    VideoCaptureControls.qml
    VideoPreview.qml
    ZoomControl.qml
    declarative-camera.qml
    images/camera_auto_mode.png
    images/camera_camera_setting.png
    images/camera_flash_auto.png
    images/camera_flash_fill.png
    images/camera_flash_off.png
    images/camera_flash_redeye.png
    images/camera_white_balance_cloudy.png
    images/camera_white_balance_flourescent.png
    images/camera_white_balance_incandescent.png
    images/camera_white_balance_sunny.png
    images/toolbutton.png
    images/toolbutton.sci
)

target_link_libraries(declarative-camera Qt5::Quick)

set_target_properties(
    declarative-camera
    PROPERTIES
    VERSION 1.0
    DEBUG_POSTFIX ""
)

hunter_add_package(QtAndroidCMake)
list(APPEND CMAKE_MODULE_PATH "${QTANDROIDCMAKE_ROOT}")
include(AddQtAndroidApk)

add_qt_android_apk(
    TARGET declarative-camera-apk
    BASE_TARGET declarative-camera
    LAUNCH_TARGET declarative-camera-launch
    PACKAGE_NAME declarative.camera.qt
    MANIFEST "${CMAKE_CURRENT_LIST_DIR}/AndroidManifest.xml"
    QML_ROOT "${CMAKE_CURRENT_LIST_DIR}"
)

hunter_add_package(Android-SDK)
message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")
