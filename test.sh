#!/bin/sh
cmake --build build-debug

echo "running example main"
build-debug/myproject/src/example

echo " "

echo "running tests"
cd build-debug/myproject && ctest
