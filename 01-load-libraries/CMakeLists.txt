# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0.0)

# * https://github.com/hunter-packages/gate
# * https://github.com/ruslo/hunter
include("cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/android-004.tar.gz"
    SHA1 "a3c46a481bd8583c600f819366ed0d0f81b9b3d1"
)
project(AndroidCMake)

# * https://github.com/ruslo/hunter/wiki/pkg.android.apk
hunter_add_package(Android-Apk)
list(APPEND CMAKE_MODULE_PATH "${ANDROID-APK_ROOT}")
include(AndroidApk)

hunter_add_package(Android-SDK)
message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")

add_library(
    simple
    SHARED
    "${ANDROID_NDK}/sources/android/native_app_glue/android_native_app_glue.c"
    android_main.cpp
)
target_compile_definitions(simple PUBLIC "ANDROID_APP_NAME=\"SimpleApp\"")
target_link_libraries(simple log android)
target_include_directories(
    simple PUBLIC "${ANDROID_NDK}/sources/android/native_app_glue"
)

android_create_apk(NAME simple DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/apk")
