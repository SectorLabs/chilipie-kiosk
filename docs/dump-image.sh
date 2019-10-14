SD_SIZE_SAFE=2800 # this is in MB

function working {
  echo -e "\n✨  $1"
}
function question {
  echo -e "\n🛑  $1"
}


question "Enter version (e.g. \"1.2.3\") being dumped:"
read TAG

working "Figuring out SD card device"
# We do this again now just to be safe
diskutil list
DISK="$(diskutil list | grep /dev/ | grep external | grep physical | cut -d ' ' -f 1 | head -n 1)"

question "Based on the above, SD card determined to be \"$DISK\" (should be e.g. \"/dev/disk2\"), press enter to continue"
read

working "Dumping the image from the card"
cd ..
echo "This may take a long time"
echo "You may be prompted for your password by sudo"
sudo dd bs=1m count="$SD_SIZE_SAFE" if="$DISK" of="chilipie-kiosk-$TAG.img"

working "Compressing image"
COPYFILE_DISABLE=1 tar -zcvf chilipie-kiosk-$TAG.img.tar.gz chilipie-kiosk-$TAG.img

working "Listing image sizes"
du -hs chilipie-kiosk-$TAG.img*

working "Calculating image hashes"
openssl sha1 chilipie-kiosk-$TAG.img*

echo "Done"
