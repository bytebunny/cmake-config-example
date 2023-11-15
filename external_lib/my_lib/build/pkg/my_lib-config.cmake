# Compute installation prefix relative to this file.
get_filename_component(_dir "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_prefix "${_dir}/../.." ABSOLUTE)

set( lib_name "my_lib" )

# Import the targets.
include("${_prefix}/lib/${lib_name}-1.0/my_lib-targets.cmake")

# Report other information.
set(${lib_name}_INCLUDE_DIRS "${_prefix}/include/${lib_name}-1.0/${lib_name}")
