#!/bin/sh
# JDK_ARCHIVE=OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.1_13.tar.gz
# JAVA_HOME=/var/opt/java/jdk-11.0.1+13

# In case we're still booting into the GUI
sudo systemctl set-default multi-user.target

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install oracle-java8-jdk

sudo apt-get install mosquitto mosquitto-clients

sudo apt-get install libjpeg8-dev imagemagick libv4l-dev
sudo ln -s /usr/include/linux/videodev2.h /usr/include/linux/videodev.h

# The only ARM builds available are 64 bit; revert to Oracle JDK8 32 bit until I can create my own build :(
# sudo mkdir /var/opt/java
# sudo tar -zxvf $JDK_ARCHIVE -C /var/opt/java
# sudo update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 1000
# sudo update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 1000
# sudo update-alternatives --install /usr/bin/javadoc javadoc $JAVA_HOME/bin/javadoc 1000
# sudo update-alternatives --install /usr/bin/javah javah $JAVA_HOME/bin/javah 1000
# sudo update-alternatives --install /usr/bin/javap javap $JAVA_HOME/bin/javap 1000

cp runCam.sh ~
cp stopCam.sh ~
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
# echo   add env var to .bashrc for JAVA_HOME - /var/opt/java/???

