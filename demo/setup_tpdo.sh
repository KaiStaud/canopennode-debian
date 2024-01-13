#!/bin/bash
echo "Configuring Node 4's TPDO"
cocomm "set node 4"
cocomm "w 0x1802 1 u32 0x80000000"
cocomm "w 0x1A02 0 u8 0"
cocomm "w 0x1A02 1 u32 0x21100120"
cocomm "w 0x1A02 0 u8 1"
cocomm "w 0x1802 1 u32 0x00000384"
cocomm "w 0x1802 5 u16 500"

