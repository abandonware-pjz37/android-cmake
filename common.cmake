# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# * https://github.com/hunter-packages/gate
# * https://github.com/ruslo/hunter
include("${CMAKE_CURRENT_LIST_DIR}/cmake/HunterGate.cmake")
HunterGate(
    ULR "https://github.com/ruslo/hunter/archive/v0.12.11.tar.gz"
    SHA1 "79173425791e1fac4bafdecfc47a4edb994b2b1d"
    ${CONFIG_FILE}
)
