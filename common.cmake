# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# * https://github.com/hunter-packages/gate
# * https://github.com/ruslo/hunter
include("${CMAKE_CURRENT_LIST_DIR}/cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.12.23.tar.gz"
    SHA1 "e1aad873adb4d0cd254c070f3e1a1c181d8daaea"
    ${CONFIG_FILE}
)
