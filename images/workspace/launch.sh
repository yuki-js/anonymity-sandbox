#!/bin/sh

/usr/sbin/sshd -D &

# run userland.sh with user `user` while preserving the environment
sudo -E -u user -H /userland.sh