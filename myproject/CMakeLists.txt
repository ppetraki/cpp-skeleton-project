cmake_minimum_required( VERSION 3.5 )

project( MYPROJECT VERSION 1.0.0 )

include( AddCxxExecutable )
add_cxx11_executable( BUILD_TARGET example
    SOURCE_LIST example.cpp )

#target_link_libraries( example ... )
