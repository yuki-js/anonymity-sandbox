FROM ubuntu:22.04

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
RUN apt install -y firefox sudo alacritty libfreetype6 libfontconfig1 libxcb-xfixes0 libegl1-mesa-dev nautilus netcat build-essential libssl-dev libffi-dev python3-dev python3-pip

# install proxychains-ng
RUN curl -fSsL https://github.com/rofl0r/proxychains-ng/releases/download/v4.17/proxychains-ng-4.17.tar.xz -o proxychains-ng-4.17.tar.xz
RUN unxz proxychains-ng-4.17.tar.xz
RUN tar -xvf proxychains-ng-4.17.tar
WORKDIR /proxychains-ng-4.17
RUN ./configure --prefix=/usr --sysconfdir=/etc
RUN make
RUN make install
RUN make install-config
RUN rm -rf /proxychains-ng-4.17

RUN mkdir -p $XDG_RUNTIME_DIR
RUN chmod 1777 $XDG_RUNTIME_DIR

# create user
RUN adduser --disabled-password --gecos "" user
RUN usermod -aG sudo user
RUN echo "user:confirm" | chpasswd


USER user

COPY --chown=user:user launch.sh /home/user/launch.sh

CMD ["/home/user/launch.sh"]