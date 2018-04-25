#EXTRA_CMAKE_FLAGS=-DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
BUILD_GEN=-G Ninja

.PHONY: all
all:
	cat README.md

.PHONY: clean
clean:
	rm -rf build-*

# XXX it would be nice to conditionally run setup-* iif a cmake file was changed or
# the directory didn't exist to begin with

# Debug
.PHONY: setup-debug
setup-debug:
	mkdir build-debug || :
	cd build-debug && cmake $(BUILD_GEN) -DCMAKE_BUILD_TYPE=Debug .. $(EXTRA_CMAKE_FLAG)

.PHONY: build-debug
build-debug: setup-debug
	cmake --build build-debug

.PHONY: test-debug
test-debug: build-debug
	cd build-debug && ctest

# Release
.PHONY: setup-release
setup-release:
	mkdir build-release || :
	cd build-release && cmake $(BUILD_GEN) -DCMAKE_BUILD_TYPE=Release .. $(EXTRA_CMAKE_FLAG)

.PHONY: build-release
build-release: setup-release
	cmake --build build-release

.PHONY: test-release
test-release: build-release
	cd build-release && ctest

# Coverage
.PHONY: setup-coverage
setup-coverage:
	mkdir build-coverage || :
	cd build-coverage && cmake $(BUILD_GEN) -DCMAKE_BUILD_TYPE=Coverage .. $(EXTRA_CMAKE_FLAG)

.PHONY: build-coverage
build-coverage: setup-coverage
	cmake --build build-coverage

.PHONY: test-coverage
test-coverage: build-coverage
	cd build-coverage && ctest
