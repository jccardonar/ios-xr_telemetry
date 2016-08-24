#!/bin/bash
#
# netem delay randomization script -- used to provide random delay values for rtt between hosts using tc-netem on linux
# developed by quinn snyder | snyderq@gmail.com
# release v0.1 | targeted for triangle topology of xrv9000 routers using netem host between each router link

# setting shell varibles for delay using random number modulo added to base value
DELAYXR1=$(($RANDOM %250 + 25))
DELAYXR2=$(($RANDOM %250 + 25))
DELAYXR3=$(($RANDOM %250 + 25))

# change the tc-netem delay values currently affecting traffic
echo "tc qdisc change dev eth1 root netem delay" $DELAYXR1"ms 0ms loss 0% limit 128000" | bash
echo "tc qdisc change dev eth3 root netem delay" $DELAYXR2"ms 0ms loss 0% limit 128000" | bash
echo "tc qdisc change dev eth5 root netem delay" $DELAYXR3"ms 0ms loss 0% limit 128000" | bash

# modify existing delay values in tc-netem init.d file, create temp file, copy temp file to init.d/netem for persistence
sed -i "s/.*eth1.*/tc qdisc add dev eth1 root netem delay $DELAYXR1\ms 0ms loss 0% limit 128000/" /etc/init.d/netem
sed -i "s/.*eth3.*/tc qdisc add dev eth3 root netem delay $DELAYXR2\ms 0ms loss 0% limit 128000/" /etc/init.d/netem
sed -i "s/.*eth5.*/tc qdisc add dev eth5 root netem delay $DELAYXR3\ms 0ms loss 0% limit 128000/" /etc/init.d/netem