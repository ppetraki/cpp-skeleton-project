cmake_minimum_required( VERSION 3.5 )

project( MYPROJECT VERSION 1.0.0 )

add_cxx11_executable( BUILD_TARGET myproject
    SOURCE_LIST myproject.cpp )

#target_link_libraries( example ... )
