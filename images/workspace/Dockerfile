FROM ghcr.io/yuki-js/dotfiles/dotimage:latest

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV XDG_RUNTIME_DIR /runtime
ENV WAYLAND_DISPLAY wayland-0
ENV MOZ_ENABLE_WAYLAND 1

# install necessary packages
RUN apt update && apt install -y x11-apps software-properties-common fonts-noto-cjk libfreetype6 libfontconfig1 libxcb-xfixes0 libegl1-mesa-dev libssl-dev libffi-dev build-essential xwayland nautilus python3-dev python3-pip netcat-openbsd openssh-server
RUN add-apt-repository ppa:mozillateam/ppa -y
RUN add-apt-repository ppa:aslatter/ppa -y
RUN apt install -y alacritty
RUN python3 -m pip install --break-system-packages nyx
RUN curl -fSsL "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US" -o firefox.tar.xz
RUN tar -xJf firefox.tar.xz -C /opt
RUN ln -sf /opt/firefox/firefox /usr/local/bin/firefox
RUN rm firefox.tar.xz

# install proxychains-ng
RUN curl -fSsL https://github.com/rofl0r/proxychains-ng/releases/download/v4.17/proxychains-ng-4.17.tar.xz -o proxychains-ng-4.17.tar.xz
RUN unxz proxychains-ng-4.17.tar.xz
RUN tar -xvf proxychains-ng-4.17.tar -C /tmp
WORKDIR /tmp/proxychains-ng-4.17
RUN ./configure --prefix=/usr --sysconfdir=/etc
RUN make
RUN make install
RUN make install-config
RUN rm -rf /proxychains-ng-4.17

COPY sshd_config /etc/ssh/sshd_config

# install vscode for linux
RUN curl -fSsL "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o vscode.deb
RUN apt install -y ./vscode.deb
RUN rm vscode.deb
RUN mv /usr/bin/code /usr/bin/code.orig
COPY code /usr/bin/code
RUN chmod +x /usr/bin/code


# create runtime directory
RUN mkdir -p $XDG_RUNTIME_DIR
RUN chown user:user $XDG_RUNTIME_DIR
RUN chmod 1777 $XDG_RUNTIME_DIR
RUN mkdir -p /run/sshd

# create launch script
COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

COPY userland.sh /userland.sh
RUN chmod +x /userland.sh

COPY proxychains.conf /home/user/.proxychains/proxychains.conf
RUN chown -R user:user /home/user/.proxychains/proxychains.conf

WORKDIR /home/user

CMD ["/launch.sh"]