# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)
include("../common.cmake")

project(AndroidCMake)

add_executable(foo foo.cpp)

hunter_add_package(Android-Apk)
list(APPEND CMAKE_MODULE_PATH "${ANDROID-APK_ROOT}")

include(AndroidApk) # android_add_test

enable_testing()
android_add_test(NAME FooTest COMMAND foo)
android_add_test(NAME FooTestArg COMMAND foo arg)
android_add_test(NAME FooTestArgs COMMAND foo arg1 arg2 arg3)
android_add_test(NAME FooTestArgsSpaces COMMAND foo arg1 arg2 "arg3 arg4")

hunter_add_package(Android-SDK)
message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")
