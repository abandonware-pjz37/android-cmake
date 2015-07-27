# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# * https://github.com/hunter-packages/gate
# * https://github.com/ruslo/hunter
include("${CMAKE_CURRENT_LIST_DIR}/cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.12.3.tar.gz"
    SHA1 "0dc8f1acca07afbe2c291f4c5555cfd88e49e372"
    ${CONFIG_FILE}
)
