cmake_minimum_required( VERSION 3.20 )
project( MyProject CXX )

find_package( my_lib 1.0 REQUIRED)
#include_directories(${my_lib_INCLUDE_DIRS})

add_executable( my_exe src/main.cpp )
target_link_libraries( my_exe my_lib ) # link to imported library
