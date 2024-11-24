FROM ubuntu:24.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV XDG_RUNTIME_DIR /runtime
ENV WAYLAND_DISPLAY wayland-0
ENV MOZ_ENABLE_WAYLAND 1

# install necessary packages
RUN apt update && apt install -y x11-apps bash curl git software-properties-common fonts-noto-cjk
RUN add-apt-repository ppa:mozillateam/ppa -y
RUN echo '\nPackage: *\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 1001\n' | tee /etc/apt/preferences.d/mozilla-firefox
RUN add-apt-repository ppa:aslatter/ppa -y
RUN apt install -y firefox sudo libfreetype6 libfontconfig1 libxcb-xfixes0 libegl1-mesa-dev libssl-dev libffi-dev

# install proxychains-ng
RUN apt install -y build-essential
RUN curl -fSsL https://github.com/rofl0r/proxychains-ng/releases/download/v4.17/proxychains-ng-4.17.tar.xz -o proxychains-ng-4.17.tar.xz
RUN unxz proxychains-ng-4.17.tar.xz
RUN tar -xvf proxychains-ng-4.17.tar
WORKDIR /proxychains-ng-4.17
RUN ./configure --prefix=/usr --sysconfdir=/etc
RUN make
RUN make install
RUN make install-config
RUN rm -rf /proxychains-ng-4.17

# install tools
RUN apt install -y xwayland nyx alacritty nautilus python3-dev python3-pip netcat-openbsd build-essential

# setup ssh server for debugging
RUN apt install -y openssh-server ssh-import-id
COPY sshd_config /etc/ssh/sshd_config
RUN ssh-import-id gh:yuki-js
RUN mkdir -p /run/sshd

# install vscode for linux
RUN curl -fSsL "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o vscode.deb
RUN apt install -y ./vscode.deb
RUN rm vscode.deb
RUN mv /usr/bin/code /usr/bin/code.orig
COPY code /usr/bin/code
RUN chmod +x /usr/bin/code


# create runtime directory
RUN mkdir -p $XDG_RUNTIME_DIR
RUN chmod 1777 $XDG_RUNTIME_DIR

# create launch script
COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

COPY userland.sh /userland.sh
RUN chmod +x /userland.sh


# create user
RUN adduser --disabled-password --gecos "" user
RUN usermod -aG sudo user
RUN echo "user:confirm" | chpasswd

WORKDIR /home/user

COPY proxychains.conf /home/user/.proxychains/proxychains.conf

CMD ["/launch.sh"]