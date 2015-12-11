#!/bin/sh
# In case we're still booting into the GUI
sudo systemctl set-default multi-user.target

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install oracle-java8-jdk

sudo apt-get install libjpeg8-dev
sudo apt-get install imagemagick
tar xvzf mjpg-streamer*.tar.gz
cd mjpg-streamer*
make
cp mjpg_streamer /usr/local/bin
cp input_*.so /usr/local/bin
cp output_*.so /usr/local/bin

cp runCam.sh ~
mkdir ~/PiRemote
cp runPiRemote.sh ~/PiRemote

echo The following must be done manually by running raspi-config:
echo   expand_rootfs
echo   keyboard (recommend en_US.UTF-8)
echo   change password (highly recommended)
echo   locale
echo   memory split (optional)
echo   overclock (High for Pi, Pi2 for Pi2)  :)
echo   enable ssh
echo   enable camera (if used in remote config)

