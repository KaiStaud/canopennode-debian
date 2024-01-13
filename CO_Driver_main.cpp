extern "C"
{
    #include "CO_Driver.h"
}
#include <iostream>
#include "iox/signal_watcher.hpp"
#include "iceoryx_posh/popo/publisher.hpp"
#include "iceoryx_posh/runtime/posh_runtime.hpp"


struct RadarObject
{
    double x = 0.0;
    double y = 0.0;
    double z = 0.0;
};

int main(int argc, char *argv[]){

        constexpr char APP_NAME[] = "iox-cpp-publisher-helloworld";
    iox::runtime::PoshRuntime::initRuntime(APP_NAME);
    //! [initialize runtime]

    //! [create publisher]
    iox::popo::Publisher<RadarObject> publisher({"Radar", "FrontLeft", "Object"});
    //! [create publisher]

    double ct = 0.0;
    //! [wait for term]
    while (!iox::hasTerminationRequested())
    {        ++ct;
                auto loanResult = publisher.loan();
        //! [loan]
        //! [publish]
        if (loanResult.has_value())
        {
            auto& sample = loanResult.value();
            // Sample can be held until ready to publish
            sample->x = ct;
            sample->y = ct;
            sample->z = ct;
            sample.publish();
        }
        //! [publish]
        //! [error]
        else
        {
            auto error = loanResult.error();
            // Do something with error
            std::cerr << "Unable to loan sample, error code: " << error << std::endl;
        }
    }
    std::cout<<"CO CPP!";
co_main (argc, argv);
}