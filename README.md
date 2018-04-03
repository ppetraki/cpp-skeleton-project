# cpp skeleton project

A complete cmake project which includes gtest driven unit tests plus a highly customized
vim configuration, including YCM for code completion and clang-format.

Tested on Ubuntu 16.04 and 18.04.

## Install
About 5 minutes.

<pre>
cd dev-setup && ./dev-setup.sh
</pre>

## Project Setup
Configure cmake project in Debug mode using Ninja. Optimizations are completely
disabled in Debug mode so when you switch to GDB you can actually find things.

<pre>
./setup.sh
</pre>

## Smoke test
Compile everything, run the example executable and the sample unit test via ctest.

<pre>
./test.sh
</pre>
