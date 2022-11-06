# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(main_library VERSION 0.0.1 LANGUAGES CXX)

add_library(main SHARED
  "main.cpp"
)
add_executable(main_test main.cpp)

set_target_properties(main PROPERTIES
  PUBLIC_HEADER main.h
  OUTPUT_NAME "main"
)

target_compile_definitions(main PUBLIC DART_SHARED_LIB)
