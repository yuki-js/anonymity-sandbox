#!/bin/sh

# relay the port 22 to the workspace container's port 22
socat tcp-listen:22,reuseaddr,fork tcp:workspace:22 &

# run userland.sh with user `tor`
sudo -u tor -H /userland.sh