#!/bin/bash

# Using tvservice  
#sudo tvservice -o > /dev/null

# Using cec-client
echo "standby 0" | cec-client -s -d 1
