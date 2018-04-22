#!/bin/sh
cmake --build build-debug

echo "running myproject main"
build-debug/myproject/myproject

echo " "

echo "running tests"
cd build-debug && ctest
