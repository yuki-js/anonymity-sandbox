FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV XDG_RUNTIME_DIR /runtime
ENV WAYLAND_DISPLAY wayland-0
ENV MOZ_ENABLE_WAYLAND 1

# install necessary packages
RUN apt update && apt install -y x11-apps bash curl git software-properties-common sudo
RUN add-apt-repository ppa:mozillateam/ppa
RUN echo '\nPackage: *\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 1001\n' | tee /etc/apt/preferences.d/mozilla-firefox
RUN apt install -y firefox

RUN mkdir -p $XDG_RUNTIME_DIR
RUN chmod 1777 $XDG_RUNTIME_DIR

# create user
RUN adduser --disabled-password --gecos "" user
RUN usermod -aG sudo user
RUN echo "user:user" | chpasswd

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

USER user

CMD ["/usr/bin/firefox"]