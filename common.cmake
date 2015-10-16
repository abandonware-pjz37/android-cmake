# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# * https://github.com/hunter-packages/gate
# * https://github.com/ruslo/hunter
include("${CMAKE_CURRENT_LIST_DIR}/cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.12.22.tar.gz"
    SHA1 "868408f1f3d8deeaab13f4ebca28b02ec2dfcade"
    ${CONFIG_FILE}
)
