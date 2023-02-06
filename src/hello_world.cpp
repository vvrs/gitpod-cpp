#include <gitpod_cpp/hello_world.h>
#include <fmt/format.h>

void printHello()
{
    std::cout << fmt::format("Hello, {}!", "World") << std::endl;
}