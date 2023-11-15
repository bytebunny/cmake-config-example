#include "foo.hpp"
#include "add_one.hpp"

namespace my_lib
{
    int foo( int n )
    {
        return add_one( n );
    }
}
