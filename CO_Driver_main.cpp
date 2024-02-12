extern "C"
{
    #include "CO_Driver.h"
}
#include <iostream>

struct RadarObject
{
    double x = 0.0;
    double y = 0.0;
    double z = 0.0;
};

int main(int argc, char *argv[]){
std::cout<<"CO CPP!";
co_main (argc, argv);
}