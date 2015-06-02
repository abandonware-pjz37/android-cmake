Create simple executable and run it using CMake's `add_test` with `adb push`/`adb shell`:

```bash
> build.py --toolchain android-ndk-r10e-api-21-x86 --verbose --clear --test --config Debug
1: Test command: ...
1: Test timeout computed to be: 9.99988e+06
1: Push application to device: /.../_builds/android-ndk-r10e-api-21-x86-Debug/foo ->
    /data/bin/AndroidCMake/AndroidTest/FooTest/foo
1: 1401 KB/s (3581560 bytes in 2.495s)
1: Set executable permissions
1: Run application: /data/bin/AndroidCMake/AndroidTest/FooTest/foo
1: Hello, Android! (Debug)
1: Clean-up
1: Done
1/3 Test #1: FooTest ..........................   Passed    2.75 sec
test 2
    Start 2: FooTestArg

2: Test command: ...
2: Test timeout computed to be: 9.99988e+06
2: Push application to device: /.../_builds/android-ndk-r10e-api-21-x86-Debug/foo ->
    /data/bin/AndroidCMake/AndroidTest/FooTestArg/foo
2: 1387 KB/s (3581560 bytes in 2.520s)
2: Set executable permissions
2: Run application: /data/bin/AndroidCMake/AndroidTest/FooTestArg/foo arg
2: argv[1] = arg
2: Hello, Android! (Debug)
2: Clean-up
2: Done
2/3 Test #2: FooTestArg .......................   Passed    2.67 sec
test 3
    Start 3: FooTestArgs

3: Test command: ...
3: Test timeout computed to be: 9.99988e+06
3: Push application to device: /.../_builds/android-ndk-r10e-api-21-x86-Debug/foo ->
    /data/bin/AndroidCMake/AndroidTest/FooTestArgs/foo
3: 1342 KB/s (3581560 bytes in 2.605s)
3: Set executable permissions
3: Run application: /data/bin/AndroidCMake/AndroidTest/FooTestArgs/foo arg1;arg2;arg3
3: argv[1] = arg1
3: argv[2] = arg2
3: argv[3] = arg3
3: Hello, Android! (Debug)
3: Clean-up
3: Done
3/3 Test #3: FooTestArgs ......................   Passed    3.00 sec
```

Same for `Release`:
```bash
> build.py --toolchain android-ndk-r10e-api-21-x86 --verbose --clear --test --config Release
...
1: Hello, Android! (Not debug)
...
2: Hello, Android! (Not debug)
...
3: Hello, Android! (Not debug)
...
```

### Links
* [OpenCV run.sh script](https://github.com/Itseez/opencv/blob/a28c8d002d69dc8b590a7b7c10393d4266036efc/samples/android/hello-android/run.sh)
* [android_add_test](https://github.com/hunter-packages/android-apk/blob/8661ed4f85610c2412d58faf1b579e058d6024fc/AndroidApk.cmake#L551)
* [Android-Apk](https://github.com/ruslo/hunter/wiki/pkg.android.apk)
