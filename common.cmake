# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# * https://github.com/hunter-packages/gate
# * https://github.com/ruslo/hunter
include("${CMAKE_CURRENT_LIST_DIR}/cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.15.6.tar.gz"
    SHA1 "3dc0cd2ccbc52e8be93967dbc583303a1e825aa2"
    ${CONFIG_FILE}
)
