FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt update && apt install -y bash encfs

RUN adduser --disabled-password --gecos "" user
RUN usermod -aG sudo user
RUN echo "user:user" | chpasswd

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 555 /entrypoint.sh

USER user

CMD ["/entrypoint.sh"]
