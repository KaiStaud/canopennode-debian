#!/bin/bash
cocomm "set node 5"
cocomm "w 0x1403 1 u32 0x80000000"
cocomm "w 0x1603 0 u8 0"
cocomm "w 0x1603 1 u32 0x21100120"
cocomm "w 0x1603 0 u8 1"
cocomm "w 0x1403 1 u32 0x00000384"
cocomm "r 0x2110 1 i32"

echo "Reading node 5's RPDO3 mapping..."
pc=0x1403; pm=0x1603
cocomm "[1] r $pc 1 x32" "[2] r $pc 2 u8" "[5] r $pc 5 u16"
cocomm "[0] r $pm 0 u8"; for i in {1..8}; do cocomm "[$i] r $pm $i x32"; done

# Should look like this:
#[1] 0x00000384
#[2] 254
#[5] 0
#[0] 1
#[1] 0x21100120
#[2] 0x00000000
#[3] 0x00000000
#[4] 0x00000000
#[5] 0x00000000
#[6] 0x00000000
#[7] 0x00000000
#[8] 0x00000000

echo "Writing into node 4's TPDO..."
cocomm "set node 4"
cocomm "w 0x2110 1 u32 0xAB00CDEF"
sleep 5
echo "Reading from node 5's RPDO..."
cocomm "set node 5"
cocomm "r 0x2110 1 i32"

