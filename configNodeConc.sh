#!/bin/sh
# In case we're still booting into the GUI
sudo systemctl set-default multi-user.target

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install oracle-java8-jdk

sudo apt-get install libjpeg8-dev imagemagick libv4l-dev
sudo ln -s /usr/include/linux/videodev2.h /usr/include/linux/videodev.h

cp runCam.sh ~
mkdir ~/PiRemote
cp runPiRemote.sh ~/PiRemote

cp mjpg-streamer-code-182.zip ~
cd
unzip mjpg-streamer-code-182.zip
rm mjpg-streamer-code-182.zip
cd mjpg-streamer-code-182/mjpg-streamer
make mjpg_streamer input_file.so output_http.so
sudo cp mjpg_streamer /usr/local/bin
sudo cp output_http.so input_file.so /usr/local/lib/
sudo cp -R www /usr/local/www
mkdir /tmp/stream

echo The following must be done manually by running raspi-config:
echo   expand_rootfs
echo   keyboard - recommend en_US.UTF-8
echo   change password - highly recommended
echo   locale
echo   memory split - optional
echo   overclock - High for Pi, Pi2 for Pi2
echo   enable ssh
echo   enable camera - if used in remote config

