# cpp skeleton project

A complete cmake project which includes gtest driven unit tests plus a highly customized
vim configuration, including YCM for code completion and clang-format.

Tested on Ubuntu 16.04 and 18.04.

## Bootstrap environment
This takes about 5 minutes, which is mostly due to building YCM from source. This installs
everything you need to build, editor, and code coverage support.

<pre>
./bootstrap.sh
</pre>

## Project Setup
Configure cmake project in Debug mode using Ninja. Optimizations are completely
disabled in Debug mode so when you switch to GDB you can actually find things.

<pre>
make setup-debug
</pre>

## build
<pre>
make build-debug
</pre>

and you can do the same thing for release mode.

## test
Compile everything, run the sample unit tests via ctest.

<pre>
make test-debug
</pre>

## code coverage
Just like before but...
<pre>
make test-coverage
</pre>

Every target created with the AddCxxExecutable wrapper automatically creates a gcov
target with the name ${TARGET}_coverage. It also selects Debug mode for you.

## TODO
- refactor makefile with template functions so we can support debug/release/coverage targets with
  less boilerplate
- create a add_test wrapper that adds the _coverage target to ctest
