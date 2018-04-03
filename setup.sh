#!/bin/bash

#EXTRA_CMAKE_FLAGS="-DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++"
BUILD_GEN="-G Ninja"

rm -rf build-debug
mkdir build-debug || :
cd build-debug && cmake ${BUILD_GEN} -DCMAKE_BUILD_TYPE=Debug .. ${EXTRA_CMAKE_FLAGS}
