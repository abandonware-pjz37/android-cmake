[HelloGL2 example](https://github.com/forexample/android-cmake/tree/master/05-qt-hellogl2) with launch target.

CMake creates 3 targets:
```bash
> grep TARGET CMakeLists.txt 
    TARGET hellogl2-apk
    BASE_TARGET hellogl2
    LAUNCH_TARGET hellogl2-launch
```

* `hellogl2` simple library target (ALL)
* `hellogl2-apk` target to create Android APK, since there is no `INSTALL` option in `add_qt_android_apk` hence APK will not be installed on device after APK created (ALL)
* `hellogl2-launch` target to create Android APK, install it on device and launch Qt application

### Examples

Run default build. Targets that belongs to `ALL` will be built: `hellogl2`, `hellogl2-apk` (but not `helogl2-launch`). I.e. build library `hellogl2` and create APK (no install, no launch):
```bash
> build.py --toolchain android-ndk-r10e-api-19-armeabi-v7a-neon --config Release --verbose
```

Run build of the library only:
```bash
> build.py --toolchain android-ndk-r10e-api-19-armeabi-v7a-neon --config Release --verbose --target hellogl2
```

Run build of the library and create APK:
```bash
> build.py --toolchain android-ndk-r10e-api-19-armeabi-v7a-neon --config Release --verbose --target hellogl2-apk
```

Run build of the library, create APK, install it to device and launch:
```bash
> build.py --toolchain android-ndk-r10e-api-19-armeabi-v7a-neon --config Release --verbose --target hellogl2-launch
```
