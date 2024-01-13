project(CO_Demo)
cmake_minimum_required(VERSION 3.18)
find_package(iceoryx_posh REQUIRED)
set(SOURCES 
	CANopenLinux/CO_driver.c 
	CANopenLinux/CO_error.c 
	CANopenLinux/CO_epoll_interface.c 
	CANopenLinux/CO_storageLinux.c 

	CANopenLinux/CANopenNode/301/CO_ODinterface.c 
	CANopenLinux/CANopenNode/301/CO_NMT_Heartbeat.c 
	CANopenLinux/CANopenNode/301/CO_HBconsumer.c 
	CANopenLinux/CANopenNode/301/CO_Emergency.c 
	CANopenLinux/CANopenNode/301/CO_SDOserver.c 
	CANopenLinux/CANopenNode/301/CO_TIME.c 
	CANopenLinux/CANopenNode/301/CO_SYNC.c 
	CANopenLinux/CANopenNode/301/CO_PDO.c 
	CANopenLinux/CANopenNode/301/crc16-ccitt.c 
  	CANopenLinux/CANopenNode/301/CO_fifo.c 
    CANopenLinux/CANopenNode/301/CO_SDOclient.c 

	CANopenLinux/CANopenNode/303/CO_LEDs.c 
	
    CANopenLinux/CANopenNode/304/CO_GFC.c 
    CANopenLinux/CANopenNode/304/CO_SRDO.c 

    CANopenLinux/CANopenNode/305/CO_LSSslave.c
    CANopenLinux/CANopenNode/305/CO_LSSmaster.c 
    CANopenLinux/CANopenNode/305/CO_LSSslave.c 

    CANopenLinux/CANopenNode/309/CO_gateway_ascii.c 
    
    CANopenLinux/CANopenNode/storage/CO_storage.c 
	CANopenLinux/CANopenNode/CANopen.c 
	
    demo/CO_application.c 
	demo/OD.c 
	demo/CO_identificators.c 
	demo/objectAccessOD.c 
	demo/domainDemo.c 
	CANopenLinux/CO_main_basic.c 
    
    CO_Driver_main.cpp)

add_library(tracepoint-provider SHARED demo/hello-tp.c)
target_link_libraries(tracepoint-provider lttng-ust)

add_executable(demoLinuxDevice CANopenLinux/CO_main_basic.c ${SOURCES})
 #[[add_executable(demoLinuxDevice CANopenLinux/CO_main_basic.c ${SOURCES}) ]]
include_directories( 
	demo
    demo/linux/
    CANopenLinux
    CANopenLinux/CANopenNode
	CANopenNode/example)

target_link_libraries(demoLinuxDevice pthread lttng-ust dl tracepoint-provider libshmem iceoryx_posh::iceoryx_posh)
