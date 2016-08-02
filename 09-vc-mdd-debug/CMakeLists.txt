# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.4)

include("../common.cmake")

project(AndroidCMake)

# * https://github.com/ruslo/hunter/wiki/pkg.android.apk
hunter_add_package(Android-Apk)
list(APPEND CMAKE_MODULE_PATH "${ANDROID-APK_ROOT}")
include(AndroidApk) # android_create_apk

hunter_add_package(Android-SDK)
message(STATUS "Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
message(STATUS "Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
message(STATUS "Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")

message(STATUS "Tools -> Options -> Cross Platform -> C++ -> Android: ${ANDROID-SDK_ROOT}/android-sdk")

# * https://github.com/ruslo/hunter/wiki/pkg.android.modules
# * https://github.com/hunter-packages/android-cmake
hunter_add_package(Android-Modules)
list(APPEND CMAKE_MODULE_PATH "${ANDROID-MODULES_ROOT}")
include(AndroidNdkModules) # android_ndk_import_module_native_app_glue

android_ndk_import_module_native_app_glue() # native_app_glue

add_library(simple SHARED android_main.cpp)
target_link_libraries(simple log android native_app_glue)

android_create_apk(
    BASE_TARGET simple
    INSTALL_TARGET install-simple
    DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/apk"
)
