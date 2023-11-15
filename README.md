# CMake package configuration file example

An example of how a library can be distributed using the [CMake config file](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Finding%20Packages.html#creating-cmake-package-configuration-files).
The project contains the package `my_lib` that provides a library as well as a configuration file.
After installing the package, the user can get access to the library via CMake's [find_package()](https://cmake.org/cmake/help/latest/command/find_package.html) routine.

## Usage

1. Build and install the package:

    ```
    cmake -S . -B build
    cmake --build build
    cmake --install build
    ```
    
1. Build and install the project that uses the package:

    ```
    cmake -S . -B build
    cmake --build build
    build/my_exe
    ```

1. Verify the expected output: `/// my_lib::add_one( 2 ) returned 3`

### Troubleshooting

In case the package installation fails complaining about the missing `GLIBCXX` version required by CMake, this could be because of the wrong `rpath`.
Either fix that (better), or do

    ```
    sudo -s
    export LD_LIBRARY_PATH=</path/to/libstdc++.so/with/needed/GLIBCXX/version> # e.g. /usr/local/lib64
    make install
    exit
    ```

You should see the output listing the files that were installed.
