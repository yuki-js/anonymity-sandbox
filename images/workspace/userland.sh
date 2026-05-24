#!/bin/sh

unset DISPLAY
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/runtime}"
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export LIBGL_ALWAYS_SOFTWARE=1
export MESA_LOADER_DRIVER_OVERRIDE=llvmpipe
export WINIT_UNIX_BACKEND=wayland

# Launch Firefox with a profile selector in background
firefox -P &

# launch alacritty terminal in background
alacritty &

# wait until the all the processes in the background are finished
wait

# exit the script
exit 0