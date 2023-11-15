cmake_minimum_required( VERSION 3.23 ) # we use FILE_SET

project( my_lib VERSION 1.0 LANGUAGES CXX )

add_library( ${PROJECT_NAME} STATIC )

target_include_directories(${PROJECT_NAME} PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/${PROJECT_NAME}>
  $<INSTALL_INTERFACE:include/${PROJECT_NAME}-${PROJECT_VERSION}/> )

target_sources( ${PROJECT_NAME}
  PRIVATE
  src/foo.cpp
  src/foo.hpp
  src/add_one.cpp )

# From CMake 3.23 version target_sources() contains FILE_SET option.
# Now one can define the headers in one place and automatically
# use them on an install operation.
# Even include_directories() is not necessary anymore.
# This gives more improvements and can be used for modules export.
target_sources( ${PROJECT_NAME} PUBLIC
  FILE_SET public_headers
  TYPE HEADERS
  FILES include/${PROJECT_NAME}/add_one.hpp )

include( GNUInstallDirs )

install( FILES include/${PROJECT_NAME}/add_one.hpp
  #EXPORT ${PROJECT_NAME}-targets
  DESTINATION include/${PROJECT_NAME}-${PROJECT_VERSION}/${PROJECT_NAME} )

# install command needs to reference the file set again
install( TARGETS ${PROJECT_NAME}
  DESTINATION lib/${PROJECT_NAME}-${PROJECT_VERSION}
  EXPORT ${PROJECT_NAME}-targets
  FILE_SET public_headers
  )
  #LIBRARY DESTINATION lib/${PROJECT_NAME}-${PROJECT_VERSION}
  #FILE_SET HEADERS )

install(EXPORT ${PROJECT_NAME}-targets
    DESTINATION lib/${PROJECT_NAME}-${PROJECT_VERSION})

# Create and install package configuration and version files.
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/pkg/${PROJECT_NAME}-config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/pkg/${PROJECT_NAME}-config.cmake @ONLY)

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}-config-version.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkg/${PROJECT_NAME}-config.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
  DESTINATION lib/${PROJECT_NAME}-${PROJECT_VERSION})
