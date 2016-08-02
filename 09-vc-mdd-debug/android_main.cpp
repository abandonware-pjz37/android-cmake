// Copyright (c) 2016, Ruslan Baratov
// All rights reserved.

#include <android_native_app_glue.h>
#include <android/log.h>

void foo_3(int a) {
  __android_log_print(ANDROID_LOG_INFO, "MyHelloApp", "Message 1");

  int b = a + 1;

  __android_log_print(ANDROID_LOG_INFO, "MyHelloApp", "Message 2");
}

void foo_2(int a) {
  foo_3(a + 1);
}

void foo_1(int a) {
  foo_2(a + 1);
}

void android_main(struct android_app* state) {
  app_dummy(); // Make sure glue isn't stripped

  foo_1(1);

  ANativeActivity_finish(state->activity);
}
