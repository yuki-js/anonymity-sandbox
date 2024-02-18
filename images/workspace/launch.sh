#!/bin/sh

# Launch Firefox with a profile selector in background
/usr/bin/firefox -P &

# launch alacritty terminal in background
alacritty &

# wait until the all the processes in the background are finished
wait

# exit the script
exit 0