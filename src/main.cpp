#include <iostream>
#include <my_lib/add_one.hpp>

int main(int argc, char *argv[])
{
    std::cout << "/// my_lib::add_one( 2 ) returned "
              << my_lib::add_one( 2 ) << std::endl;
    return 0;
}
