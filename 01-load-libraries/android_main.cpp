// Copyright (c) 2015, Ruslan Baratov
// All rights reserved.

#include <android_native_app_glue.h>
#include <android/log.h>

#if !defined(ANDROID_APP_NAME)
# error "Please define ANDROID_APP_NAME"
#endif

void android_main(struct android_app* state) {
  app_dummy(); // Make sure glue isn't stripped

  __android_log_print(
      ANDROID_LOG_INFO,
      ANDROID_APP_NAME,
#if defined(NDEBUG)
      "Hello from Android! (Not debug)"
#else
      "Hello from Android! (Debug)"
#endif
  );

  ANativeActivity_finish(state->activity);
}
