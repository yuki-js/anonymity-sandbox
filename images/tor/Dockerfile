FROM alpine:latest

EXPOSE 9050 9051 5353
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk add --no-cache tor nyx socat sudo


COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

COPY userland.sh /userland.sh
RUN chmod +x /userland.sh

WORKDIR /home/tor

CMD ["/launch.sh"]