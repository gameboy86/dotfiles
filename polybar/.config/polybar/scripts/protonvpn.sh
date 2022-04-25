#!/bin/bash

OUTPUT=`protonvpn s`
PROTON_STATUS=`echo "$OUTPUT" | awk '/Status/{print $2}'`

if [ `protonvpn s | awk '/Status/{print $2}'` = 'Connected' ]
then
    IP=`echo "$OUTPUT" | awk '/IP/{print $2}'`
    SERVER=`echo "$OUTPUT" | awk '/Server/{print $2}'`
    LOAD=`echo "$OUTPUT" | awk '/Load/{print $2}'`
    echo "ON"
else 
    echo "OFF"
fi
