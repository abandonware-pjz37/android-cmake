Hunterized version of [HelloGL2](http://doc.qt.io/qt-5/qtopengl-hellogl2-example.html) Qt example.
[Toolchain](https://github.com/ruslo/polly/wiki/Toolchain-list#android-ndk-xxx) with API 19 should be used (see `config.cmake` local file). For example:
```bash
> build.py --toolchain ndroid-ndk-r10e-api-19-armeabi-v7a-neon --verbose --clear
```

This command will build and install apk to your device. Find application with name `hellogl2` and run it.
