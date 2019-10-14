#!/bin/bash

# Get the links
PIPE=$(tr '\n' ' ' < /boot/html-links.txt)

# Add the tabs to .xsession
sed -i "/chromium-browser --start-fullscreen --window-size=1920,1080 --disable-infobars.*/c\\
chromium-browser --start-fullscreen --window-size=1920,1080 --disable-infobars $PIPE" /home/pi/.xsession



