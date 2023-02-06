cmake_minimum_required(VERSION 3.10)
project(GitpodCpp)

# Use Conan to manage dependencies
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

# Add source files
file(GLOB_RECURSE SOURCE_FILES
     "${PROJECT_SOURCE_DIR}/src/*.cpp"
     "${PROJECT_SOURCE_DIR}/include/*.h")

# Add executable target
add_executable(${PROJECT_NAME} ${SOURCE_FILES})

# Link dependencies
target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})

# Set include directories
target_include_directories(${PROJECT_NAME}
  PRIVATE "${PROJECT_SOURCE_DIR}/include"
  PRIVATE ${CONAN_INCLUDE_DIRS})
