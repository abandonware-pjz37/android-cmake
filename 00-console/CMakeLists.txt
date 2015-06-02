# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# * https://github.com/hunter-packages/gate
# * https://github.com/ruslo/hunter
include("cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/android-004.tar.gz"
    SHA1 "a3c46a481bd8583c600f819366ed0d0f81b9b3d1"
)

project(AndroidCMake)

add_executable(foo foo.cpp)

hunter_add_package(Android-Apk)
list(APPEND CMAKE_MODULE_PATH "${ANDROID-APK_ROOT}")

include(AndroidApk) # android_add_test

enable_testing()
android_add_test(NAME FooTest COMMAND foo)
android_add_test(NAME FooTestArg COMMAND foo arg)
android_add_test(NAME FooTestArgs COMMAND foo arg1 arg2 arg3)
