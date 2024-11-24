### Run GUI Application in SSH Session

```sh
export DISPLAY=:0
export XDG_RUNTIME_DIR=/runtime
export WAYLAND_DISPLAY=wayland-0
export MOZ_ENABLE_WAYLAND=1
firefox -P
```

### Connect to SSH Server

1. Run `ip a` to get the IP address of the WSL2 instance.
2. Run `ssh -p 59722 user@<ip>` to connect to the SSH server.
3. Type `confirm` as the password of the user.

### Use VS Code

```sh
code
```

If it doesn't work, run `/usr/share/code/bin/code --no-sandbox --ozone-platform=wayland` instead.

### Use Proxychains-ng

1. Edit the configuration file.

```sh
code ~/.proxychains/proxychains.conf
```

2. Run the following command.

```sh
proxychains4 -f ~/.proxychains/proxychains.conf firefox -P
```
