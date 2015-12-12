#!/bin/bash
cd /home/pi/mjpg-streamer-code-182/mjpg-streamer
mkdir /tmp/stream
raspistill -w 640 -h 480 --vflip --hflip -q 20 -o /tmp/stream/pic.jpg -tl 1000 -t 0 -th none &
LD_LIBRARY_PATH=./ mjpg_streamer -i "input_file.so -f /tmp/stream -n pic.jpg" -o "output_http.so -p 8090 -w /usr/local/www" &
exit

