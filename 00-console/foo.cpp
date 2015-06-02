// Copyright (c) 2015, Ruslan Baratov
// All rights reserved.

#include <iostream> // std::cout

int main(int argc, char** argv) {
  for(int i=1; i<argc; ++i) {
    std::cout << "argv[" << i << "] = " << argv[i] << std::endl;
  }

#if defined(NDEBUG)
  std::cout << "Hello, Android! (Not debug)" << std::endl;
#else
  std::cout << "Hello, Android! (Debug)" << std::endl;
#endif
}
