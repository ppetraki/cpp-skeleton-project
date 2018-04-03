cmake_minimum_required( VERSION 3.5 )

include( AddCxxExecutable )

include_directories( "${MYPROJECT_SOURCE_DIR}/src" )

add_cxx11_executable( BUILD_TARGET test_feature
    SOURCE_LIST test_feature.cpp )

#target_link_libraries( test_feature ... )


add_test( test_feature test_feature )
