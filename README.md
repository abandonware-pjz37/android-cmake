Examples of using [Hunter](https://github.com/ruslo/hunter) package manager to build and run Android application.

## Requirements

### Android NDK

Go to [download](https://developer.android.com/ndk/downloads/index.html) page and choose NDK for your platform. E.g. Mac OS X:
```bash
> wget http://dl.google.com/android/ndk/android-ndk-r10e-darwin-x86_64.bin
> chmod +x android-ndk-r10e-darwin-x86_64.bin
> ./android-ndk-r10e-darwin-x86_64.bin
```

Now save location of NDK directory so it can be found in toolchain:
```bash
> export ANDROID_NDK_r10e="`pwd`/android-ndk-r10e"
```

Verify correctness:
```bash
> ls "${ANDROID_NDK_r10e}/README.txt"
/.../android-ndk-r10e/README.txt
```

Note that there is no need to download [Android SDK](http://developer.android.com/sdk/index.html#Other) manually since it will be downloaded by Hunter.

### Android CMake toolchain

Clone [Polly](https://github.com/ruslo/polly) collection of toolchains and add `<polly>/bin/build.py` script to `PATH`:

```bash
> git clone https://github.com/ruslo/polly
> export PATH="`pwd`/polly/bin":$PATH
> which build.py
/.../polly/bin/build.py
```

### Android tools

Every example will print path to the `android`, `emulator` and `adb` tools:
```
Path to `android`: /.../Install/android-sdk/tools/android
Path to `emulator`: /.../Install/android-sdk/tools/emulator
Path to `adb`: /.../Install/android-sdk/platform-tools/adb
```

You need to use this tools to create/start emulator. If no real or virtual device started you will see this message while building example:
```bash
Added file /.../_builds/android-ndk-r10e-api-21-x86/apk/build.xml
Added file /.../_builds/android-ndk-r10e-api-21-x86/apk/proguard-project.txt
/.../Install/android-sdk/platform-tools/adb uninstall org.pixellight.test
- waiting for device -
```

### Create device

Choose device name from the list. E.g `Nexus 6`:
```bash
> /.../Install/android-sdk/tools/android list device | grep 'Nexus 6'
id: 8 or "Nexus 6"
    Name: Nexus 6
```

Choose target and skin:
```bash
> /.../Install/android-sdk/tools/android list target
Available Android targets:
----------
id: 1 or "android-21"
     Name: Android 5.0.1
     Type: Platform
     API level: 21
     Revision: 2
     Skins: HVGA, QVGA, WQVGA400, WQVGA432, WSVGA, WVGA800 (default), WVGA854, WXGA720, WXGA800, WXGA800-7in
 Tag/ABIs : default/x86
...
```

Create virtual device:
```
> /.../Install/android-sdk/tools/android create avd --name "Nexus_6_API_21_WXGA720" --skin WXGA720 --target "android-21"
```

Now you can find it in list of available devices:
```
> /.../Install/android-sdk/tools/android list avd
Available Android Virtual Devices:
    Name: Nexus_6_API_21_WXGA720
    Path: /.../.android/avd/Nexus_6_API_21_WXGA720.avd
  Target: Android 5.0.1 (API level 21)
 Tag/ABI: default/x86
    Skin: wxga720
```

Let's run it:
```bash
> /.../Install/android-sdk/tools/emulator -avd Nexus_6_API_21_WXGA720
```

If you need `sdcard` for testing:
```bash
> /.../Install/android-sdk/tools/mksdcard 512M "`pwd`/android-sdcard"
> /.../Install/android-sdk/tools/emulator -sdcard "`pwd`/android-sdcard" -avd Nexus_6_API_21_WXGA720
```

### Choosing toolchain

#### API version

Take a look at this [wiki](https://en.wikipedia.org/wiki/Android_version_history#Version_history_by_API_level) to pick the version you need. E.g. if your device using Android 4.4 you need API level <= 19, for instance `android-ndk-r10e-api-16-*`.

#### CPU architecture

Run next command to determine CPU architecture of emulator:
```bash
> /.../Install/android-sdk/platform-tools/adb -e shell getprop ro.product.cpu.abi
x86
```

And this one for device:
```bash
> /.../Install/android-sdk/platform-tools/adb -d shell getprop ro.product.cpu.abi
armeabi-v7a
```

### Logging

You can use `adb` to monitor logging messages:
```bash
> /.../Install/android-sdk/platform-tools/adb shell logcat
```

### Examples

* [Console application](https://github.com/forexample/android-cmake/tree/master/00-console)
* [Load libraries](https://github.com/forexample/android-cmake/tree/master/01-load-libraries)
* [Boost.filesystem console](https://github.com/forexample/android-cmake/tree/master/02-console-boost-filesystem)
* [Boost.iostreams console](https://github.com/forexample/android-cmake/tree/master/03-console-boost-iostreams)
* [OpenCV console](https://github.com/forexample/android-cmake/tree/master/04-console-opencv)
* [Qt HelloGL2](https://github.com/forexample/android-cmake/tree/master/05-qt-hellogl2)
* [Qt HelloGL2 (with launch target)](https://github.com/forexample/android-cmake/tree/master/06-qt-hellogl2-launch)
* [Qt QML example](https://github.com/forexample/android-cmake/tree/master/07-mousearea-qml)
* [Qt QML camera](https://github.com/forexample/android-cmake/tree/master/08-declarative-camera)

### Links

* [Android toolchains](https://github.com/ruslo/polly/wiki/Toolchain-list#android-ndk-xxx)
* [Hunter package manager](https://github.com/ruslo/hunter)
* [Collection of CMake toolchains](https://github.com/ruslo/polly)
