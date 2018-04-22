cmake_minimum_required( VERSION 3.5 )

include( AddCxxExecutable )

add_cxx11_executable( BUILD_TARGET test-myproject
    SOURCE_LIST test-myproject.cpp )

target_include_directories( test-myproject
    PRIVATE "${MYPROJECT_SOURCE_DIR}/src" )

#target_link_libraries( test-myproject ... )


add_test( test-myproject test-myproject )
