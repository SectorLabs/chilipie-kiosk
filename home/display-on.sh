#!/bin/bash

# Using tv
#sudo tvservice -p > /dev/null && sudo chvt 2 && sudo chvt 1 # for whatever reason, cycling virtual terminals helps wake up the display in some cases

# Using cec-client
echo "on 0" | cec-client -s -d 1
