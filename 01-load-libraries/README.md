Adapted example from: http://stackoverflow.com/a/22859152/2288008

### Notes
* Toolchain from [taka-no-me](https://github.com/taka-no-me/android-cmake) wrapped by [Polly toolchains](https://github.com/ruslo/polly/blob/master/os/android.cmake)
* Apk CMake module downloaded by Hunter, see [pkg.android.apk](https://github.com/ruslo/hunter/wiki/pkg.android.apk)

### Usage

```bash
> build.py --toolchain android-ndk-r10e-api-21-x86 --verbose --clear --config Release
```

Take a look at [logs](https://github.com/forexample/android-cmake#logging):
```
I/SimpleApp( 2348): Hello from Android! (Not debug)
```

Same for `Debug`:

```bash
> build.py --toolchain android-ndk-r10e-api-21-x86 --verbose --clear --config Debug
> /.../Install/android-sdk/platform-tools/adb shell logcat
...
I/SimpleApp( 2525): Hello from Android! (Debug)
```
