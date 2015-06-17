# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# * https://github.com/hunter-packages/gate
# * https://github.com/ruslo/hunter
include("${CMAKE_CURRENT_LIST_DIR}/cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.11.1.tar.gz"
    SHA1 "3b8ffc911b3cd8308547ef1d3a5a69331dab5c19"
    ${CONFIG_FILE}
)
