// Copyright (c) 2015, Ruslan Baratov
// All rights reserved.

#include <boost/filesystem.hpp>
#include <iostream> // std::cout

int main(int argc, char** argv) {
  namespace fs = boost::filesystem;
  std::cout << "Current path: " << fs::current_path() << std::endl;
}
