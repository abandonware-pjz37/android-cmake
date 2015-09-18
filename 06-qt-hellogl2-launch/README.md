[HelloGL2 example](https://github.com/forexample/android-cmake/tree/master/05-qt-hellogl2) with launch target.

CMake creates 3 targets:
```bash
> grep TARGET CMakeLists.txt 
    TARGET preview-qt-apk
    BASE_TARGET preview-qt
    LAUNCH_TARGET preview-qt-launch
```

* `preview-qt` simple library target (ALL)
* `preview-qt-apk` target to create Android APK, since there is no `INSTALL` option in `add_qt_android_apk` hence APK will not be installed on device after APK created (ALL)
* `preview-qt-launch` target to create Android APK, install it on device and launch Qt application

### Examples

Run default build. Targets that belongs to `ALL` will be built: `preview-qt`, `preview-qt-apk` (but not `preview-qt-launch`). I.e. build library `preview-qt` and create APK (no install, no launch):
```bash
> build.py --toolchain android-ndk-r10e-api-19-armeabi-v7a-neon --config Release --verbose
```

Run build of the library only:
```bash
> build.py --toolchain android-ndk-r10e-api-19-armeabi-v7a-neon --config Release --verbose --target preview-qt
```

Run build of the library and create APK:
```bash
> build.py --toolchain android-ndk-r10e-api-19-armeabi-v7a-neon --config Release --verbose --target preview-qt-apk
```

Run build of the library, create APK, install it to device and launch:
```bash
> build.py --toolchain android-ndk-r10e-api-19-armeabi-v7a-neon --config Release --verbose --target preview-qt-launch
```
